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

    transformDirectoryIsCreated: function (test) {
        test.expect(1);

        helper.isCreated(test, '.tmp/transformed');

        test.done();
    },

    serviceDirectoriesAreCreated: function (test) {
        test.expect(2);

        this._.forEach(this.ebay.services, function (service) {
            helper.isCreated(test, path.join('.tmp/transformed', service.name));
        });

        test.done();
    },

    versionDirectoriesAreCreated: function (test) {
        test.expect(4);

        this._.forEach(this.ebay.services, function (service) {
            this._.forEach(service.versions, function (version) {
                helper.isCreated(test, path.join('.tmp/transformed', service.name, version));
            });
        }, this);

        test.done();
    },

    filesAreCreated: function (test) {
        var service = this.ebay.services[0];
        var version = service.versions[0];

        test.expect(10);

        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'AnotherType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'Base64BinaryType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'BooleanType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'ComplexType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'DecimalType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'DoubleType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'IntegerType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'StringType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'TokenType.php'));
        helper.isCreated(test, path.join('.tmp/transformed', service.name, version, 'URIType.php'));

        test.done();
    },

    phpIsGenerated: function (test) {
        var service = this.ebay.services[0];
        var version = service.versions[0];
        var testPath = path.join('.tmp/transformed', service.name, version);
        var actual;
        var expected;

        test.expect(10);

        actual = grunt.file.read(path.join(testPath, 'AnotherType.php'));
        expected = grunt.file.read('test/expected/AnotherType.php');
        test.equal(actual, expected, 'should generate PHP for class AnotherType.');

        actual = grunt.file.read(path.join(testPath, 'Base64BinaryType.php'));
        expected = grunt.file.read('test/expected/Base64BinaryType.php');
        test.equal(actual, expected, 'should generate PHP for class Base64BinaryType.');

        actual = grunt.file.read(path.join(testPath, 'BooleanType.php'));
        expected = grunt.file.read('test/expected/BooleanType.php');
        test.equal(actual, expected, 'should generate PHP for class BooleanType.');

        actual = grunt.file.read(path.join(testPath, 'ComplexType.php'));
        expected = grunt.file.read('test/expected/ComplexType.php');
        test.equal(actual, expected, 'should generate expected PHP for class ComplexType.');

        actual = grunt.file.read(path.join(testPath, 'DecimalType.php'));
        expected = grunt.file.read('test/expected/DecimalType.php');
        test.equal(actual, expected, 'should generate PHP for class DecimalType.');

        actual = grunt.file.read(path.join(testPath, 'DoubleType.php'));
        expected = grunt.file.read('test/expected/DoubleType.php');
        test.equal(actual, expected, 'should generate PHP for class DoubleType.');

        actual = grunt.file.read(path.join(testPath, 'IntegerType.php'));
        expected = grunt.file.read('test/expected/IntegerType.php');
        test.equal(actual, expected, 'should generate PHP for class IntegerType.');

        actual = grunt.file.read(path.join(testPath, 'StringType.php'));
        expected = grunt.file.read('test/expected/StringType.php');
        test.equal(actual, expected, 'should generate PHP for class StringType.');

        actual = grunt.file.read(path.join(testPath, 'TokenType.php'));
        expected = grunt.file.read('test/expected/TokenType.php');
        test.equal(actual, expected, 'should generate PHP for class TokenType.');

        actual = grunt.file.read(path.join(testPath, 'URIType.php'));
        expected = grunt.file.read('test/expected/URIType.php');
        test.equal(actual, expected, 'should generate PHP for class URIType.');

        test.done();
    }
};
