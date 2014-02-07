<?php
namespace DTS\eBaySDK\FindingAPI\Services;

class FindingAPIService extends \DTS\eBaySDK\FindingAPI\Services\FindingAPIBaseService
{
    public function __construct(\DTS\eBaySDK\Interfaces\HttpClientInterface $httpClient, $config = array())
    {
        parent::__construct($httpClient, $config);
    }

    /**
     * @param \DTS\eBaySDK\FindingAPI\Types\ComplexType $request
     * @return \DTS\eBaySDK\FindingAPI\Types\ComplexType
     */
    public function methodOne(\DTS\eBaySDK\FindingAPI\Types\ComplexType $request)
    {
        return $this->callOperation('MethodOne', $request->toXml('MethodOneRequest', true));    
    }

    /**
     * @param \DTS\eBaySDK\FindingAPI\Types\ComplexType $request
     * @return \DTS\eBaySDK\FindingAPI\Types\ComplexType
     */
    public function methodTwo(\DTS\eBaySDK\FindingAPI\Types\ComplexType $request)
    {
        return $this->callOperation('methodTwo', $request->toXml('methodTwoRequest', true));    
    }
}
