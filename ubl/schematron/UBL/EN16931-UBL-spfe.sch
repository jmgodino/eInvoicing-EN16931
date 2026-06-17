<!--

    Licensed under European Union Public Licence (EUPL) version 1.2.

-->

<!-- Si hay IVA soportado, los tipos están tasados a nivel de desglose de IVA -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SPFE-model">
  <rule context="cac:TaxTotal/cac:TaxSubtotal" flag="fatal">
    <assert
      test="exists(cac:TaxCategory) and (not(cac:TaxCategory/cbc:ID = 'S') or cac:TaxCategory/cbc:Percent = (21, 10, 4, 0, 6, 25, 15, 12))" 
      id="BR-ES-01" 
      flag="fatal">[BR-ES-01]-Tipo no válido [<value-of select="cac:TaxCategory/cbc:Percent"/>]. En el desglose de IVA, los tipos del IVA admitidos son 21%, 10% y 4%.</assert>
  </rule>

  <rule context="cac:InvoiceLine" flag="fatal">
    <assert
      test="exists(cac:Item/cac:ClassifiedTaxCategory) and (not(cac:Item/cac:ClassifiedTaxCategory/cbc:ID = 'S') or cac:Item/cac:ClassifiedTaxCategory/cbc:Percent = (21, 10, 4, 0, 6, 25, 15, 12))" 
      id="BR-ES-02" 
      flag="fatal">[BR-ES-02]-Tipo no válido [<value-of select="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>]. Los tipos del IVA admitidos para los bienes y servicios facturados son 21%, 10% y 4%.</assert>
  </rule>
</pattern>