<?php
namespace DTS\eBaySDK\FindingAPI;

/**
 *
 * @property string $bar
 * @property string $foo
 */
class AnotherType extends \DTS\eBaySDK\Types\BaseType
{
    public function __construct()
    {
        $properties = array(
            'bar' => array(
                'type' => 'string',
                'isAttribute' => false
            ),
            'foo' => array(
                'type' => 'string',
                'isAttribute' => false
            )
        );
    }
}
