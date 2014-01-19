<?php
namespace DTS\eBaySDK\FindingAPI\Services;

class FindingAPIService extends \DTS\eBaySDK\FindingAPI\Services\FindingAPIBaseService
{
    public function __construct($config = [])
    {
        parent::__construct($config);
    }

    /**
     * @param \DTS\eBaySDK\FindingAPI\Types\ComplexType $request
     * @return \DTS\eBaySDK\FindingAPI\Types\ComplexType
     */
    public function methodOne(\DTS\eBaySDK\FindingAPI\Types\ComplexType $request)
    {
        $this->callOperation('MethodOne', $request->toXml('MethodOneRequest', true));    
    }

    /**
     * @param \DTS\eBaySDK\FindingAPI\Types\ComplexType $request
     * @return \DTS\eBaySDK\FindingAPI\Types\ComplexType
     */
    public function methodTwo(\DTS\eBaySDK\FindingAPI\Types\ComplexType $request)
    {
        $this->callOperation('methodTwo', $request->toXml('methodTwoRequest', true));    
    }
}
