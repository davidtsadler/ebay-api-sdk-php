<?php

use DTS\eBaySDK\MerchantAPI\Types\BooleanType;

class BooleanTypeTest extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new BooleanType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Types\BooleanType', $this->obj);
    }

    public function testExtendsBooleanType()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\Types\BooleanType', $this->obj);
    }
}