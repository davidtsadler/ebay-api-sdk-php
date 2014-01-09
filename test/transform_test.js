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

    directoriesAreCreated: function (test) {
        test.expect(4);

        this._.forEach(this.ebay.services, function (service) {
            helper.isCreated(test, path.join('.tmp/transformed', service.name, service.version, 'src/DTS/eBaySDK/', service.name));
            helper.isCreated(test, path.join('.tmp/transformed', service.name, service.version, 'test/DTS/eBaySDK/', service.name));
        });

        test.done();
    },

    filesAreCreated: function (test) {
        var service = this.ebay.services[0];
        var version = service.version;
        var classSrcPath = path.join('.tmp/transformed', service.name, version, 'src/DTS/eBaySDK/', service.name, 'Types');
        var serviceSrcPath = path.join('.tmp/transformed', service.name, version, 'src/DTS/eBaySDK/', service.name, 'Services');
        var classTestPath = path.join('.tmp/transformed', service.name, version, 'test/DTS/eBaySDK/', service.name, 'Types');
        var serviceTestPath = path.join('.tmp/transformed', service.name, version, 'test/DTS/eBaySDK/', service.name, 'Services');

        test.expect(26);

        helper.isCreated(test, path.join(classSrcPath, 'AnotherType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'Base64BinaryType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'BooleanType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'ComplexType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'DecimalType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'DoubleType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'EnumStringType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'EnumTokenType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'IntegerType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'StringType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'TokenType.php'));
        helper.isCreated(test, path.join(classSrcPath, 'URIType.php'));
        helper.isCreated(test, path.join(serviceSrcPath, 'FindingAPIService.php'));

        helper.isCreated(test, path.join(classTestPath, 'AnotherTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'Base64BinaryTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'BooleanTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'ComplexTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'DecimalTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'DoubleTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'IntegerTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'StringTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'TokenTypeTest.php'));
        helper.isCreated(test, path.join(classTestPath, 'URITypeTest.php'));
        helper.isCreated(test, path.join(serviceTestPath, 'FindingAPIServiceTest.php'));

        helper.isNotCreated(test, path.join(classTestPath, 'EnumStringType.php'));
        helper.isNotCreated(test, path.join(classTestPath, 'EnumTokenType.php'));

        test.done();
    },

    phpIsGenerated: function (test) {
        var service = this.ebay.services[0];
        var version = service.version;
        var classSrcPath = path.join('.tmp/transformed', service.name, version, 'src/DTS/eBaySDK/', service.name, 'Types');
        var serviceSrcPath = path.join('.tmp/transformed', service.name, version, 'src/DTS/eBaySDK/', service.name, 'Services');
        var classTestPath = path.join('.tmp/transformed', service.name, version, 'test/DTS/eBaySDK/', service.name, 'Types');
        var serviceTestPath = path.join('.tmp/transformed', service.name, version, 'test/DTS/eBaySDK/', service.name, 'Services');
        var actual;
        var expected;

        test.expect(24);

        actual = grunt.file.read(path.join(classSrcPath, 'AnotherType.php'));
        expected = grunt.file.read('test/expected/AnotherType.php');
        test.equal(actual, expected, 'should generate PHP for class AnotherType.');

        actual = grunt.file.read(path.join(classSrcPath, 'Base64BinaryType.php'));
        expected = grunt.file.read('test/expected/Base64BinaryType.php');
        test.equal(actual, expected, 'should generate PHP for class Base64BinaryType.');

        actual = grunt.file.read(path.join(classSrcPath, 'BooleanType.php'));
        expected = grunt.file.read('test/expected/BooleanType.php');
        test.equal(actual, expected, 'should generate PHP for class BooleanType.');

        actual = grunt.file.read(path.join(classSrcPath, 'ComplexType.php'));
        expected = grunt.file.read('test/expected/ComplexType.php');
        test.equal(actual, expected, 'should generate expected PHP for class ComplexType.');

        actual = grunt.file.read(path.join(classSrcPath, 'DecimalType.php'));
        expected = grunt.file.read('test/expected/DecimalType.php');
        test.equal(actual, expected, 'should generate PHP for class DecimalType.');

        actual = grunt.file.read(path.join(classSrcPath, 'DoubleType.php'));
        expected = grunt.file.read('test/expected/DoubleType.php');
        test.equal(actual, expected, 'should generate PHP for class DoubleType.');

        actual = grunt.file.read(path.join(classSrcPath, 'EnumStringType.php'));
        expected = grunt.file.read('test/expected/EnumStringType.php');
        test.equal(actual, expected, 'should generate PHP for class EnumStringType.');

        actual = grunt.file.read(path.join(classSrcPath, 'EnumTokenType.php'));
        expected = grunt.file.read('test/expected/EnumTokenType.php');
        test.equal(actual, expected, 'should generate PHP for class EnumTokeType.');

        actual = grunt.file.read(path.join(classSrcPath, 'IntegerType.php'));
        expected = grunt.file.read('test/expected/IntegerType.php');
        test.equal(actual, expected, 'should generate PHP for class IntegerType.');

        actual = grunt.file.read(path.join(classSrcPath, 'StringType.php'));
        expected = grunt.file.read('test/expected/StringType.php');
        test.equal(actual, expected, 'should generate PHP for class StringType.');

        actual = grunt.file.read(path.join(classSrcPath, 'TokenType.php'));
        expected = grunt.file.read('test/expected/TokenType.php');
        test.equal(actual, expected, 'should generate PHP for class TokenType.');

        actual = grunt.file.read(path.join(classSrcPath, 'URIType.php'));
        expected = grunt.file.read('test/expected/URIType.php');
        test.equal(actual, expected, 'should generate PHP for class URIType.');

        actual = grunt.file.read(path.join(serviceSrcPath, 'FindingAPIService.php'));
        expected = grunt.file.read('test/expected/FindingAPIService.php');
        test.equal(actual, expected, 'should generate PHP for class FindingAPIService.');

        actual = grunt.file.read(path.join(classTestPath, 'AnotherTypeTest.php'));
        expected = grunt.file.read('test/expected/AnotherTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class AnotherType.');

        actual = grunt.file.read(path.join(classTestPath, 'Base64BinaryTypeTest.php'));
        expected = grunt.file.read('test/expected/Base64BinaryTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class Base64BinaryType.');

        actual = grunt.file.read(path.join(classTestPath, 'BooleanTypeTest.php'));
        expected = grunt.file.read('test/expected/BooleanTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class BooleanType.');

        actual = grunt.file.read(path.join(classTestPath, 'ComplexTypeTest.php'));
        expected = grunt.file.read('test/expected/ComplexTypeTest.php');
        test.equal(actual, expected, 'should generate expected PHPUNIT for class ComplexType.');

        actual = grunt.file.read(path.join(classTestPath, 'DecimalTypeTest.php'));
        expected = grunt.file.read('test/expected/DecimalTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class DecimalType.');

        actual = grunt.file.read(path.join(classTestPath, 'DoubleTypeTest.php'));
        expected = grunt.file.read('test/expected/DoubleTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class DoubleType.');

        actual = grunt.file.read(path.join(classTestPath, 'IntegerTypeTest.php'));
        expected = grunt.file.read('test/expected/IntegerTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class IntegerType.');

        actual = grunt.file.read(path.join(classTestPath, 'StringTypeTest.php'));
        expected = grunt.file.read('test/expected/StringTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class StringType.');

        actual = grunt.file.read(path.join(classTestPath, 'TokenTypeTest.php'));
        expected = grunt.file.read('test/expected/TokenTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class TokenType.');

        actual = grunt.file.read(path.join(classTestPath, 'URITypeTest.php'));
        expected = grunt.file.read('test/expected/URITypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class URIType.');

        actual = grunt.file.read(path.join(serviceTestPath, 'FindingAPIServiceTest.php'));
        expected = grunt.file.read('test/expected/FindingAPIServiceTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class FindingAPIService.');

        test.done();
    }
};
