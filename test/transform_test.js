'use strict';

var _ = require('lodash');
var path = require('path');
var helper = require('./helpers');

exports.transform = {
    setUp: function (callback) {
        this.ebay = {
			"services": [
				{ "name": "FindingAPI" },
				{ "name": "MerchantAPI" }
			]
		};

        this.eBayTypes = [
            'AnotherType',
            'Base64BinaryType',
            'BooleanType',
            'ComplexType',
            'DecimalType',
            'DoubleType',
            'IntegerType',
            'MethodOneRequestType',
            'MethodTwoRequestType',
            'StringType',
            'TokenType',
            'URIType',
			'Foo'
        ];

        this.eBayEnums = [
            'EnumStringType',
            'EnumTokenType'
        ];

        this.eBayNoCallsEnums = [
            'NoCalls'
        ];

        callback();
    },

    phpClassesForEBayTypesAreGenerated: function (test) {
        helper.test = test;
		test.expect(this.eBayTypes.length * this.ebay.services.length);

		/*
		 * For each eBay type a php class file will be generated in the directory
		 * <service name>/src/DTS/eBaySDK/<service name>/Types/<type name>.php
		 */
		_.forEach(this.ebay.services, function (service) {
			helper.service = service;
			_.forEach(this.eBayTypes, function (type) {
				helper.phpClassForEBayTypeIsGenerated(type);
			});
		}, this);

        test.done();
    },

    phpUnitsForEBayTypesAreGenerated: function (test) {
        helper.test = test;
		test.expect(this.eBayTypes.length * this.ebay.services.length);

        /*
         * For each eBay type a phpunit file will be generated in the directory
         * <service name>/test/DTS/eBaySDK/<service name>/Types/<type name>Test.php
         */
		_.forEach(this.ebay.services, function (service) {
			helper.service = service;
			_.forEach(this.eBayTypes, function (type) {
				helper.phpUnitForEBayTypeIsGenerated(type);
			});
		}, this);

        test.done();
    },

    phpClassesForEBayEnumsAreGenerated: function (test) {
        helper.test = test;
		test.expect(this.eBayEnums.length * this.ebay.services.length);

        /*
         * For each eBay enum a php class file will be generated in the directory
         * <service name>/src/DTS/eBaySDK/<service name>/Enums/<enum name>.php
         */
		_.forEach(this.ebay.services, function (service) {
			helper.service = service;
			_.forEach(this.eBayEnums, function (name) {
				helper.phpClassForEBayEnumIsGenerated(name);
			});
		}, this);

        test.done();
    },

    phpClassesForNoCallsEBayEnumsAreNotGenerated: function (test) {
        helper.test = test;
		test.expect(this.eBayNoCallsEnums.length * this.ebay.services.length);

        /*
         * For each eBay enum where each value is 'NoCalls', no php class file will be generated in the directory
         * <service name>/src/DTS/eBaySDK/<service name>/Enums/<enum name>.php
         */
		_.forEach(this.ebay.services, function (service) {
			helper.service = service;
			_.forEach(this.eBayNoCallsEnums, function (name) {
				helper.phpClassForEBayEnumIsNotGenerated(name);
			});
		}, this);

        test.done();
    },

    phpUnitsForEBayEnumsAreGenerated: function (test) {
        helper.test = test;
		test.expect(this.eBayEnums.length * this.ebay.services.length);

        /*
         * For each eBay enum a phpunit file should be generated in the directory
         * <service name>/test/DTS/eBaySDK/<service name>/Enums/<type name>Test.php
         */
		_.forEach(this.ebay.services, function (service) {
			helper.service = service;
			_.forEach(this.eBayEnums, function (name) {
				helper.phpUnitForEBayEnumIsGenerated(name);
			});
		}, this);

        test.done();
    },

    phpClasseForEBayServiceIsGenerated: function (test) {
        helper.test = test;
        helper.service = this.ebay.services[0];
        test.expect(1);

        /*
         * For the eBay service a php class file will be generated in the directory
         * <service name>/src/DTS/eBaySDK/<service name>/Services/<service name>.php
         */
        helper.phpClassForEBayServiceIsGenerated();

        test.done();
    },

    phpUnitForEBayServiceIsGenerated: function (test) {
        helper.test = test;
        helper.service = this.ebay.services[0];
        test.expect(1);

        /*
         * For the eBay service a phpunit file will be generated in the directory
         * <service name>/test/DTS/eBaySDK/<service name>/Services/<service name>.php
         */
        helper.phpUnitForEBayServiceIsGenerated();

        test.done();
    },

    phpClasseForEBayServiceIsNotGenerated: function (test) {
        helper.test = test;
        helper.service = this.ebay.services[1];
        test.expect(1);

        /*
         * Some APIs do not have a service.
         */
        helper.phpClassForEBayServiceIsNotGenerated();

        test.done();
    },

    phpUnitForEBayServiceIsNotGenerated: function (test) {
        helper.test = test;
        helper.service = this.ebay.services[1];
        test.expect(1);

        /*
         * Some APIs do not have a service.
         */
        helper.phpUnitForEBayServiceIsNotGenerated();

        test.done();
    }
};
