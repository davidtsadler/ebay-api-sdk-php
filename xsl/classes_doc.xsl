<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:dts="http://davidtsadler.com/">

<xsl:template match="*:complexType" mode="classes-doc">
  <xsl:element name="class">
    <xsl:attribute name="className"><xsl:copy-of select="@name"/></xsl:attribute>
    <xsl:if test=".//*:extension">
      <xsl:attribute name="extends">
        <xsl:apply-templates select=".//*:extension" mode="extends"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select=".//*:element" mode="properties"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*:extension" mode="extends">
  <xsl:value-of select="dts:base_to_type(substring-after(@base, ':'))"/>
</xsl:template>

<xsl:template match="*:element" mode="properties">
  <xsl:element name="property">
    <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
  </xsl:element>
</xsl:template>

<xsl:function name="dts:base_to_type" as="xs:string">
  <xsl:param name="base" as="xs:string"/>
  <xsl:choose>
    <xsl:when test="$base='base64Binary'">
      <xsl:text>Base64BinaryType</xsl:text>
    </xsl:when>
    <xsl:when test="$base='boolean'">
      <xsl:text>BooleanType</xsl:text>
    </xsl:when>
    <xsl:when test="$base='decimal'">
      <xsl:text>DecimalType</xsl:text>
    </xsl:when>
    <xsl:when test="$base='double'">
      <xsl:text>DoubleType</xsl:text>
    </xsl:when>
    <xsl:when test="$base='int'">
      <xsl:text>IntegerType</xsl:text>
    </xsl:when>
    <xsl:when test="$base='string'">
      <xsl:text>StringType</xsl:text>
    </xsl:when>
    <xsl:when test="$base='token'">
      <xsl:text>TokenType</xsl:text>
    </xsl:when>
    <xsl:when test="$base='anyURI'">
      <xsl:text>URIType</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$base"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

</xsl:stylesheet>
