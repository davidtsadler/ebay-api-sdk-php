'use strict';

module.exports = function(grunt) {
    var fs = require('fs');
    var path = require('path');
    var http = require('http');
    var async = grunt.util.async;

    grunt.registerTask('download', 'Download the eBay API WSDLs / XSDs.', function () {
        grunt.config.requires('ebay.dist.services');
        grunt.config.requires('download.dest');

        var done = this.async();
        var destDirectory = path.resolve(grunt.config('download.dest'));
        var services = grunt.config('ebay.dist.services');

        grunt.file.mkdir(destDirectory);

        async.forEachSeries(services, async.apply(processService, destDirectory), function (err) {
            if (err) {
                grunt.log.error(err.message);
                done(false);
            } else {
                done(true);
            }
        });
    });
    
    function processService(destDirectory, service, callback) {
        grunt.log.writeln('Processing ' + service.name + '...');
        grunt.log.write('[' + service.version + ']...');

        grunt.file.mkdir(path.join(destDirectory, service.name, service.version));

        http.get(service.src.replace('<VERSION>', service.version), function (res) {
            res.pipe(fs.createWriteStream(path.join(destDirectory, service.name, service.version, '/api.xml')));
            res.on('end', function () {
                grunt.log.ok();
                callback();
            });
        }).on('error', function (err) {
            callback(err); 
        });
    }
};
