<?php

namespace dts\ebaysdk\finding_api;

/**
 *
 * @property string $bar
 * @property string $foo
 */
class AnotherType extends \dts\ebaysdk\base\Base
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
