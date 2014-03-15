<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:dts="http://davidtsadler.com/">

<xsl:template match="*:complexType" mode="classes-doc">
  <xsl:element name="class">
    <xsl:attribute name="className"><xsl:copy-of select="dts:capitalize_first(@name)"/></xsl:attribute>
    <xsl:attribute name="xmlNamespace">
      <xsl:value-of select="namespace::ns|namespace::tns"/>
    </xsl:attribute>
    <xsl:if test=".//*:extension">
      <xsl:attribute name="extends">
        <xsl:apply-templates select=".//*:extension" mode="extends"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@name='AbstractRequestType'">
      <xsl:apply-templates select="//xs:element[@name='RequesterCredentials']" mode="properties"/>
    </xsl:if>
    <xsl:apply-templates select=".//*:element[not(xs:annotation/xs:appinfo//*:NoCalls)
                                              and not(xs:annotation/xs:appinfo//*:noCalls)]" mode="properties"/>
    <xsl:apply-templates select=".//*:attribute[not(xs:annotation/xs:appinfo//*:NoCalls)
                                              and not(xs:annotation/xs:appinfo//*:noCalls)]" mode="properties"/>
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
  <xsl:variable name="type" select="substring-after(@type, ':')" as="xs:string"/>
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
    <xsl:attribute name="name" select="dts:name_to_camel_case(@name)"/>
    <xsl:attribute name="actual-name" select="@name"/>
    <xsl:attribute name="property-type" select="dts:type_to_datatype($type, $restriction, $restrictionIsEnum)"/>
    <xsl:attribute name="is-attribute" select="local-name()='attribute'"/>
    <xsl:attribute name="actual-type" select="if ($restriction != '')
                                                then dts:type_to_datatype($restriction, '', false())
                                                else dts:type_to_datatype($type, '', false())"/>
    <xsl:attribute name="unbound" select="@maxOccurs = 'unbounded' or @maxOccurs > 1"/>
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
  <xsl:choose>
    <xsl:when test="$type='base64Binary'">
      <xsl:text>string</xsl:text>
    </xsl:when>
    <xsl:when test="$type='boolean'">
      <xsl:text>boolean</xsl:text>
    </xsl:when>
    <xsl:when test="$type='dateTime'">
      <xsl:text>DateTime</xsl:text>
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
    <xsl:when test="$type='long'">
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
    <xsl:when test="$restriction != '' and $restrictionIsEnum">
        <xsl:value-of select="concat('DTS\eBaySDK\', $service, '\Enums\', dts:capitalize_first($type), '(', dts:type_to_datatype($restriction, '', false()), ')')"/>
    </xsl:when>
    <xsl:when test="$restriction != '' and not($restrictionIsEnum)">
        <xsl:value-of select="dts:type_to_datatype($restriction, '', false())"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="concat('DTS\eBaySDK\', $service, '\Types\', dts:capitalize_first($type))"/>
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
