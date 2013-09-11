'use strict';

var grunt = require('grunt');
var path = require('path');

exports.transform = {

    setUp: function (callback) {
        this.ebay = grunt.file.readJSON('test/fixtures/ebay.json');
        this._ = grunt.util._;

        callback();
    },

    transformDirectoryIsCreated: function (test) {
        test.expect(1);

        test.ok(grunt.file.exists('.tmp/transformed'), 'Transformed directory should exist.');

        test.done();
    },

    serviceDirectoriesAreCreated: function (test) {
        test.expect(2);

        this._.forEach(this.ebay.services, function (service) {
            test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name)), 'Transformed service directory should exist.');
        });

        test.done();
    },

    versionDirectoriesAreCreated: function (test) {
        test.expect(4);

        this._.forEach(this.ebay.services, function (service) {
            this._.forEach(service.versions, function (version) {
                test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version)), 'Transformed version directory should exist.');
            });
        }, this);

        test.done();
    },

    filesAreCreated: function (test) {
        var service = this.ebay.services[0];
        var version = service.versions[0];

        test.expect(1);

        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'ComplexType.php')), 'Transformed PHP file should exist.');

        test.done();
    },

    phpIsGenerated: function (test) {
        var service = this.ebay.services[0];
        var version = service.versions[0];

        test.expect(1);

        var actual = grunt.file.read(path.join('.tmp/transformed', service.name, version, 'ComplexType.php'));
        var expected = grunt.file.read('test/expected/ComplexType.php');
        test.equal(actual, expected, 'should generate PHP');

        test.done();
    }
};
