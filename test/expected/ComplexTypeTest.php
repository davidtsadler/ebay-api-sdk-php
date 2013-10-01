<?php

use DTS\eBaySDK\FindingAPI\Types\ComplexType;

class ComplexTypeTest extends \PHPUnit_Framework_TestCase
{
    protected $obj;

    protected function setUp()
    {
        $this->obj = new ComplexType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Types\ComplexType', $this->obj);
    }

    public function testExtendsAnotherType()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Types\AnotherType', $this->obj);
    }
}
