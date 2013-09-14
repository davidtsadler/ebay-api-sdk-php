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

        test.expect(10);

        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'AnotherType.php')), 'File should exist for class AnotherType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'Base64BinaryType.php')), 'File should exist for class Base64BinaryType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'BooleanType.php')), 'File should exist for class BooleanType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'ComplexType.php')), 'File should exist for class ComplexType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'DecimalType.php')), 'File should exist for class DecimalType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'DoubleType.php')), 'File should exist for class DoubleType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'IntegerType.php')), 'File should exist for class IntegerType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'StringType.php')), 'File should exist for class StringType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'TokenType.php')), 'File should exist for class TokenType.');
        test.ok(grunt.file.exists(path.join('.tmp/transformed', service.name, version, 'URIType.php')), 'File should exist for class URIType.');

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
