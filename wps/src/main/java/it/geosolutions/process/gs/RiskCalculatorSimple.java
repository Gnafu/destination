/*
 *    GeoTools - The Open Source Java GIS Toolkit
 *    http://geotools.org
 *
 *    (C) 2002-2011, Open Source Geospatial Foundation (OSGeo)
 *
 *    This library is free software; you can redistribute it and/or
 *    modify it under the terms of the GNU Lesser General Public
 *    License as published by the Free Software Foundation;
 *    version 2.1 of the License.
 *
 *    This library is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *    Lesser General Public License for more details.
 */
package it.geosolutions.process.gs;

import it.geosolutions.destination.utils.Formula;
import it.geosolutions.destination.utils.FormulaUtils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.geoserver.catalog.Catalog;
import org.geoserver.catalog.DataStoreInfo;
import org.geoserver.config.GeoServerDataDirectory;
import org.geotools.data.DataStoreFinder;
import org.geotools.data.DefaultTransaction;
import org.geotools.jdbc.JDBCDataStore;
import org.geotools.process.factory.DescribeParameter;
import org.geotools.process.factory.DescribeProcess;
import org.geotools.process.factory.DescribeResult;
import org.geotools.util.logging.Logging;
import org.json.simple.parser.ParseException;

/**
 * WPS Process for no roads depending formula calculations.
 * 
 * @author "Mauro Bartolomeoli - mauro.bartolomeoli@geo-solutions.it"
 *
 */
@DescribeProcess(title = "RiskCalculatorSimple", description = "Dynamically calculates risk not depending road arcs.")
public class RiskCalculatorSimple extends RiskCalculatorBase {
	private static final Logger LOGGER = Logging.getLogger(RiskCalculatorSimple.class);

	private String downloadFolder;
	
	/**
	 * @param catalog
	 */
	public RiskCalculatorSimple(Catalog catalog, GeoServerDataDirectory dataDirectory) {
		super(catalog);
		downloadFolder = dataDirectory.root()
                        .getAbsolutePath()
                        + File.separator
                        + "www"
                        + File.separator
                        + "downloads";
	}
	
	@DescribeResult(description = "Risk calculus result")
	public String execute(			
			@DescribeParameter(name = "store", description = "risk data store name") String storeName,
			@DescribeParameter(name = "batch", description = "batch calculus size", min = 0) Integer batch,
			@DescribeParameter(name = "precision", description = "output value precision (decimals)", min = 0) Integer precision,
			@DescribeParameter(name = "connection", description = "risk database connection params", min = 0) String connectionParams,
			@DescribeParameter(name = "processing", description = "id of the processing type") int processing,
			@DescribeParameter(name = "formula", description = "id of the formula to calculate") int formula,
			@DescribeParameter(name = "target", description = "id of the target/s to use in calculation") int target,
			@DescribeParameter(name = "materials", description = "ids of the materials to use in calculation") String materials,
			@DescribeParameter(name = "kemler", description = "id of the specific material, 0 if materials needs to be used") String kemler,
			@DescribeParameter(name = "scenarios", description = "ids of the scenarios to use in calculation") String scenarios,
			@DescribeParameter(name = "entities", description = "ids of the entities to use in calculation") String entities,
			@DescribeParameter(name = "severeness", description = "ids of the severeness to use in calculation") String severeness,
			@DescribeParameter(name = "fp", description = "fields to use for fp calculation", min = 0) String fpfield,
			@DescribeParameter(name = "download", description = "produce downloadable file", min = 0) boolean download,
			@DescribeParameter(name = "language", description = "optional field containing language to be used in localized data", min = 0) String language
		) throws IOException, SQLException {
	    
    	        // default language if non specified
                if(language == null) {
                        language = "it";
                }
		// building DataStore connection using Catalog/storeName or connection input parameters
		JDBCDataStore dataStore = null;
		if(catalog != null && storeName != null) {
			LOGGER.info("Loading DataStore " + storeName + " from Catalog");
			DataStoreInfo dataStoreInfo = catalog.getDataStoreByName(storeName);
			if(dataStoreInfo == null) {
				LOGGER.severe("DataStore not found");
				throw new IOException("DataStore not found: " + storeName);
			}
			dataStore = (JDBCDataStore)dataStoreInfo.getDataStore(null);
		} else if(connectionParams != null) {
			dataStore = (JDBCDataStore)DataStoreFinder.getDataStore(getConnectionParameters(connectionParams));
		} else {
			throw new IOException(
					"DataStore connection not configured, either catalog, storeName or connectionParams are not available");
		}
		
		if(batch == null) {
			batch = 10000;
		}
		if(precision == null) {
			precision = 3;
		}
		DefaultTransaction transaction = new DefaultTransaction();
		Connection conn = null;
		try {
			conn = dataStore.getConnection(transaction);
			Formula formulaDescriptor = Formula.load(conn, processing, formula, target);
			fillWithCriterias(conn, formula, formulaDescriptor);
			JSONObject result = new JSONObject();
			String[] targetsList;
			
			if(!FormulaUtils.isSimpleTarget(target) && !formulaDescriptor.aggregateTargets()) {								
				if(FormulaUtils.isAllNotHumanTargets(target)) {
					targetsList = FormulaUtils.notHumanTargetsList.split(",");					
				} else {
					targetsList = FormulaUtils.humanTargetsList.split(",");
				}
				
			} else {
				targetsList = new String[] {target +""};				
			}
			calculateFormulaForAllTargets(conn, processing, formulaDescriptor, materials, kemler, scenarios, entities, severeness, fpfield, targetsList, result, precision);
			if(download) {
			    try {
                                return writeToCsv(language, formulaDescriptor, result.toString());
                            } catch (ParseException e) {
                                throw new IOException("Cannot parse result", e);
                            }
			} else {
			    return result.toString();
			}
		} finally {				
			transaction.close();
			if(conn != null) {
				conn.close();
			}
		}
	}

	private String writeToCsv(String language, Formula formula, String fcString) throws ParseException, IOException {
	    String riskCSVFileName = UUID.randomUUID().toString() + ".csv";
	    
            JSONObject root = (JSONObject)JSONSerializer.toJSON(fcString);
            JSONArray targets = (JSONArray)root.get("targets");
            BufferedWriter writer = null;
            try {
                    writer = new BufferedWriter(new FileWriter(downloadFolder + File.separator + riskCSVFileName));
                    String header = "";
                    if(targets.size() > 1) {
                            header += ",Tipo Bersaglio";
                    }
                    if(((JSONArray)((JSONObject)targets.get(0)).get("scenarios")).size() > 1) {
                            header += ",Incidenti";
                    }
                    if(((JSONArray)((JSONObject)((JSONArray)((JSONObject)targets.get(0)).get("scenarios")).get(0)).get("severeness")).size() > 1) {
                            header += ",Gravità";
                    }
                    writer.write(header.substring(1)+","+formula.getDescription()+"\n");
                    for(int i = 0; i < targets.size(); i++) {
                            
                            JSONObject targetObj = (JSONObject)targets.get(i);
                            JSONArray scenarioArr = (JSONArray)targetObj.get("scenarios");
                            for(int j = 0; j < scenarioArr.size(); j++) {
                                    JSONObject scenarioObj = (JSONObject)scenarioArr.get(j);
                                    JSONArray severenessArr = (JSONArray)scenarioObj.get("severeness");
                                    for(int k = 0; k < severenessArr.size(); k++) { 
                                            String row = "";
                                            JSONObject severenessObj = (JSONObject)severenessArr.get(k);
                                            if(targets.size() > 1) {
                                                    row += "," + DestinationDownload.allTargets.get(targetObj.get("id")+"."+language);
                                            }
                                            if(scenarioArr.size() > 1) {
                                                    row += "," + DestinationDownload.allScenarios.get(scenarioObj.get("id")+"."+language);
                                            }
                                            if(severenessArr.size() > 1) {
                                                    row += "," + DestinationDownload.allSevereness.get(severenessObj.get("id")+"."+language);
                                            }
                                            writer.write(row.substring(1)+","+((JSONArray)severenessObj.get("risk")).get(0)+"\n");
                                    }
                            }                               
                    }
                    return riskCSVFileName;
            } finally {
                    if(writer != null) {
                            writer.close();
                    }
            }        }

    /**
	 * @param result
	 * @param risk
	 */
	private void fillRisk(JSONObject result, Double[] risk) {
		JSONArray riskArray = new JSONArray();
		for(double riskVal : risk) {
			riskArray.add(riskVal);
		}
		result.accumulate("risk", riskArray);		
	}

	/**
	 * @param conn
	 * @param formulaDescriptor
	 * @param materials
	 * @param scenarios
	 * @param entities
	 * @param severeness
	 * @param targetsList
	 * @throws SQLException 
	 * @throws NumberFormatException 
	 */
	private void calculateFormulaForAllTargets(Connection conn, int processing,
			Formula formulaDescriptor, String materials, String kemler, String scenarios,
			String entities, String severeness, String fpfield, String[] targets, JSONObject result, int precision) throws NumberFormatException, SQLException {
		JSONArray targetsArray = new JSONArray();
		
		for(String target : targets) {
			int targetId = Integer.parseInt(target);	
			JSONObject targetObj = new JSONObject();
			targetObj.accumulate("id", targetId);
			
			if(!formulaDescriptor.aggregateScenarios()) {										
					calculateFormulaForAllScenarios(conn, processing, formulaDescriptor,
							materials, kemler, scenarios.split(","), entities,
							severeness, fpfield, targetId, targetObj, precision);								
			} else {
				calculateFormulaForAllScenarios(conn, processing, formulaDescriptor,
						materials, kemler, new String[] {scenarios}, entities,
						severeness, fpfield, targetId, targetObj, precision);			
				//fillRisk(targetObj, getRisk(conn, 0, formulaDescriptor, materials, scenarios, entities, severeness, targetId));
			}
			targetsArray.add(targetObj);
		}
		result.accumulate("targets", targetsArray);
		
	}

	/**
	 * @param conn
	 * @param formulaDescriptor
	 * @param materials
	 * @param scenarios
	 * @param entities
	 * @param severeness
	 * @param targetId
	 * @return
	 * @throws SQLException 
	 */
	private void calculateFormulaForAllScenarios(Connection conn, int processing,
			Formula formulaDescriptor, String materials, String kemler, String[] scenarios,
			String entities, String severeness, String fpfield, int targetId, JSONObject result, int precision) throws SQLException {
		JSONArray scenariosArray = new JSONArray();
		
		for(String scenario : scenarios) {			
			JSONObject scenarioObj = new JSONObject();
			scenarioObj.accumulate("id", scenario);			
			if(!formulaDescriptor.aggregateSevereness()) {
				calculateFormulaAllSevereness(conn, processing, formulaDescriptor,
						materials, kemler, scenario, entities,
						severeness.split(","), fpfield, targetId, scenarioObj, precision);		
			} else {
				calculateFormulaAllSevereness(conn, processing, formulaDescriptor,
						materials, kemler, scenario, entities,
						new String[] {severeness}, fpfield, targetId, scenarioObj, precision);
			}
			//fillRisk(scenarioObj, getRisk(conn, 0, formulaDescriptor, materials, scenario, entities, severeness, targetId));
			scenariosArray.add(scenarioObj);
		}
		result.accumulate("scenarios", scenariosArray);
		
	}
	
	private void calculateFormulaAllSevereness(Connection conn, int processing,
			Formula formulaDescriptor, String materials, String kemler, String scenario,
			String entities, String[] severeness, String fpfield, int targetId, JSONObject result, int precision) throws SQLException {
		JSONArray severenessArray = new JSONArray();
		
		String fk_partner = null;
		for(String sev : severeness) {			
			JSONObject severenessObj = new JSONObject();
			severenessObj.accumulate("id", sev);			
			
			fillRisk(severenessObj, FormulaUtils.calculateFormulaValues(conn,
					0, processing, formulaDescriptor, fk_partner, materials, kemler, scenario, entities, sev, fpfield,
					targetId, null, precision));
			severenessArray.add(severenessObj);
		}
		result.accumulate("severeness", severenessArray);
		
	}

	/**
	 * @param conn
	 * @param formulaDescriptor
	 * @throws SQLException 
	 */
	private void fillWithCriterias(Connection conn, int formula, Formula formulaDescriptor) throws SQLException {		
		String sql =  "select id_criterio, flg_obbligatorio, flg_aggregabile ";
	       sql += "from siig_mtd_r_formula_criterio ";	       
	       sql += "where id_formula=?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, formula);		
			rs = stmt.executeQuery();			
			while(rs.next()) {
				formulaDescriptor.addCriteria(rs.getInt(1), rs.getInt(2) == 1, rs.getInt(3) == 1);								
			}
			
		} finally {
			if(rs != null) {
				rs.close();				
			}
			if(stmt != null) {
				stmt.close();
			}
			
		}
	}
	
}
