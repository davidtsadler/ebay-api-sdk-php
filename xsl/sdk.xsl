<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
  xmlns:dts="http://davidtsadler.com/"
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
  <xsl:apply-templates select="$classes" mode="phpunit"/>
  <xsl:apply-templates select="$enums" mode="php"/>
</xsl:template>

<xsl:template match="class" mode="php">
  <xsl:result-document href="{$destDirectory}/src/DTS/eBaySDK/{$service}/Types/{@className}.php">&lt;?php
namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types;

/**
 *<xsl:apply-templates select="property" mode="property-list">
    <xsl:sort select="@name"/>
  </xsl:apply-templates>
 */
class <xsl:value-of select="@className" /><xsl:apply-templates select="." mode="extends"/>
{
    private static $propertyTypes = [<xsl:apply-templates select="property" mode="property-info">
      <xsl:sort select="@name"/>
    </xsl:apply-templates>
    ];

    public function __construct(array $values = [])
    {
        list($parentValues, $childValues) = self::getParentValues(self::$propertyTypes, $values);

        parent::__construct($parentValues);

        if (!array_key_exists(__CLASS__, self::$properties)) {
            self::$properties[__CLASS__] = array_merge(self::$properties[get_parent_class()], self::$propertyTypes);
        }

        $this->setValues(__CLASS__, $childValues);
    }
}
</xsl:result-document>
</xsl:template>

<xsl:template match="class" mode="phpunit">
  <xsl:result-document href="{$destDirectory}/test/DTS/eBaySDK/{$service}/Types/{@className}Test.php">&lt;?php

use DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types\<xsl:value-of select="@className"/>;

class <xsl:value-of select="@className"/>Test extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new <xsl:value-of select="@className"/>();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types\<xsl:value-of select="@className"/>', $this->obj);
    }

    public function testExtends<xsl:value-of select="if (@extends != '') then @extends else 'BaseType'"/>()
    {
        $this->assertInstanceOf('<xsl:copy-of select="dts:phpns_extends(@extends)"/>', $this->obj);
    }
}
</xsl:result-document>
</xsl:template>

<xsl:template match="enum" mode="php">
  <xsl:result-document href="{$destDirectory}/src/DTS/eBaySDK/{$service}/Types/{@className}.php">&lt;?php
namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types;

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

<xsl:template match="class" mode="extends"> extends <xsl:copy-of select="dts:phpns_extends(@extends)"/>
</xsl:template>

<xsl:template match="property" mode="property-list">
 * @property <xsl:value-of select="@property-type"/> $<xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="property" mode="property-info">
        '<xsl:value-of select="@name"/>' => [
            'type' => '<xsl:value-of select="@actual-type"/>',
            'unbound' => <xsl:value-of select="@unbound"/>,
            'attribute' => <xsl:value-of select="@is-attribute"/>,
            '<xsl:value-of select="if (@is-attribute != 'false') then 'attributeName' else 'elementName'"/>' => '<xsl:value-of select="@actual-name"/>'
<xsl:choose>
    <xsl:when test="position()=last()">
      <xsl:text>        ]</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>        ],</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="enum" mode="class-constants">
    const <xsl:value-of select="@const"/> = '<xsl:value-of select="@value"/>';</xsl:template>

<xsl:function name="dts:phpns_extends" as="xs:string">
  <xsl:param name="extends"/>
  <xsl:choose>
    <xsl:when test="$extends='Base64BinaryType' or 
                    $extends='BooleanType' or
                    $extends='DecimalType' or
                    $extends='DoubleType' or
                    $extends='IntegerType' or
                    $extends='StringType' or
                    $extends='TokenType' or
                    $extends='URIType'">
      <xsl:sequence select="concat('\DTS\eBaySDK\Types\', $extends)"/>
    </xsl:when>
    <xsl:when test="$extends">
      <xsl:sequence select="concat('\DTS\eBaySDK\', $service, '\Types\', $extends)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>\DTS\eBaySDK\Types\BaseType</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>
</xsl:stylesheet>
