<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
  xmlns:dts="http://davidtsadler.com/">

<xsl:template match="wsdl:operation" mode="operations-doc">
  <xsl:element name="operation">
    <xsl:attribute name="name"><xsl:copy-of select="@name"/></xsl:attribute>
    <xsl:attribute name="method-name"><xsl:copy-of select="concat(lower-case(substring(@name, 1, 1)), substring(@name, 2))"/></xsl:attribute>
    <xsl:attribute name="request-type">
      <xsl:apply-templates select="wsdl:input" mode="operations-doc"/>
    </xsl:attribute>
    <xsl:attribute name="response-type">
      <xsl:apply-templates select="wsdl:output" mode="operations-doc"/>
    </xsl:attribute>
    <xsl:attribute name="request-xml-root">
      <xsl:copy-of select="substring-after(wsdl:input/@message, ':')"/>
    </xsl:attribute>
  </xsl:element>
</xsl:template>

<xsl:template match="wsdl:input|wsdl:output" mode="operations-doc">
  <xsl:variable name="local-name" select="substring-after(@message, ':')"/>
  <xsl:variable name="type" select="substring-after(//xs:element[@name=$local-name]/@type, ':')"/>
  <xsl:copy-of select="concat(upper-case(substring($type, 1, 1)), substring($type, 2))"/>
</xsl:template>
</xsl:stylesheet>
