<?php
/**
 * DO NOT EDIT THIS FILE BEYOND THIS COMMENT!
 *
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 */

namespace DTS\eBaySDK\MerchantAPI\Enums\Test;

use DTS\eBaySDK\MerchantAPI\Enums\EnumTokenType;

class EnumTokenTypeTest extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new EnumTokenType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Enums\EnumTokenType', $this->obj);
    }
}
