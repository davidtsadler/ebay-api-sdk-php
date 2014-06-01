<?php

use DTS\eBaySDK\FindingAPI\Enums\EnumTokenType;

class EnumTokenTypeTest extends \PHPUnit_Framework_TestCase
{
    private $obj;

    protected function setUp()
    {
        $this->obj = new EnumTokenType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Enums\EnumTokenType', $this->obj);
    }
}
