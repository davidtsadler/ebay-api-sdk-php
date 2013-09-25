<?php
namespace DTS\eBaySDK\FindingAPI;

/**
 *
 */
class Base64BinaryType extends \DTS\eBaySDK\Types\Base64BinaryType
{
    public function __construct(array $values = [])
    {
        $properties = [
        ];

        list($parentValues, $childValues) = self::getParentValues($properties, $values);

        parent::__construct($parentValues);

        if (!array_key_exists(__CLASS__, self::$properties)) {
            self::$properties[__CLASS__] = array_merge(self::$properties[get_parent_class()], $properties);
        }

        $this->setValues(__CLASS__, $childValues);
    }
}
