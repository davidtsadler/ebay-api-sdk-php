<?php
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

namespace DTS\eBaySDK\FindingAPI\Types;

/**
 *
 * @property string $BISH
 * @property string $BISHbosh
 * @property string $BoshBish
 * @property string $BoshBOSH
 * @property string $eBay
 * @property \DTS\eBaySDK\FindingAPI\Types\AnotherType $AnotherType
 * @property string $uri
 * @property string $binary
 * @property boolean $boolean
 * @property \DateTime $DateTime
 * @property integer $decimal
 * @property double $double
 * @property string $duration
 * @property double $float
 * @property integer $integer
 * @property integer[] $integers
 * @property integer $long
 * @property string $string
 * @property string[] $strings
 * @property string $time
 * @property string $token
 * @property \DTS\eBaySDK\FindingAPI\Enums\EnumStringType $enumString
 * @property \DTS\eBaySDK\FindingAPI\Enums\EnumTokenType $enumToken
 * @property string $id
 * @property string[] $unbounded
 * @property string[] $unbounded2
 * @property \DTS\eBaySDK\FindingAPI\Types\Foo $foo
 * @property string $uriArr
 * @property string $binaryArr
 * @property boolean $booleanArr
 * @property \DateTime $DateTimeArr
 * @property integer $decimalArr
 * @property double $doubleArr
 * @property string $durationArr
 * @property double $floatArr
 * @property integer $integerArr
 * @property integer $longArr
 * @property string $stringArr
 * @property string $timeArr
 * @property string $tokenArr
 * @property \DTS\eBaySDK\FindingAPI\Enums\EnumStringType $enumStringArr
 * @property \DTS\eBaySDK\FindingAPI\Enums\EnumTokenType $enumTokenArr
 */
class ComplexType extends \DTS\eBaySDK\FindingAPI\Types\AnotherType
{
    /**
     * @var array Properties belonging to objects of this class.
     */
    private static $propertyTypes = array(
        'BISH' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BISH'
        ),
        'BISHbosh' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BISHbosh'
        ),
        'BoshBish' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BoshBish'
        ),
        'BoshBOSH' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BoshBOSH'
        ),
        'eBay' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'eBay'
        ),
        'AnotherType' => array(
            'type' => 'DTS\eBaySDK\FindingAPI\Types\AnotherType',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'AnotherType'
        ),
        'uri' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'uri'
        ),
        'binary' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'binary'
        ),
        'boolean' => array(
            'type' => 'boolean',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'boolean'
        ),
        'DateTime' => array(
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'DateTime'
        ),
        'decimal' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'decimal'
        ),
        'double' => array(
            'type' => 'double',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'double'
        ),
        'duration' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'duration'
        ),
        'float' => array(
            'type' => 'double',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'float'
        ),
        'integer' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'integer'
        ),
        'integers' => array(
            'type' => 'integer',
            'unbound' => true,
            'attribute' => false,
            'elementName' => 'integers'
        ),
        'long' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'long'
        ),
        'string' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'string'
        ),
        'strings' => array(
            'type' => 'string',
            'unbound' => true,
            'attribute' => false,
            'elementName' => 'strings'
        ),
        'time' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'time'
        ),
        'token' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'token'
        ),
        'enumString' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'enumString'
        ),
        'enumToken' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'enumToken'
        ),
        'id' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'id'
        ),
        'unbounded' => array(
            'type' => 'string',
            'unbound' => true,
            'attribute' => false,
            'elementName' => 'unbounded'
        ),
        'unbounded2' => array(
            'type' => 'string',
            'unbound' => true,
            'attribute' => false,
            'elementName' => 'unbounded2'
        ),
        'foo' => array(
            'type' => 'DTS\eBaySDK\FindingAPI\Types\Foo',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'foo'
        ),
        'uriArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'uriArr'
        ),
        'binaryArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'binaryArr'
        ),
        'booleanArr' => array(
            'type' => 'boolean',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'booleanArr'
        ),
        'DateTimeArr' => array(
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'DateTimeArr'
        ),
        'decimalArr' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'decimalArr'
        ),
        'doubleArr' => array(
            'type' => 'double',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'doubleArr'
        ),
        'durationArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'durationArr'
        ),
        'floatArr' => array(
            'type' => 'double',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'floatArr'
        ),
        'integerArr' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'integerArr'
        ),
        'longArr' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'longArr'
        ),
        'stringArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'stringArr'
        ),
        'timeArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'timeArr'
        ),
        'tokenArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'tokenArr'
        ),
        'enumStringArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'enumStringArr'
        ),
        'enumTokenArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'enumTokenArr'
        )
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
            self::$xmlNamespaces[__CLASS__] = 'http://davidtsadler.com';
        }

        $this->setValues(__CLASS__, $childValues);
    }
}
