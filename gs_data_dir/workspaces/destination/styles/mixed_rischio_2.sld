<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>risk</Name>
    <UserStyle>
      <Title>risk</Title>
      <Abstract>risk</Abstract>
      <FeatureTypeStyle>
      <Transformation>
            <ogc:Function name="gs:RiskCalculator">
              <ogc:Function name="parameter">
                <ogc:Literal>features</ogc:Literal>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>store</ogc:Literal>
                <ogc:Literal>destination</ogc:Literal>
              </ogc:Function>
              
              <ogc:Function name="parameter">
                <ogc:Literal>formula</ogc:Literal>
                <ogc:Function name="env">
                   <ogc:Literal>formula</ogc:Literal>
                   <ogc:Literal>16</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>target</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>target</ogc:Literal>
                  <ogc:Literal>0</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>materials</ogc:Literal>
                <ogc:Function name="env">
                   <ogc:Literal>materials</ogc:Literal>
                   <ogc:Literal>1,4</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>scenarios</ogc:Literal>
                <ogc:Function name="env">
                   <ogc:Literal>scenarios</ogc:Literal>
                   <ogc:Literal>4,5</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>entities</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>entities</ogc:Literal>
                  <ogc:Literal>0,1</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
             <ogc:Function name="parameter">
                <ogc:Literal>severeness</ogc:Literal>
                <ogc:Function name="env">
                   <ogc:Literal>severeness</ogc:Literal>
                   <ogc:Literal>1,2,3,4,5</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>fp</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>fp</ogc:Literal>
                  <ogc:Literal>fp_scen_centrale</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>processing</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>processing</ogc:Literal>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>pis</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>pis</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
               <ogc:Function name="parameter">
                <ogc:Literal>padr</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>padr</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
               <ogc:Function name="parameter">
                <ogc:Literal>cff</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>cff</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>changedTargets</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>changedTargets</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>distances</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>distances</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>damageArea</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>damageArea</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
            </ogc:Function>
          </Transformation>
   <Rule>
      <Title>Basso-Basso
    <Localized lang="it">Basso-Basso</Localized>
      <Localized lang="en">Low-Low</Localized>
      <Localized lang="fr">Basso-Basso</Localized>
      <Localized lang="de">Niedriges-Niedriges</Localized>
  </Title>
    <Abstract>Basso-Basso</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#14F200</CssParameter>
      <CssParameter name="stroke-width">12</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
   <Rule>
    <Title>Basso-Medio
    <Localized lang="it">Basso-Medio</Localized>
      <Localized lang="en">Low-Medium</Localized>
      <Localized lang="fr">Basso-Medio</Localized>
      <Localized lang="de">Niedriges-Mittleres</Localized>
  </Title>
    <Abstract>Basso-Medio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#0A7900</CssParameter>
      <CssParameter name="stroke-width">13</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
   <Rule>
    <Title>Basso-Alto
    <Localized lang="it">Basso-Alto</Localized>
      <Localized lang="en">Low-High</Localized>
      <Localized lang="fr">Basso-Alto</Localized>
      <Localized lang="de">Niedriges-Hohes</Localized>  
  </Title>
    <Abstract>Basso-Alto</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#053800</CssParameter>
      <CssParameter name="stroke-width">14</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
   <Rule>
    <Title>Medio-Basso
    <Localized lang="it">Medio-Basso</Localized>
      <Localized lang="en">Medium-Low</Localized>
      <Localized lang="fr">Medio-Basso</Localized>
      <Localized lang="de">Mittleres-Niedriges</Localized>    
  </Title>
    <Abstract>Medio-Basso</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#A5FB00</CssParameter>
      <CssParameter name="stroke-width">13</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
   <Rule>
    <Title>Medio-Medio
    <Localized lang="it">Medio-Medio</Localized>
      <Localized lang="en">Medium-Medium</Localized>
      <Localized lang="fr">Medio-Medio</Localized>
      <Localized lang="de">Mittleres-Mittleres</Localized>    
  </Title>
    <Abstract>Medio-Medio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#FFFB00</CssParameter>
      <CssParameter name="stroke-width">14</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
   <Rule>
    <Title>Medio-Alto
    <Localized lang="it">Medio-Alto</Localized>
      <Localized lang="en">Medium-High</Localized>
      <Localized lang="fr">Medio-Alto</Localized>
      <Localized lang="de">Mittleres-Hohes</Localized>  
  </Title>
    <Abstract>Medio-Alto</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#FF9800</CssParameter>
      <CssParameter name="stroke-width">15</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
   <Rule>
    <Title>Alto-Basso
    <Localized lang="it">Alto-Basso</Localized>
      <Localized lang="en">High-Low</Localized>
      <Localized lang="fr">Alto-Basso</Localized>
      <Localized lang="de">Hohes-Niedriges</Localized>
  </Title>
    <Abstract>Alto-Basso</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#FFB4B4</CssParameter>
      <CssParameter name="stroke-width">14</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
   <Rule>
    <Title>Alto-Medio
    <Localized lang="it">Alto-Medio</Localized>
      <Localized lang="en">High-Medium</Localized>
      <Localized lang="fr">Alto-Medio</Localized>
      <Localized lang="de">Hohes-Mittleres</Localized>  
  </Title>
    <Abstract>Alto-Medio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#FF6A6A</CssParameter>
      <CssParameter name="stroke-width">15</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
   <Rule>
    <Title>Alto-Alto
    <Localized lang="it">Alto-Alto</Localized>
      <Localized lang="en">High-High</Localized>
      <Localized lang="fr">Alto-Alto</Localized>
      <Localized lang="de">Hohes-Hohes</Localized>  
  </Title>
    <Abstract>Alto-Alto</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MaxScaleDenominator>500000</MaxScaleDenominator>
     <MinScaleDenominator>17070</MinScaleDenominator>
   <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
     <Stroke>
      <CssParameter name="stroke">#FF0000</CssParameter>
      <CssParameter name="stroke-width">16</CssParameter>
     </Stroke>
   </LineSymbolizer>
   </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>