'use strict';

module.exports = function(grunt) {
    var path = require('path');
    var exec = require('child_process').exec;
    var async = grunt.util.async;

    grunt.registerMultiTask('transform', 'Transform the downloaded eBay API WSDLs into PHP.', function () {
        var options = this.options();
        var done = this.async();
        var wsdlDirectory = path.resolve(this.data.wsdls);
        var destDirectory = path.resolve(options.dest);
        var services = this.data.ebay.services;

        grunt.file.mkdir(destDirectory);

        async.forEachSeries(services, async.apply(processService, wsdlDirectory, destDirectory), function (err) {
            if (err) {
                grunt.log.error(err.message);
                done(false);
            } else {
                done(true);
            }
        });
    });

    function processService(wsdlDirectory, destDirectory, service, callback) {
        grunt.log.writeln('Processing ' + service.name + '...');
        async.forEachSeries(service.versions, async.apply(processVersion, service, wsdlDirectory, destDirectory), function (err) {
            if (err) {
                callback(err);
            } else {
                callback();
            }
        });
    }

    function processVersion(service, wsdlDirectory, destDirectory, version, callback) {
        var wsdl = path.join(wsdlDirectory, service.name, version, '/api.wsdl');
        var phpPath = path.join(destDirectory, service.name, version);

        grunt.log.write('[' + version + ']...');

        grunt.file.mkdir(phpPath);

        saxonb(wsdl, 'xsl/sdk.xsl', service.name, phpPath, function (err) { 
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
