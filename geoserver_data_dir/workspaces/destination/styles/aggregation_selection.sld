<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>Default Line</Name>
    <UserStyle>
      <Title>1 px blue line</Title>
      <Abstract>Default line style, 1 pixel wide blue</Abstract>

      <FeatureTypeStyle>
        <Rule>
          <Title>Basso
            <Localized lang="it">Basso</Localized>
            <Localized lang="en">Low</Localized>
            <Localized lang="fr">Faible</Localized>
            <Localized lang="de">Niedriges</Localized>
          </Title>
          <Abstract>Linea per Basso Incidentale</Abstract>
          <ogc:Filter>
              <ogc:PropertyIsLessThanOrEqualTo>
                   <ogc:PropertyName>calc_formula_tot</ogc:PropertyName>
                   <ogc:Literal>6000</ogc:Literal>
              </ogc:PropertyIsLessThanOrEqualTo>
          </ogc:Filter>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#14F200</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>

        <Rule>
          <Title>Medio
            <Localized lang="it">Medio</Localized>
            <Localized lang="en">Medium</Localized>
            <Localized lang="fr">Moyen</Localized>
            <Localized lang="de">Mittleres</Localized>  
          </Title>
          <Abstract>Linea per Medio Incidentale</Abstract>
          <ogc:Filter>
              <ogc:And>
                <ogc:PropertyIsLessThanOrEqualTo>
                   <ogc:PropertyName>calc_formula_tot</ogc:PropertyName>
                   <ogc:Literal>25000</ogc:Literal>
                </ogc:PropertyIsLessThanOrEqualTo>
                <ogc:PropertyIsGreaterThanOrEqualTo>
                   <ogc:PropertyName>calc_formula_tot</ogc:PropertyName>
                   <ogc:Literal>6001</ogc:Literal>
                </ogc:PropertyIsGreaterThanOrEqualTo>
              </ogc:And>
          </ogc:Filter>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FFFB00</CssParameter>
              <CssParameter name="stroke-width">4</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        
        
        <Rule>
          <Title>Alto
            <Localized lang="it">Alto</Localized>
            <Localized lang="en">High</Localized>
            <Localized lang="fr">Haut</Localized>
            <Localized lang="de">Hohes</Localized> 
          </Title>          
          <Abstract>Linea per Alto Incidentale</Abstract>
          <ogc:Filter>
            <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:PropertyName>calc_formula_tot</ogc:PropertyName>
               <ogc:Literal>25001</ogc:Literal>
            </ogc:PropertyIsGreaterThanOrEqualTo>
          </ogc:Filter>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FF0000</CssParameter>
              <CssParameter name="stroke-width">6</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>