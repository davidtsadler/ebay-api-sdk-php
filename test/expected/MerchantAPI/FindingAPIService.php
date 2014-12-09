<?php
/**
 * THE CODE IN THIS FILE WAS GENERATED FROM THE EBAY WSDL USING THE PROJECT:
 *
 * https://github.com/davidtsadler/ebay-api-sdk-php
 *
 * Copyright 2014 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace DTS\eBaySDK\MerchantAPI\Services;

class MerchantAPIService extends \DTS\eBaySDK\MerchantAPI\Services\MerchantAPIBaseService
{
    /**
     * @param array $config Optional configuration option values.
     * @param \DTS\eBaySDK\Interfaces\HttpClientInterface $httpClient The object that will handle sending requests to the API.
     */
    public function __construct($config = array(), \DTS\eBaySDK\Interfaces\HttpClientInterface $httpClient = null)
    {
        parent::__construct($config, $httpClient);
    }

    /**
     * @param \DTS\eBaySDK\MerchantAPI\Types\MethodOneRequestType $request
     * @return \DTS\eBaySDK\MerchantAPI\Types\ComplexType
     */
    public function methodOne(\DTS\eBaySDK\MerchantAPI\Types\MethodOneRequestType $request)
    {
        return $this->callOperation(
            'MethodOne',
            $request,
            '\DTS\eBaySDK\MerchantAPI\Types\ComplexType'
        );
    }

    /**
     * @param \DTS\eBaySDK\MerchantAPI\Types\MethodTwoRequestType $request
     * @return \DTS\eBaySDK\MerchantAPI\Types\ComplexType
     */
    public function methodTwo(\DTS\eBaySDK\MerchantAPI\Types\MethodTwoRequestType $request)
    {
        return $this->callOperation(
            'methodTwo',
            $request,
            '\DTS\eBaySDK\MerchantAPI\Types\ComplexType'
        );
    }
}
