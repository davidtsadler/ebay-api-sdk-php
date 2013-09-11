'use strict';

module.exports = function(grunt) {
    // Project configuration.
    grunt.initConfig({
        ebay: grunt.file.readJSON('ebay.json'),

        clean: {
            dist: ['.tmp', 'dist']
        },

        download: {
            dest: '.tmp/downloads'
        },

        transform: {
            options: {
                dest: '.tmp/transformed'
            },
            dist: {
                wsdls: '<%= download.dest %>',
                ebay: '<%= ebay %>' 
            },
            test: {
                wsdls: 'test/fixtures/downloads',
                ebay: grunt.file.readJSON('test/fixtures/ebay.json')
            }
        },

        jshint: {
            all: ['Gruntfile.js', 'ebay.json', 'test/*.js'],
            options: {
                curly: true,
                eqeqeq: true,
                immed: true,
                latedef: true,
                newcap: true,
                noarg: true,
                sub: true,
                undef: true,
                boss: true,
                eqnull: true,
                node: true
            }
        },

        nodeunit: {
            tests: ['test/*_test.js']
        }
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-nodeunit');
    grunt.loadTasks('tasks');

    grunt.registerTask('test', [
        'jshint',
        'clean',
        'transform:test',
        'nodeunit'
    ]);

    grunt.registerTask('build', [
        'jshint',
        'clean:dist',
        'download',
        'transform:dist'
    ]);
};
