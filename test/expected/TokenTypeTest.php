<?php

use DTS\eBaySDK\FindingAPI\Types\TokenType;

class TokenTypeTest extends \PHPUnit_Framework_TestCase
{
    protected $obj;

    protected function setUp()
    {
        $this->obj = new TokenType();
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Types\TokenType', $this->obj);
    }

    public function testExtendsTokenType()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\Types\TokenType', $this->obj);
    }
}
