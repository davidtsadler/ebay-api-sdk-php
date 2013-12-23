'use strict';

module.exports = function(grunt) {
    // Project configuration.
    grunt.initConfig({
        ebay: {
            dist: grunt.file.readJSON('ebay.json'),
            test: grunt.file.readJSON('test/fixtures/ebay.json')
        },

        clean: {
            dist: ['.tmp', 'dist'],
            test: '.tmp'
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
                ebay: '<%= ebay.dist %>'
            },
            test: {
                wsdls: 'test/fixtures/downloads',
                ebay: '<%= ebay.test %>'
            }
        },

        copy: {
            dist: {
                expand: true,
                cwd: '.tmp/transformed/',
                src: '**',
                dest: 'dist/',
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
        },

        bump: {
            options: {
                files: ['package.json'],
                updateConfigs: [],
                commit: true,
                commitMessage: 'Release v%VERSION%',
                commitFiles: ['package.json'],
                createTag: true,
                tagName: 'v%VERSION%',
                tagMessage: 'Version %VERSION%',
                push: true,
                pushTo: 'origin',
                gitDescribeOptions: '--tags --always --abbrev=1 --dirty=-d'
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-nodeunit');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-bump');
    grunt.loadTasks('tasks');

    grunt.registerTask('test', [
        'jshint',
        'clean:test',
        'transform:test',
        'nodeunit'
    ]);

    grunt.registerTask('build', [
        'jshint',
        'clean:dist',
        'download',
        'transform:dist',
        'copy:dist'
    ]);
};
