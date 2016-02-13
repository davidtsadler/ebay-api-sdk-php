<?php
/**
 * The contents of this file was generated using the WSDLs as provided by eBay.
 *
 * DO NOT EDIT THIS FILE!
 */

namespace DTS\eBaySDK\Test\MerchantAPI\Types;

use DTS\eBaySDK\MerchantAPI\Types\URIType;

class URITypeTest extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new URIType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Types\URIType', $this->obj);
    }

    public function testExtendsURIType()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\Types\URIType', $this->obj);
    }
}
