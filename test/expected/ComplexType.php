<?php
namespace DTS\eBaySDK\FindingAPI\Types;

/**
 *
 * @property AnotherType $anotherType
 * @property string $binary
 * @property string $binaryArr
 * @property string $bish
 * @property boolean $boolean
 * @property boolean $booleanArr
 * @property string $boshBish
 * @property DateTime $dateTime
 * @property DateTime $dateTimeArr
 * @property integer $decimal
 * @property integer $decimalArr
 * @property double $double
 * @property double $doubleArr
 * @property string $duration
 * @property string $durationArr
 * @property string $eBay
 * @property EnumStringType(string) $enumString
 * @property EnumStringType(string) $enumStringArr
 * @property EnumTokenType(string) $enumToken
 * @property EnumTokenType(string) $enumTokenArr
 * @property double $float
 * @property double $floatArr
 * @property integer $integer
 * @property integer $integerArr
 * @property integer $long
 * @property integer $longArr
 * @property string $string
 * @property string $stringArr
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
            'type' => 'AnotherType',
            'unbound' => false,
            'attribute' => false
        ],
        'binary' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'binaryArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true
        ],
        'bish' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'boolean' => [
            'type' => 'boolean',
            'unbound' => false,
            'attribute' => false
        ],
        'booleanArr' => [
            'type' => 'boolean',
            'unbound' => false,
            'attribute' => true
        ],
        'boshBish' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'dateTime' => [
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => false
        ],
        'dateTimeArr' => [
            'type' => 'DateTime',
            'unbound' => false,
            'attribute' => true
        ],
        'decimal' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false
        ],
        'decimalArr' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true
        ],
        'double' => [
            'type' => 'double',
            'unbound' => false,
            'attribute' => false
        ],
        'doubleArr' => [
            'type' => 'double',
            'unbound' => false,
            'attribute' => true
        ],
        'duration' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'durationArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true
        ],
        'eBay' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'enumString' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'enumStringArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true
        ],
        'enumToken' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'enumTokenArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true
        ],
        'float' => [
            'type' => 'double',
            'unbound' => false,
            'attribute' => false
        ],
        'floatArr' => [
            'type' => 'double',
            'unbound' => false,
            'attribute' => true
        ],
        'integer' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false
        ],
        'integerArr' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true
        ],
        'long' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => false
        ],
        'longArr' => [
            'type' => 'integer',
            'unbound' => false,
            'attribute' => true
        ],
        'string' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'stringArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true
        ],
        'time' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'timeArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true
        ],
        'token' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'tokenArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true
        ],
        'uri' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => false
        ],
        'uriArr' => [
            'type' => 'string',
            'unbound' => false,
            'attribute' => true
        ]
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
