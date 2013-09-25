<?php
namespace DTS\eBaySDK\FindingAPI;

/**
 *
 * @property string $bar
 * @property string $foo
 */
class AnotherType extends \DTS\eBaySDK\Types\BaseType
{
    public function __construct(array $values = [])
    {
        $properties = [
            'bar' => [
                'type' => 'string',
                'unbound' => false,
                'attribute' => false
            ],
            'foo' => [
                'type' => 'string',
                'unbound' => false,
                'attribute' => false
            ]
        ];

        list($parentValues, $childValues) = self::getParentValues($properties, $values);

        parent::__construct($parentValues);

        if (!array_key_exists(__CLASS__, self::$properties)) {
            self::$properties[__CLASS__] = array_merge(self::$properties[get_parent_class()], $properties);
        }

        $this->setValues(__CLASS__, $childValues);
    }
}
