'use strict';

var grunt = require('grunt');
var path = require('path');

module.exports = {
    isCreated: function (test, path) {
        test.ok(grunt.file.exists(path), path + ' should be created.');
    }
};
