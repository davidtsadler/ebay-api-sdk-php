<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
  xmlns:dts="http://davidtsadler.com/">

<xsl:template match="*:complexType" mode="classes-doc">
  <xsl:element name="class">
    <xsl:variable name="name" as="xs:string">
      <xsl:choose>
        <xsl:when test="@name">
          <xsl:value-of select="@name"/>
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="../@name"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:attribute name="className"><xsl:copy-of select="dts:capitalize_first($name)"/></xsl:attribute>
    <xsl:attribute name="xmlNamespace">
      <xsl:value-of select="namespace::ns|namespace::tns"/>
    </xsl:attribute>
    <xsl:if test=".//*:extension">
      <xsl:attribute name="extends">
        <xsl:apply-templates select=".//*:extension" mode="extends"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="//wsdl:input[substring-after(@message, ':') = (//xs:schema/*:element[substring-after(@type, ':') = $name]/@name)]">
      <xsl:attribute name="requestXmlRootElementName">
        <xsl:value-of select="//xs:schema/*:element[substring-after(@type, ':')=$name]/@name"/>
      </xsl:attribute>
    </xsl:if>
    <!--
      Some APIs are defined by a XSD and don't have operations.
    -->
    <xsl:if test="not(/wsdl:definitions/wsdl:portType/wsdl:operation) and //xs:schema/*:element[substring-after(@type, ':')=$name]/@name"> 
      <xsl:attribute name="requestXmlRootElementName">
        <xsl:value-of select="//xs:schema/*:element[substring-after(@type, ':')=$name]/@name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@restResponse='true'"> 
      <xsl:attribute name="restResponse">
        <xsl:value-of select="true()"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@name='AbstractRequestType' and $service='Trading'">
      <xsl:apply-templates select="//xs:element[@name='RequesterCredentials']" mode="properties"/>
    </xsl:if>
    <xsl:apply-templates select="*:sequence/*:element[not(xs:annotation/xs:appinfo//*:NoCalls)
                                              and not(xs:annotation/xs:appinfo//*:noCalls)]" mode="properties"/>
    <xsl:apply-templates select="*:complexContent/*:extension/*:sequence/*:element[not(xs:annotation/xs:appinfo//*:NoCalls)
                                              and not(xs:annotation/xs:appinfo//*:noCalls)]" mode="properties"/>
    <xsl:apply-templates select=".//*:attribute[not(xs:annotation/xs:appinfo//*:NoCalls)
                                              and not(xs:annotation/xs:appinfo//*:noCalls)]" mode="properties"/>
    <xsl:apply-templates select="*:sequence/*:choice/*:element" mode="properties"/>
    <xsl:apply-templates select="*:choice/*:element" mode="properties"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*:simpleType" mode="classes-doc">
  <xsl:element name="enum">
    <xsl:attribute name="className"><xsl:copy-of select="dts:capitalize_first(@name)"/></xsl:attribute>
    <xsl:apply-templates select="*:restriction/*:enumeration[not(xs:annotation/xs:appinfo//*:NoCalls)
                                                             and not(xs:annotation/xs:appinfo//*:noCalls)]" mode="enums"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*:extension" mode="extends">
  <xsl:value-of select="if (contains(@base, ':'))
                          then dts:base_to_datatype(substring-after(@base, ':'))
                          else dts:base_to_datatype(@base)"/>
</xsl:template>

<xsl:template match="*:element|*:attribute" mode="properties">
  <xsl:variable name="type" as="xs:string">
    <xsl:choose>
      <xsl:when test="@type">
        <xsl:value-of select="substring-after(@type, ':')"/>
      </xsl:when>
      <xsl:otherwise><xsl:value-of select="@name"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="restriction" as="xs:string">
    <xsl:choose>
      <xsl:when test="//*:simpleType[@name=$type]/*:restriction/@base">
        <xsl:value-of select="substring-after(//*:simpleType[@name=$type]/*:restriction/@base, ':')"/>
      </xsl:when>
      <xsl:otherwise><xsl:text/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="restrictionIsEnum" as="xs:boolean">
    <xsl:choose>
      <xsl:when test="//*:simpleType[@name=$type]/*:restriction[*:enumeration]">
        <xsl:copy-of select="true()"/>
      </xsl:when>
      <xsl:otherwise><xsl:copy-of select="false()"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:element name="property">
    <!--
      Converts
        FooBar into fooBar.
        FOO into foo.
        foo into foo.
        FOOBar into fooBar.
        eBay into eBay.
    -->
    <xsl:attribute name="name" select="@name"/>
    <xsl:attribute name="actual-name" select="@name"/>
    <xsl:attribute name="property-type" select="dts:type_to_datatype($type, $restriction, $restrictionIsEnum, true())"/>
    <xsl:attribute name="is-attribute" select="local-name()='attribute'"/>
    <xsl:attribute name="actual-type" select="if ($restriction != '')
                                                then dts:type_to_datatype($restriction, '', false(), false())
                                                else dts:type_to_datatype($type, '', false(), false())"/>
    <xsl:attribute name="repeatable" select="@maxOccurs = 'unbounded' or @maxOccurs > 1 or xs:annotation/xs:appinfo//*:MaxOccurs > 1"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*:enumeration" mode="enums">
  <xsl:element name="enum">
    <xsl:attribute name="const"><xsl:value-of select="upper-case(replace(replace(replace(@value, '([A-Z][a-z])', ' $1'), '^ ', ''), '\s+', '_'))"/></xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute>
  </xsl:element>
</xsl:template>

<xsl:function name="dts:base_to_datatype" as="xs:string">
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
    <xsl:when test="$base='integer'">
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

<xsl:function name="dts:type_to_datatype" as="xs:string">
  <xsl:param name="type" as="xs:string"/>
  <xsl:param name="restriction" as="xs:string"/>
  <xsl:param name="restrictionIsEnum" as="xs:boolean"/>
  <!-- Fully Qualified Class Name -->
  <xsl:param name="fqcn" as="xs:boolean"/>
  <xsl:variable name="dtsNamespace" as="xs:string" select="if ($fqcn)
                                                           then '\DTS\eBaySDK\'
                                                           else 'DTS\eBaySDK\'"/>
  <xsl:choose>
    <xsl:when test="$type='base64Binary'">
      <xsl:text>string</xsl:text>
    </xsl:when>
    <xsl:when test="$type='boolean'">
      <xsl:text>boolean</xsl:text>
    </xsl:when>
    <xsl:when test="$type='dateTime'">
      <xsl:value-of select="if ($fqcn) then '\DateTime' else 'DateTime'"/>
    </xsl:when>
    <xsl:when test="$type='decimal'">
      <xsl:text>integer</xsl:text>
    </xsl:when>
    <xsl:when test="$type='double'">
      <xsl:text>double</xsl:text>
    </xsl:when>
    <xsl:when test="$type='duration'">
      <xsl:text>string</xsl:text>
    </xsl:when>
    <xsl:when test="$type='float'">
      <xsl:text>double</xsl:text>
    </xsl:when>
    <xsl:when test="$type='int'">
      <xsl:text>integer</xsl:text>
    </xsl:when>
    <xsl:when test="$type='integer'">
      <xsl:text>integer</xsl:text>
    </xsl:when>
    <xsl:when test="$type='long'">
      <xsl:text>integer</xsl:text>
    </xsl:when>
    <xsl:when test="$type='positiveInteger'">
      <xsl:text>integer</xsl:text>
    </xsl:when>
    <xsl:when test="$type='string'">
      <xsl:text>string</xsl:text>
    </xsl:when>
    <xsl:when test="$type='time'">
      <xsl:text>string</xsl:text>
    </xsl:when>
    <xsl:when test="$type='token'">
      <xsl:text>string</xsl:text>
    </xsl:when>
    <xsl:when test="$type='anyURI'">
      <xsl:text>string</xsl:text>
    </xsl:when>
    <xsl:when test="$type='any'">
      <xsl:value-of select="if ($fqcn) then 'mixed' else 'any'"/>
    </xsl:when>
    <xsl:when test="$restriction != '' and $restrictionIsEnum">
        <xsl:value-of select="concat($dtsNamespace, $service, '\Enums\', dts:capitalize_first($type))"/>
    </xsl:when>
    <xsl:when test="$restriction != '' and not($restrictionIsEnum)">
        <xsl:value-of select="dts:type_to_datatype($restriction, '', false(), false())"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="concat($dtsNamespace, $service, '\Types\', dts:capitalize_first($type))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="dts:name_to_camel_case" as="xs:string">
  <xsl:param name="name" as="xs:string"/>
  <xsl:variable name="wordList" select="tokenize(
    replace(
      replace(
        replace($name, '([A-Z]{2,})|([A-Z][a-z]+)', ' $1 $2 '),
        '^\s+', ''),
      '\s+', ' '),
    '\s')
  "/>
  <xsl:sequence select="string-join((lower-case($wordList[1]),
    for $word in $wordList[position() > 1]
    return dts:capitalize_first(lower-case($word)))
    ,'')
  "/>
</xsl:function>

<xsl:function name="dts:capitalize_first" as="xs:string">
  <xsl:param name="word" as="xs:string"/>
  <xsl:sequence select="concat(upper-case(substring($word, 1, 1)), substring($word, 2))"/>
</xsl:function>
</xsl:stylesheet>
