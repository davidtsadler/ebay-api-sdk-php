<?php
/**
 * DO NOT EDIT THIS FILE BEYOND THIS COMMENT!
 *
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 */

namespace DTS\eBaySDK\FindingAPI\Types\Test;

use DTS\eBaySDK\FindingAPI\Types\IntegerType;

class IntegerTypeTest extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new IntegerType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Types\IntegerType', $this->obj);
    }

    public function testExtendsIntegerType()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\Types\IntegerType', $this->obj);
    }
}
