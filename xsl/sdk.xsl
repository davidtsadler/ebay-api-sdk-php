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
<xsl:include href="operations_doc.xsl"/>

<xsl:param name="service" required="yes" as="xs:string"/>
<xsl:param name="destDirectory" required="yes" as="xs:string"/>

<xsl:template match="/">
  <xsl:variable name="classes" as="element()+">
    <xsl:apply-templates select="/wsdl:definitions/wsdl:types/xs:schema/*:complexType" mode="classes-doc"/>
    <xsl:apply-templates select="/wsdl:definitions/wsdl:types/xs:schema/*:complexType/*:complexContent/*:extension/*:sequence/*:element/*:complexType" mode="classes-doc"/>
    <xsl:apply-templates select="/xs:schema/*:complexType" mode="classes-doc"/>
    <xsl:apply-templates select="/xs:schema/*:complexType/*:complexContent/*:extension/*:sequence/*:element/*:complexType" mode="classes-doc"/>
  </xsl:variable>
  <xsl:variable name="enums" as="element()*">
    <xsl:apply-templates select="/wsdl:definitions/wsdl:types/xs:schema/*:simpleType[*:restriction]" mode="classes-doc"/>
    <xsl:apply-templates select="/xs:schema/*:simpleType[*:restriction]" mode="classes-doc"/>
  </xsl:variable>
  <xsl:apply-templates select="$classes" mode="php"/>
  <xsl:apply-templates select="$classes" mode="phpunit"/>
  <xsl:apply-templates select="$enums[enum]" mode="php"/>
  <xsl:apply-templates select="$enums[enum]" mode="phpunit"/>
  <!--
    Some APIs are defined by a XSD and don't have operations.
  -->
  <xsl:if test="/wsdl:definitions/wsdl:portType/wsdl:operation">
    <xsl:apply-templates select="." mode="php"/>
    <xsl:apply-templates select="." mode="phpunit"/>
  </xsl:if>
</xsl:template>

<xsl:template match="class" mode="php">
  <xsl:result-document href="{$destDirectory}/src/DTS/eBaySDK/{$service}/Types/{@className}.php">&lt;?php
/**
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 *
 * Copyright 2014 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types;

/**
 *<xsl:apply-templates select="property" mode="property-list"/>
 */
class <xsl:value-of select="@className"/><xsl:apply-templates select="." mode="extends"/>
{
    /**
     * @var array Properties belonging to objects of this class.
     */
    private static $propertyTypes = array(<xsl:apply-templates select="property" mode="property-info"/>
    );

    /**
     * @param array $values Optional properties and values to assign to the object.
     */
    public function __construct(array $values = array())
    {
        list($parentValues, $childValues) = self::getParentValues(self::$propertyTypes, $values);

        parent::__construct($parentValues);

        if (!array_key_exists(__CLASS__, self::$properties)) {
            self::$properties[__CLASS__] = array_merge(self::$properties[get_parent_class()], self::$propertyTypes);
        }

        if (!array_key_exists(__CLASS__, self::$xmlNamespaces)) {
            self::$xmlNamespaces[__CLASS__] = '<xsl:value-of select="@xmlNamespace"/>';
        }<xsl:if test="@requestXmlRootElementName">

        if (!array_key_exists(__CLASS__, self::$requestXmlRootElementNames)) {
            self::$requestXmlRootElementNames[__CLASS__] = '<xsl:value-of select="@requestXmlRootElementName"/>';
        }</xsl:if>

        $this->setValues(__CLASS__, $childValues);
    }
}
</xsl:result-document>
</xsl:template>

<xsl:template match="class" mode="phpunit">
  <xsl:result-document href="{$destDirectory}/test/DTS/eBaySDK/{$service}/Types/{@className}Test.php">&lt;?php
/**
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 *
 * Copyright 2014 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types\Test;

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
  <xsl:result-document href="{$destDirectory}/src/DTS/eBaySDK/{$service}/Enums/{@className}.php">&lt;?php
/**
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 *
 * Copyright 2014 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>\Enums;

/**
 *
 */
class <xsl:value-of select="@className"/>
{<xsl:apply-templates select="enum" mode="class-constants">
  <xsl:sort select="@const"/>
</xsl:apply-templates>
}
</xsl:result-document>
</xsl:template>

<xsl:template match="enum" mode="phpunit">
  <xsl:result-document href="{$destDirectory}/test/DTS/eBaySDK/{$service}/Enums/{@className}Test.php">&lt;?php
/**
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 *
 * Copyright 2014 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>\Enums\Test;

use DTS\eBaySDK\<xsl:copy-of select="$service"/>\Enums\<xsl:value-of select="@className"/>;

class <xsl:value-of select="@className"/>Test extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new <xsl:value-of select="@className"/>();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Enums\<xsl:value-of select="@className"/>', $this->obj);
    }
}
</xsl:result-document>
</xsl:template>

<xsl:template match="class" mode="extends"> extends <xsl:copy-of select="dts:phpns_extends(@extends)"/>
</xsl:template>

<xsl:template match="property" mode="property-list">
 * @property <xsl:value-of select="@property-type"/><xsl:value-of select="if (@unbound = 'true') then '[] ' else ' '"/>$<xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="property" mode="property-info">
        '<xsl:value-of select="@name"/>' => array(
            'type' => '<xsl:value-of select="@actual-type"/>',
            'unbound' => <xsl:value-of select="@unbound"/>,
            'attribute' => <xsl:value-of select="@is-attribute"/>,
            '<xsl:value-of select="if (@is-attribute != 'false') then 'attributeName' else 'elementName'"/>' => '<xsl:value-of select="@actual-name"/>'
<xsl:choose>
    <xsl:when test="position()=last()">
      <xsl:text>        )</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>        ),</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="enum" mode="class-constants">
    const C_<xsl:value-of select="@const"/> = '<xsl:value-of select="@value"/>';</xsl:template>

<xsl:template match="/" mode="php">
  <xsl:variable name="operations" as="element()*">
    <xsl:apply-templates select="/wsdl:definitions/wsdl:portType/wsdl:operation" mode="operations-doc"/>
  </xsl:variable>
  <xsl:result-document href="{$destDirectory}/src/DTS/eBaySDK/{$service}/Services/{$service}Service.php">&lt;?php
/**
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 *
 * Copyright 2014 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services;

class <xsl:copy-of select="$service"/>Service extends \DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\<xsl:copy-of select="$service"/>BaseService
{
    /**
     * @param array $config Optional configuration option values.
     * @param \DTS\eBaySDK\Interfaces\HttpClientInterface $httpClient The object that will handle sending requests to the API.
     */
    public function __construct($config = array(), \DTS\eBaySDK\Interfaces\HttpClientInterface $httpClient = null)
    {
        parent::__construct($config, $httpClient);
    }<xsl:apply-templates select="$operations" mode="php"/>
}
</xsl:result-document>
</xsl:template>

<xsl:template match="/" mode="phpunit">
  <xsl:result-document href="{$destDirectory}/test/DTS/eBaySDK/{$service}/Services/{$service}ServiceTest.php">&lt;?php
/**
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 *
 * Copyright 2014 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\Test;

use DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\<xsl:copy-of select="$service"/>Service;
use DTS\eBaySDK\HttpClient\HttpClient;

class <xsl:copy-of select="$service"/>ServiceTest extends \PHPUnit_Framework_TestCase
{
    protected function setUp()
    {
        $this->service1 = new <xsl:copy-of select="$service"/>Service();
        $this->service2 = new <xsl:copy-of select="$service"/>Service(array());
        $this->service3 = new <xsl:copy-of select="$service"/>Service(array(), new HttpClient());
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\<xsl:copy-of select="$service"/>Service', $this->service1);
        $this->assertInstanceOf('\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\<xsl:copy-of select="$service"/>Service', $this->service2);
        $this->assertInstanceOf('\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\<xsl:copy-of select="$service"/>Service', $this->service3);
    }

    public function testExtendsBaseService()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\<xsl:copy-of select="$service"/>BaseService', $this->service1);
        $this->assertInstanceOf('\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\<xsl:copy-of select="$service"/>BaseService', $this->service2);
        $this->assertInstanceOf('\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Services\<xsl:copy-of select="$service"/>BaseService', $this->service3);
    }
}
</xsl:result-document>
</xsl:template>

<xsl:template match="operation" mode="php">

    /**
     * @param \DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types\<xsl:value-of select="@request-type"/> $request
     * @return \DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types\<xsl:value-of select="@response-type"/>
     */
    public function <xsl:value-of select="@method-name"/>(\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types\<xsl:value-of select="@request-type"/> $request)
    {
        return $this->callOperation(
            '<xsl:value-of select="@name"/>',
            $request,
            '\DTS\eBaySDK\<xsl:copy-of select="$service"/>\Types\<xsl:value-of select="@response-type"/>'
        );
    }</xsl:template>

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
