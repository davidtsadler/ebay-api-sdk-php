'use strict';

var grunt = require('grunt');
var path = require('path');
var helper = require('./helpers');

exports.transform = {

    setUp: function (callback) {
        this.ebay = grunt.file.readJSON('test/fixtures/ebay.json');
        this._ = grunt.util._;

        callback();
    },

    distDirectoryIsCreated: function (test) {
        test.expect(1);

        helper.isCreated(test, '.tmp/dist');

        test.done();
    },

    serviceDirectoriesAreCreated: function (test) {
        test.expect(2);

        this._.forEach(this.ebay.services, function (service) {
            helper.isCreated(test, path.join('.tmp/dist', service.name));
        });

        test.done();
    },

    versionDirectoriesAreCreated: function (test) {
        test.expect(4);

        this._.forEach(this.ebay.services, function (service) {
            this._.forEach(service.versions, function (version) {
                helper.isCreated(test, path.join('.tmp/dist', service.name, version));
            });
        }, this);

        test.done();
    },

    dtsDirectoriesAreCreated: function (test) {
        test.expect(4);

        this._.forEach(this.ebay.services, function (service) {
            this._.forEach(service.versions, function (version) {
                helper.isCreated(test, path.join('.tmp/dist', service.name, version, 'dts'));
            });
        }, this);

        test.done();
    },

    ebaysdkDirectoriesAreCreated: function (test) {
        test.expect(4);

        this._.forEach(this.ebay.services, function (service) {
            this._.forEach(service.versions, function (version) {
                helper.isCreated(test, path.join('.tmp/dist', service.name, version, 'dts', 'ebaysdk'));
            });
        }, this);

        test.done();
    },

    baseDirectoriesAreCreated: function (test) {
        test.expect(4);

        this._.forEach(this.ebay.services, function (service) {
            this._.forEach(service.versions, function (version) {
                helper.isCreated(test, path.join('.tmp/dist', service.name, version, 'dts', 'ebaysdk', 'base'));
            });
        }, this);

        test.done();
    },

    sdkServiceDirectoriesAreCreated: function (test) {
        test.expect(4);

        this._.forEach(this.ebay.services, function (service) {
            this._.forEach(service.versions, function (version) {
                helper.isCreated(test, path.join('.tmp/dist', service.name, version, 'dts', 'ebaysdk',  service.name));
            });
        }, this);

        test.done();
    }
};
