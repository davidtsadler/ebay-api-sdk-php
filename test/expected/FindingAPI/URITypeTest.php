<?php

use DTS\eBaySDK\FindingAPI\Types\URIType;

class URITypeTest extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new URIType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Types\URIType', $this->obj);
    }

    public function testExtendsURIType()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\Types\URIType', $this->obj);
    }
}
