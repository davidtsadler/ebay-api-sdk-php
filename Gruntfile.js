module.exports = function(grunt) {
    // Project configuration.
    grunt.initConfig({
		nodeunit: {
			tests: ['test/*_test.js']
		}
    });

	grunt.loadNpmTasks('grunt-contrib-nodeunit');

	grunt.registerTask('test', ['nodeunit']);
};
