<?php
/**
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

namespace DTS\eBaySDK\FindingAPI\Services;

class FindingAPIService extends \DTS\eBaySDK\FindingAPI\Services\FindingAPIBaseService
{
    /**
     * @param \DTS\eBaySDK\Interfaces\HttpClientInterface $httpClient The object that will handle sending requests to the API.
     * @param array $config Optional configuration option values. 
     */
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
        return $this->callOperation(
            'MethodOne',
            $request->toXml('MethodOneRequest', true),
            '\DTS\eBaySDK\FindingAPI\Types\ComplexType'
        );
    }

    /**
     * @param \DTS\eBaySDK\FindingAPI\Types\ComplexType $request
     * @return \DTS\eBaySDK\FindingAPI\Types\ComplexType
     */
    public function methodTwo(\DTS\eBaySDK\FindingAPI\Types\ComplexType $request)
    {
        return $this->callOperation(
            'methodTwo',
            $request->toXml('methodTwoRequest', true),
            '\DTS\eBaySDK\FindingAPI\Types\ComplexType'
        );
    }
}
