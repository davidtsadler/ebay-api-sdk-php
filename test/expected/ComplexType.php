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
 * @property DTS\eBaySDK\FindingAPI\Types\AnotherType $anotherType
 * @property string $binary
 * @property string $binaryArr
 * @property string $bish
 * @property string $bishBosh
 * @property boolean $boolean
 * @property boolean $booleanArr
 * @property string $boshBish
 * @property string $boshBosh
 * @property DateTime $dateTime
 * @property DateTime $dateTimeArr
 * @property integer $decimal
 * @property integer $decimalArr
 * @property double $double
 * @property double $doubleArr
 * @property string $duration
 * @property string $durationArr
 * @property string $eBay
 * @property DTS\eBaySDK\FindingAPI\Types\EnumStringType(string) $enumString
 * @property DTS\eBaySDK\FindingAPI\Types\EnumStringType(string) $enumStringArr
 * @property DTS\eBaySDK\FindingAPI\Types\EnumTokenType(string) $enumToken
 * @property DTS\eBaySDK\FindingAPI\Types\EnumTokenType(string) $enumTokenArr
 * @property double $float
 * @property double $floatArr
 * @property integer $integer
 * @property integer $integerArr
 * @property integer $integers
 * @property integer $long
 * @property integer $longArr
 * @property string $string
 * @property string $stringArr
 * @property string $strings
 * @property string $time
 * @property string $timeArr
 * @property string $token
 * @property string $tokenArr
 * @property string $uri
 * @property string $uriArr
 */
class ComplexType extends \DTS\eBaySDK\FindingAPI\Types\AnotherType
{
    /**
     * @var array Properties belonging to objects of this class.
     */
    private static $propertyTypes = array(
        'anotherType' => array(
            'type' => 'DTS\eBaySDK\FindingAPI\Types\AnotherType',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'AnotherType'
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
        'bish' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BISH'
        ),
        'bishBosh' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BISHbosh'
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
        'boshBish' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BoshBish'
        ),
        'boshBosh' => array(
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BoshBOSH'
        ),
        'dateTime' => array(
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'DateTime'
        ),
        'dateTimeArr' => array(
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'DateTimeArr'
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
