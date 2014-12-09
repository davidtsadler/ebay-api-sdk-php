'use strict';

var grunt = require('grunt');
var path = require('path');

module.exports = {
    test: null,

    service: null,

    phpClassForEBayTypeIsGenerated: function (name) {
        this.isPhpGenerated(this.typesClassPath(name), name);
    },

    phpUnitForEBayTypeIsGenerated: function (name) {
        this.isPhpGenerated(this.typesPhpUnitPath(name), name + 'Test');
    },

    phpClassForEBayEnumIsGenerated: function (name) {
        this.isPhpGenerated(this.enumsClassPath(name), name);
    },

    phpClassForEBayEnumIsNotGenerated: function (name) {
        this.isPhpNotGenerated(this.enumsClassPath(name), name);
    },

    phpUnitForEBayEnumIsGenerated: function (name) {
        this.isPhpGenerated(this.enumsPhpUnitPath(name), name + 'Test');
    },

    phpClassForEBayServiceIsGenerated: function () {
        this.isPhpGenerated(this.serviceClassPath(), this.service.name + 'Service');
    },

    phpUnitForEBayServiceIsGenerated: function () {
        this.isPhpGenerated(this.servicePhpUnitPath(), this.service.name + 'ServiceTest');
    },

    isPhpGenerated: function (phpFilePath, name) {
        this.test.equal(grunt.file.read(phpFilePath), grunt.file.read(path.join('test/expected/', this.service.name, name + '.php')), 'Should generate PHP for ' + name + '.');
    },

    isPhpNotGenerated: function (phpFilePath, name) {
        this.test.ok(!grunt.file.exists(phpFilePath), 'Should not generate PHP for ' + name + '.');
    },

    typesClassPath: function (name) {
        return path.join(this.srcPath(), 'Types', name + '.php');
    },

    typesPhpUnitPath: function (name) {
        return path.join(this.testPath(), 'Types', name + 'Test.php');
    },

    enumsClassPath: function (name) {
        return path.join(this.srcPath(), 'Enums', name + '.php');
    },

    enumsPhpUnitPath: function (name) {
        return path.join(this.testPath(), 'Enums', name + 'Test.php');
    },

    serviceClassPath: function () {
        return path.join(this.srcPath(), 'Services', this.service.name + 'Service.php');
    },

    servicePhpUnitPath: function () {
        return path.join(this.testPath(), 'Services', this.service.name + 'ServiceTest.php');
    },

    srcPath: function () {
        return path.join('.tmp/transformed', this.service.name, this.service.version, 'src/DTS/eBaySDK/', this.service.name);
    },

    testPath: function () {
        return path.join('.tmp/transformed', this.service.name, this.service.version, 'test/DTS/eBaySDK/', this.service.name);
    }
};
