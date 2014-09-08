<?php
/**
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
 * @property \DTS\eBaySDK\FindingAPI\Types\AnotherType $AnotherType
 * @property string $BISH
 * @property string $BISHbosh
 * @property string $BoshBOSH
 * @property string $BoshBish
 * @property \DateTime $DateTime
 * @property \DateTime $DateTimeArr
 * @property string $binary
 * @property string $binaryArr
 * @property boolean $boolean
 * @property boolean $booleanArr
 * @property integer $decimal
 * @property integer $decimalArr
 * @property double $double
 * @property double $doubleArr
 * @property string $duration
 * @property string $durationArr
 * @property string $eBay
 * @property \DTS\eBaySDK\FindingAPI\Enums\EnumStringType $enumString
 * @property \DTS\eBaySDK\FindingAPI\Enums\EnumStringType $enumStringArr
 * @property \DTS\eBaySDK\FindingAPI\Enums\EnumTokenType $enumToken
 * @property \DTS\eBaySDK\FindingAPI\Enums\EnumTokenType $enumTokenArr
 * @property double $float
 * @property double $floatArr
 * @property \DTS\eBaySDK\FindingAPI\Types\Foo $foo
 * @property string $id
 * @property integer $integer
 * @property integer $integerArr
 * @property integer[] $integers
 * @property integer $long
 * @property integer $longArr
 * @property string $string
 * @property string $stringArr
 * @property string[] $strings
 * @property string $time
 * @property string $timeArr
 * @property string $token
 * @property string $tokenArr
 * @property string[] $unbounded
 * @property string[] $unbounded2
 * @property string $uri
 * @property string $uriArr
 */
class ComplexType extends \DTS\eBaySDK\FindingAPI\Types\AnotherType
{
    /**
     * @var array Properties belonging to objects of this class.
     */
    private static $propertyTypes = array(
        'AnotherType' => array(
            'type' => 'DTS\eBaySDK\FindingAPI\Types\AnotherType',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'AnotherType'
        ),
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
        'BoshBOSH' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BoshBOSH'
        ),
        'BoshBish' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BoshBish'
        ),
        'DateTime' => array(
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'DateTime'
        ),
        'DateTimeArr' => array(
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'DateTimeArr'
        ),
        'binary' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'binary'
        ),
        'binaryArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'binaryArr'
        ),
        'boolean' => array(
            'type' => 'boolean',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'boolean'
        ),
        'booleanArr' => array(
            'type' => 'boolean',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'booleanArr'
        ),
        'decimal' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'decimal'
        ),
        'decimalArr' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'decimalArr'
        ),
        'double' => array(
            'type' => 'double',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'double'
        ),
        'doubleArr' => array(
            'type' => 'double',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'doubleArr'
        ),
        'duration' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'duration'
        ),
        'durationArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'durationArr'
        ),
        'eBay' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'eBay'
        ),
        'enumString' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'enumString'
        ),
        'enumStringArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'enumStringArr'
        ),
        'enumToken' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'enumToken'
        ),
        'enumTokenArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'enumTokenArr'
        ),
        'float' => array(
            'type' => 'double',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'float'
        ),
        'floatArr' => array(
            'type' => 'double',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'floatArr'
        ),
        'foo' => array(
            'type' => 'DTS\eBaySDK\FindingAPI\Types\Foo',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'foo'
        ),
        'id' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'id'
        ),
        'integer' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'integer'
        ),
        'integerArr' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'integerArr'
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
        'longArr' => array(
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'longArr'
        ),
        'string' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'string'
        ),
        'stringArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'stringArr'
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
        'timeArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'timeArr'
        ),
        'token' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'token'
        ),
        'tokenArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'tokenArr'
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
        'uri' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'uri'
        ),
        'uriArr' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'uriArr'
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
