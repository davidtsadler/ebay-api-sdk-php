<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xsl:template match="*:complexType" mode="classes-doc">
  <xsl:element name="class">
    <xsl:attribute name="className"><xsl:copy-of select="@name"/></xsl:attribute>
    <xsl:if test="*:complexContent/xs:extension">
      <xsl:attribute name="extends">
        <xsl:apply-templates select="xs:complexContent/xs:extension" mode="extends"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:element>
</xsl:template>

<xsl:template match="*:extension" mode="extends">
  <xsl:value-of select="substring-after(@base, ':')"/>
</xsl:template>

</xsl:stylesheet>
