# Gruntfile.js
'use strict'

# our wrapper function (required by grunt and its plugins)
# all configuration goes inside this function
module.exports = (grunt) ->

  # ===========================================================================
  # CONFIGURE GRUNT ===========================================================
  # ===========================================================================

  # Configurable paths for the application
  projectConfig =
    app: require('./bower.json').appPath or 'app'
    dist: 'dist'
    assets: 'assets'

  grunt.initConfig
    project: projectConfig

    pkg: grunt.file.readJSON('package.json')

    jshint:
      options:
        jshintrc: '.jshintrc'
        reporter: require('jshint-stylish')
      build:
        src: ['Gruntfile.js', '<%= project.app %>/**/*.js']
      
    uglify:
      options:
        banner: '/*\n <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> \n*/\n'
      build:
        files:
          '<%= project.dist %>/js/controllers.min.js': '<%= project.app %>/**/*Controller.js'
          '<%= project.dist %>/js/services.min.js': '<%= project.app %>/**/*Service.js'
          '<%= project.dist %>/js/app.min.js': '<%= project.app %>/app.*.js'

    less:
      build:
        options:
          compress: true
        files:
          '<%= project.dist %>/css/main.css': '<%= project.assets %>/css/main.less'

    bower_concat:
      all:
        dest: '<%= project.dist %>/js/lib.js'

  grunt.registerTask 'default', ['jshint', 'uglify', 'less', 'bower_concat']

  # ===========================================================================
  # LOAD GRUNT PLUGINS ========================================================
  # ===========================================================================
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-bower-concat'