<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">

<xsl:output method="text" encoding="UTF-8" />

<xsl:param name="destDirectory" required="yes" as="xs:string"/>

<xsl:template match="/">
  <xsl:apply-templates select="//xs:complexType" mode="create-php-file"/>
</xsl:template>

<xsl:template match="//xs:complexType" mode="create-php-file">
  <xsl:result-document href="{$destDirectory}/{@name}.php">
    <xsl:text>&lt;?php&#xa;</xsl:text>
  </xsl:result-document>
</xsl:template>

</xsl:stylesheet>
