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
    <xsl:apply-templates select="/wsdl:definitions/wsdl:types/xs:schema/*:complexType" mode="classes-doc"/>
  </xsl:variable>
  <xsl:variable name="enums" as="element()*">
    <xsl:apply-templates select="/wsdl:definitions/wsdl:types/xs:schema/*:simpleType[*:restriction]" mode="classes-doc"/>
  </xsl:variable>
  <xsl:apply-templates select="$classes" mode="php"/>
  <xsl:apply-templates select="$enums" mode="php"/>
</xsl:template>

<xsl:template match="class" mode="php">
  <xsl:result-document href="{$destDirectory}/{@className}.php">&lt;?php
namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>;

/**
 *<xsl:apply-templates select="property" mode="property-list">
    <xsl:sort select="@name"/>
  </xsl:apply-templates>
 */
class <xsl:value-of select="@className" /><xsl:apply-templates select="." mode="extends"/>
{
    public function __construct(array $values = [])
    {
        $properties = [<xsl:apply-templates select="property" mode="property-info">
          <xsl:sort select="@name"/>
        </xsl:apply-templates>
        ];

        list($parentValues, $childValues) = self::getParentValues($properties, $values);

        parent::__construct($parentValues);

        if (!array_key_exists(__CLASS__, self::$properties)) {
            self::$properties[__CLASS__] = array_merge(self::$properties[get_parent_class()], $properties);
        }

        $this->setValues(__CLASS__, $childValues);
    }
}
</xsl:result-document>
</xsl:template>

<xsl:template match="enum" mode="php">
  <xsl:result-document href="{$destDirectory}/{@className}.php">&lt;?php
namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>;

/**
 *
 */
class <xsl:value-of select="@className" />
{<xsl:apply-templates select="enum" mode="class-constants">
  <xsl:sort select="@const"/>
</xsl:apply-templates>
}
</xsl:result-document>
</xsl:template>

<xsl:template match="class" mode="extends">
  <xsl:choose>
    <xsl:when test="@extends='Base64BinaryType' or 
                    @extends='BooleanType' or
                    @extends='DecimalType' or
                    @extends='DoubleType' or
                    @extends='IntegerType' or
                    @extends='StringType' or
                    @extends='TokenType' or
                    @extends='URIType'"> extends \DTS\eBaySDK\Types\<xsl:value-of select="@extends"/></xsl:when>
    <xsl:when test="@extends"> extends \DTS\eBaySDK\<xsl:copy-of select="$service"/>\<xsl:value-of select="@extends"/></xsl:when>
    <xsl:otherwise> extends \DTS\eBaySDK\Types\BaseType</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="property" mode="property-list">
 * @property <xsl:value-of select="@property-type"/> $<xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="property" mode="property-info">
            '<xsl:value-of select="@name"/>' => [
                'type' => '<xsl:value-of select="@actual-type"/>',
                'unbound' => false,
                'attribute' => <xsl:value-of select="@is-attribute"/>
  <xsl:text>
</xsl:text>
  <xsl:choose>
    <xsl:when test="position()=last()">
      <xsl:text>            ]</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>            ],</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="enum" mode="class-constants">
    const <xsl:value-of select="@const"/> = '<xsl:value-of select="@value"/>';</xsl:template>

</xsl:stylesheet>
