<?php
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
    private static $propertyTypes = [
        'anotherType' => [
            'type' => 'DTS\eBaySDK\FindingAPI\Types\AnotherType',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'AnotherType'
        ],
        'binary' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'binary'
        ],
        'binaryArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'binaryArr'
        ],
        'bish' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BISH'
        ],
        'bishBosh' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BISHbosh'
        ],
        'boolean' => [
            'type' => 'boolean',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'boolean'
        ],
        'booleanArr' => [
            'type' => 'boolean',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'booleanArr'
        ],
        'boshBish' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BoshBish'
        ],
        'boshBosh' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'BoshBOSH'
        ],
        'dateTime' => [
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'DateTime'
        ],
        'dateTimeArr' => [
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'DateTimeArr'
        ],
        'decimal' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'decimal'
        ],
        'decimalArr' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'decimalArr'
        ],
        'double' => [
            'type' => 'double',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'double'
        ],
        'doubleArr' => [
            'type' => 'double',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'doubleArr'
        ],
        'duration' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'duration'
        ],
        'durationArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'durationArr'
        ],
        'eBay' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'eBay'
        ],
        'enumString' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'enumString'
        ],
        'enumStringArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'enumStringArr'
        ],
        'enumToken' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'enumToken'
        ],
        'enumTokenArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'enumTokenArr'
        ],
        'float' => [
            'type' => 'double',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'float'
        ],
        'floatArr' => [
            'type' => 'double',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'floatArr'
        ],
        'integer' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'integer'
        ],
        'integerArr' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'integerArr'
        ],
        'integers' => [
            'type' => 'integer',
            'unbound' => true,
            'attribute' => false,
            'elementName' => 'integers'
        ],
        'long' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'long'
        ],
        'longArr' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'longArr'
        ],
        'string' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'string'
        ],
        'stringArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'stringArr'
        ],
        'strings' => [
            'type' => 'string',
            'unbound' => true,
            'attribute' => false,
            'elementName' => 'strings'
        ],
        'time' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'time'
        ],
        'timeArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'timeArr'
        ],
        'token' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'token'
        ],
        'tokenArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'tokenArr'
        ],
        'uri' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false,
            'elementName' => 'uri'
        ],
        'uriArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true,
            'attributeName' => 'uriArr'
        ]
    ];

    public function __construct(array $values = [])
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
