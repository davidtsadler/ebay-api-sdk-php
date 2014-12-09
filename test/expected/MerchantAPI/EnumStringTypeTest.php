<?php

use DTS\eBaySDK\MerchantAPI\Enums\EnumStringType;

class EnumStringTypeTest extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new EnumStringType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Enums\EnumStringType', $this->obj);
    }
}
