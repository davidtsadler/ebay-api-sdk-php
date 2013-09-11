'use strict';

var grunt = require('grunt');

exports.test = {
    test: function (test) {
        test.expect(1);

        test.ok(true);

        test.done();
    }
};
