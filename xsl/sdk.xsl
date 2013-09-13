<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
  exclude-result-prefixes="xs">

<xsl:output method="text" encoding="UTF-8"/>

<xsl:include href="classes_doc.xsl"/>

<xsl:param name="service" required="yes" as="xs:string"/>
<xsl:param name="destDirectory" required="yes" as="xs:string"/>

<xsl:template match="/">
  <xsl:variable name="classes" as="element()+">
    <xsl:apply-templates select="/wsdl:definitions/wsdl:types/xs:schema/xs:complexType" mode="classes-doc"/>
  </xsl:variable>
  <xsl:apply-templates select="$classes" mode="php"/>
</xsl:template>

<xsl:template match="class" mode="php">
  <xsl:result-document href="{$destDirectory}/{@className}.php">&lt;?php

namespace dts\ebay\<xsl:copy-of select="$service"/>;

class <xsl:value-of select="@className" />
{
}
</xsl:result-document>
</xsl:template>

</xsl:stylesheet>
