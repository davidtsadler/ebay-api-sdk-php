<?php

use DTS\eBaySDK\FindingAPI\Services\FindingAPIService;
use DTS\eBaySDK\HttpClient\HttpClient;

class FindingAPIServiceTest extends \PHPUnit_Framework_TestCase
{
    protected function setUp()
    {
        $this->service1 = new FindingAPIService();
        $this->service2 = new FindingAPIService(array());
        $this->service3 = new FindingAPIService(array(), new HttpClient());
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Services\FindingAPIService', $this->service1);
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Services\FindingAPIService', $this->service2);
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Services\FindingAPIService', $this->service3);
    }

    public function testExtendsBaseService()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Services\FindingAPIBaseService', $this->service1);
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Services\FindingAPIBaseService', $this->service2);
        $this->assertInstanceOf('\DTS\eBaySDK\FindingAPI\Services\FindingAPIBaseService', $this->service3);
    }
}
