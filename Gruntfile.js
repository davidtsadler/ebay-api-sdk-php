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

    grunt.registerTask('test', ['jshint', 'nodeunit']);

    grunt.registerTask('build', [
        'jshint',
        'clean:dist',
        'download',
    ]);
};
