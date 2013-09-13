<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="*:complexType" mode="classes-doc">
  <xsl:element name="class">
    <xsl:attribute name="className"><xsl:copy-of select="@name"/></xsl:attribute>
    <xsl:if test="*:complexContent/*:extension">
      <xsl:attribute name="extends">
        <xsl:apply-templates select="*:complexContent/*:extension" mode="extends"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select=".//*:element" mode="properties"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*:extension" mode="extends">
  <xsl:value-of select="substring-after(@base, ':')"/>
</xsl:template>

<xsl:template match="*:element" mode="properties">
  <xsl:element name="property">
    <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
