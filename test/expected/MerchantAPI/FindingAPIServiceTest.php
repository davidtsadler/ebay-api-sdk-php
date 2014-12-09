<?php

use DTS\eBaySDK\MerchantAPI\Services\MerchantAPIService;
use DTS\eBaySDK\HttpClient\HttpClient;

class MerchantAPIServiceTest extends \PHPUnit_Framework_TestCase
{
    protected function setUp()
    {
        $this->service1 = new MerchantAPIService();
        $this->service2 = new MerchantAPIService(array());
        $this->service3 = new MerchantAPIService(array(), new HttpClient());
    }

    public function testCanBeCreated()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Services\MerchantAPIService', $this->service1);
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Services\MerchantAPIService', $this->service2);
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Services\MerchantAPIService', $this->service3);
    }

    public function testExtendsBaseService()
    {
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Services\MerchantAPIBaseService', $this->service1);
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Services\MerchantAPIBaseService', $this->service2);
        $this->assertInstanceOf('\DTS\eBaySDK\MerchantAPI\Services\MerchantAPIBaseService', $this->service3);
    }
}
