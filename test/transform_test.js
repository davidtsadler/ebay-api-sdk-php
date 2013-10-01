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
        var srcPath = path.join('.tmp/transformed', service.name, version, 'src/DTS/eBaySDK/', service.name, 'Types');
        var testPath = path.join('.tmp/transformed', service.name, version, 'test/DTS/eBaySDK/', service.name, 'Types');

        test.expect(24);

        helper.isCreated(test, path.join(srcPath, 'AnotherType.php'));
        helper.isCreated(test, path.join(srcPath, 'Base64BinaryType.php'));
        helper.isCreated(test, path.join(srcPath, 'BooleanType.php'));
        helper.isCreated(test, path.join(srcPath, 'ComplexType.php'));
        helper.isCreated(test, path.join(srcPath, 'DecimalType.php'));
        helper.isCreated(test, path.join(srcPath, 'DoubleType.php'));
        helper.isCreated(test, path.join(srcPath, 'EnumStringType.php'));
        helper.isCreated(test, path.join(srcPath, 'EnumTokenType.php'));
        helper.isCreated(test, path.join(srcPath, 'IntegerType.php'));
        helper.isCreated(test, path.join(srcPath, 'StringType.php'));
        helper.isCreated(test, path.join(srcPath, 'TokenType.php'));
        helper.isCreated(test, path.join(srcPath, 'URIType.php'));

        helper.isCreated(test, path.join(testPath, 'AnotherTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'Base64BinaryTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'BooleanTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'ComplexTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'DecimalTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'DoubleTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'IntegerTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'StringTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'TokenTypeTest.php'));
        helper.isCreated(test, path.join(testPath, 'URITypeTest.php'));

        helper.isNotCreated(test, path.join(testPath, 'EnumStringType.php'));
        helper.isNotCreated(test, path.join(testPath, 'EnumTokenType.php'));

        test.done();
    },

    phpIsGenerated: function (test) {
        var service = this.ebay.services[0];
        var version = service.version;
        var srcPath = path.join('.tmp/transformed', service.name, version, 'src/DTS/eBaySDK/', service.name, 'Types');
        var testPath = path.join('.tmp/transformed', service.name, version, 'test/DTS/eBaySDK/', service.name, 'Types');
        var actual;
        var expected;

        test.expect(22);

        actual = grunt.file.read(path.join(srcPath, 'AnotherType.php'));
        expected = grunt.file.read('test/expected/AnotherType.php');
        test.equal(actual, expected, 'should generate PHP for class AnotherType.');

        actual = grunt.file.read(path.join(srcPath, 'Base64BinaryType.php'));
        expected = grunt.file.read('test/expected/Base64BinaryType.php');
        test.equal(actual, expected, 'should generate PHP for class Base64BinaryType.');

        actual = grunt.file.read(path.join(srcPath, 'BooleanType.php'));
        expected = grunt.file.read('test/expected/BooleanType.php');
        test.equal(actual, expected, 'should generate PHP for class BooleanType.');

        actual = grunt.file.read(path.join(srcPath, 'ComplexType.php'));
        expected = grunt.file.read('test/expected/ComplexType.php');
        test.equal(actual, expected, 'should generate expected PHP for class ComplexType.');

        actual = grunt.file.read(path.join(srcPath, 'DecimalType.php'));
        expected = grunt.file.read('test/expected/DecimalType.php');
        test.equal(actual, expected, 'should generate PHP for class DecimalType.');

        actual = grunt.file.read(path.join(srcPath, 'DoubleType.php'));
        expected = grunt.file.read('test/expected/DoubleType.php');
        test.equal(actual, expected, 'should generate PHP for class DoubleType.');

        actual = grunt.file.read(path.join(srcPath, 'EnumStringType.php'));
        expected = grunt.file.read('test/expected/EnumStringType.php');
        test.equal(actual, expected, 'should generate PHP for class EnumStringType.');

        actual = grunt.file.read(path.join(srcPath, 'EnumTokenType.php'));
        expected = grunt.file.read('test/expected/EnumTokenType.php');
        test.equal(actual, expected, 'should generate PHP for class EnumTokeType.');

        actual = grunt.file.read(path.join(srcPath, 'IntegerType.php'));
        expected = grunt.file.read('test/expected/IntegerType.php');
        test.equal(actual, expected, 'should generate PHP for class IntegerType.');

        actual = grunt.file.read(path.join(srcPath, 'StringType.php'));
        expected = grunt.file.read('test/expected/StringType.php');
        test.equal(actual, expected, 'should generate PHP for class StringType.');

        actual = grunt.file.read(path.join(srcPath, 'TokenType.php'));
        expected = grunt.file.read('test/expected/TokenType.php');
        test.equal(actual, expected, 'should generate PHP for class TokenType.');

        actual = grunt.file.read(path.join(srcPath, 'URIType.php'));
        expected = grunt.file.read('test/expected/URIType.php');
        test.equal(actual, expected, 'should generate PHP for class URIType.');

        actual = grunt.file.read(path.join(testPath, 'AnotherTypeTest.php'));
        expected = grunt.file.read('test/expected/AnotherTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class AnotherType.');

        actual = grunt.file.read(path.join(testPath, 'Base64BinaryTypeTest.php'));
        expected = grunt.file.read('test/expected/Base64BinaryTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class Base64BinaryType.');

        actual = grunt.file.read(path.join(testPath, 'BooleanTypeTest.php'));
        expected = grunt.file.read('test/expected/BooleanTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class BooleanType.');

        actual = grunt.file.read(path.join(testPath, 'ComplexTypeTest.php'));
        expected = grunt.file.read('test/expected/ComplexTypeTest.php');
        test.equal(actual, expected, 'should generate expected PHPUNIT for class ComplexType.');

        actual = grunt.file.read(path.join(testPath, 'DecimalTypeTest.php'));
        expected = grunt.file.read('test/expected/DecimalTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class DecimalType.');

        actual = grunt.file.read(path.join(testPath, 'DoubleTypeTest.php'));
        expected = grunt.file.read('test/expected/DoubleTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class DoubleType.');

        actual = grunt.file.read(path.join(testPath, 'IntegerTypeTest.php'));
        expected = grunt.file.read('test/expected/IntegerTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class IntegerType.');

        actual = grunt.file.read(path.join(testPath, 'StringTypeTest.php'));
        expected = grunt.file.read('test/expected/StringTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class StringType.');

        actual = grunt.file.read(path.join(testPath, 'TokenTypeTest.php'));
        expected = grunt.file.read('test/expected/TokenTypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class TokenType.');

        actual = grunt.file.read(path.join(testPath, 'URITypeTest.php'));
        expected = grunt.file.read('test/expected/URITypeTest.php');
        test.equal(actual, expected, 'should generate PHPUNIT for class URIType.');
        test.done();
    }
};
