<?php

use DTS\eBaySDK\FindingAPI\Types\Base64BinaryType;

class Base64BinaryTypeTest extends \PHPUnit_Framework_TestCase
{
    protected $obj;

    protected function setUp()
    {
        $this->obj = new Base64BinaryType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Types\Base64BinaryType', $this->obj);
    }

    public function testExtendsBase64BinaryType()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\Types\Base64BinaryType', $this->obj);
    }
}
