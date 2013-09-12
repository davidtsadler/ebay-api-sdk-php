<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xsl:template match="xs:complexType" mode="classes-doc">
  <xsl:element name="class">
    <xsl:attribute name="className"><xsl:copy-of select="@name"/></xsl:attribute>
  </xsl:element>
</xsl:template>
</xsl:stylesheet>
