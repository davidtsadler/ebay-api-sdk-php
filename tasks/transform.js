'use strict';

module.exports = function(grunt) {
    var path = require('path');
    var exec = require('child_process').exec;
    var async = grunt.util.async;

    grunt.registerMultiTask('transform', 'Transform the downloaded eBay API WSDLs / XSDs into PHP.', function () {
        var options = this.options();
        var done = this.async();
        var xmlDirectory = path.resolve(this.data.xml);
        var destDirectory = path.resolve(options.dest);
        var services = this.data.ebay.services;

        grunt.file.mkdir(destDirectory);

        async.forEachSeries(services, async.apply(processService, xmlDirectory, destDirectory), function (err) {
            if (err) {
                grunt.log.error(err.message);
                done(false);
            } else {
                done(true);
            }
        });
    });

    function processService(xmlDirectory, destDirectory, service, callback) {
        var xml = path.join(xmlDirectory, service.name, service.version, '/api.xml');
        var phpPath = path.join(destDirectory, service.name, service.version);

        grunt.log.writeln('Processing ' + service.name + '...');
        grunt.log.write('[' + service.version + ']...');

        grunt.file.mkdir(phpPath);

        saxonb(xml, 'xsl/sdk.xsl', service.name, phpPath, function (err) { 
            if (err) {
                callback(err);
            } else {
                grunt.log.ok();
                callback();
            }
        });
    }

    function saxonb(xml, xsl, service, destDirectory, callback) {
        var cmd = 'saxonb-xslt ' + [
            '-ext:on',
            '-s:' + path.resolve(xml),
            '-xsl:' + path.resolve(xsl),
            'service=' + service,
            'destDirectory=' + destDirectory
        ].join(' ');

        grunt.log.debug(cmd);

        var child = exec(cmd, function (err, stdout, stderr) {
            callback(err);
        });
    }
};
