<?php
namespace DTS\eBaySDK\FindingAPI\Services;

class FindingAPIService extends \DTS\eBaySDK\Services\BaseService
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @param \DTS\eBaySDK\FindingAPI\Types\ComplexType $request
     * @return \DTS\eBaySDK\FindingAPI\Types\ComplexType
     */
    public function methodOne(\DTS\eBaySDK\FindingAPI\Types\ComplexType $request)
    {
        $this->callOperation('MethodOne', $request->toXml('MethodOneRequest'));    
    }

    /**
     * @param \DTS\eBaySDK\FindingAPI\Types\ComplexType $request
     * @return \DTS\eBaySDK\FindingAPI\Types\ComplexType
     */
    public function methodTwo(\DTS\eBaySDK\FindingAPI\Types\ComplexType $request)
    {
        $this->callOperation('methodTwo', $request->toXml('methodTwoRequest'));    
    }
}
