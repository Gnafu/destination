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
      <Localized lang="fr">Basso</Localized>
      <Localized lang="de">Niedriges</Localized>
    </Title>
          <Abstract>Linea per Basso Incidentale</Abstract>
          <ogc:Filter>
              <ogc:PropertyIsLessThanOrEqualTo>
                   <ogc:Function name="round">
                     <ogc:Div>
                       <ogc:PropertyName>rischio</ogc:PropertyName>
                       <ogc:PropertyName>lunghezza</ogc:PropertyName>
                     </ogc:Div>             
                   </ogc:Function>
                   <ogc:Function name="env">
                       <ogc:Literal>low</ogc:Literal>
                    </ogc:Function>
              </ogc:PropertyIsLessThanOrEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>17070</MinScaleDenominator>
          <MaxScaleDenominator>500000</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#14F200</CssParameter>
              <CssParameter name="stroke-width">12</CssParameter>
            </Stroke>
          </LineSymbolizer>
          
        </Rule>

        <Rule>
          <Title>Medio
      <Localized lang="it">Medio</Localized>
      <Localized lang="en">Medium</Localized>
      <Localized lang="fr">Medio</Localized>
      <Localized lang="de">Mittleres</Localized>
    </Title>
          <Abstract>Linea per Medio Incidentale</Abstract>
          <ogc:Filter>
              <ogc:And>
                <ogc:PropertyIsLessThanOrEqualTo>
                   <ogc:Function name="round">
                     <ogc:Div>
                       <ogc:PropertyName>rischio</ogc:PropertyName>
                       <ogc:PropertyName>lunghezza</ogc:PropertyName>
                     </ogc:Div>             
                   </ogc:Function>
                   <ogc:Function name="env">
                       <ogc:Literal>medium</ogc:Literal>
                    </ogc:Function>
                </ogc:PropertyIsLessThanOrEqualTo>
                <ogc:PropertyIsGreaterThanOrEqualTo>
                   <ogc:Function name="round">
                     <ogc:Div>
                       <ogc:PropertyName>rischio</ogc:PropertyName>
                       <ogc:PropertyName>lunghezza</ogc:PropertyName>
                     </ogc:Div>             
                   </ogc:Function>
                   <ogc:Function name="env">
                       <ogc:Literal>low</ogc:Literal>
                    </ogc:Function>
                </ogc:PropertyIsGreaterThanOrEqualTo>
              </ogc:And>
          </ogc:Filter>
          <MinScaleDenominator>17070</MinScaleDenominator>
          <MaxScaleDenominator>500000</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FFFB00</CssParameter>
              <CssParameter name="stroke-width">14</CssParameter>
            </Stroke>
          </LineSymbolizer>
          
        </Rule>
        
        
        <Rule>
              <Title>Alto
      <Localized lang="it">Alto</Localized>
      <Localized lang="en">High</Localized>
      <Localized lang="fr">Alto</Localized>
      <Localized lang="de">Hohes</Localized>
    </Title>
          <Abstract>Linea per Alto Incidentale</Abstract>
          <ogc:Filter>
            <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:Function name="round">
                   <ogc:Div>
                     <ogc:PropertyName>rischio</ogc:PropertyName>
                     <ogc:PropertyName>lunghezza</ogc:PropertyName>
                   </ogc:Div>             
                 </ogc:Function>
               <ogc:Function name="env">
                       <ogc:Literal>medium</ogc:Literal>
                    </ogc:Function>
            </ogc:PropertyIsGreaterThanOrEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>17070</MinScaleDenominator>
          <MaxScaleDenominator>500000</MaxScaleDenominator>
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