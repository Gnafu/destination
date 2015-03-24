<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
 xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
 xmlns="http://www.opengis.net/sld" 
 xmlns:ogc="http://www.opengis.net/ogc" 
 xmlns:xlink="http://www.w3.org/1999/xlink" 
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- a Named Layer is the basic building block of an SLD document -->
  <NamedLayer>
    <Name>default_line</Name>
    <UserStyle>
    <!-- Styles can have names, titles and abstracts -->
      <Title>Default Line</Title>
      <Abstract>A sample style that draws a line</Abstract>
      <!-- FeatureTypeStyles describe how to render different features -->
      <!-- A FeatureTypeStyle for rendering lines -->
      <FeatureTypeStyle>
        <Rule>
          <Name>rule1</Name>
          <Title>Blue Line</Title>
          <Abstract>A solid blue line with a 1 pixel width</Abstract>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#0000FF</CssParameter>
              <CssParameter name="stroke-width">3</CssParameter>
            </Stroke>
          </LineSymbolizer>
        <TextSymbolizer>
         <Label>
           <Literal>Percorso a minima distanza</Literal>
         </Label>
          <Font>
           <CssParameter name="font-family">Arial</CssParameter>
           <CssParameter name="font-size">12</CssParameter>
           <CssParameter name="font-style">normal</CssParameter>
           <CssParameter name="font-weight">bold</CssParameter>
         </Font>
         <LabelPlacement>
            <LinePlacement />
         </LabelPlacement>
         <Fill>
           <CssParameter name="fill">#000000</CssParameter>
         </Fill>
         <Halo>
           <Radius>2</Radius>
           <Fill>
             <CssParameter name="fill">#FFFFFF</CssParameter>
           </Fill>
          </Halo>
         <VendorOption name="followLine">true</VendorOption>
         <VendorOption name="maxAngleDelta">90</VendorOption>
         <VendorOption name="maxDisplacement">400</VendorOption>
         <VendorOption name="repeat">1000</VendorOption>
          <VendorOption name="group">yes</VendorOption>
       </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>