<?php

use DTS\eBaySDK\FindingAPI\Types\BooleanType;

class BooleanTypeTest extends \PHPUnit_Framework_TestCase
{
    protected $obj;

    protected function setUp()
    {
        $this->obj = new BooleanType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Types\BooleanType', $this->obj);
    }

    public function testExtendsBooleanType()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\Types\BooleanType', $this->obj);
    }
}
