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

    copy:
      build:
        files:
          [
            {
              expand: true
              flatten: true
              src: ['<%= project.app %>/*index.html']
              dest: '<%= project.dist %>/'
            }, {
              expand: true
              flatten: true
              src: ['<%= project.app %>/*/**/*.html']
              dest: '<%= project.dist %>/partials/'
            }
          ]

    jshint:
      options:
        jshintrc: '.jshintrc'
        reporter: require('jshint-stylish')
      build:
        src: ['Gruntfile.js', '<%= project.app %>/**/*.js']

    coffeelint:
      build:
        files:
          src: ['Gruntfile.coffee', '<%= project.app %>/**/*.coffee']
      
    uglify:
      options:
        banner:
          '/*\n <%= pkg.name %>
           <%= grunt.template.today("yyyy-mm-dd") %> \n*/\n'
      build:
        files:
          '<%= project.dist %>/js/controllers.min.js':
            '<%= project.app %>/**/*Controller.js'
          '<%= project.dist %>/js/services.min.js':
            '<%= project.app %>/**/*Service.js'
          '<%= project.dist %>/js/app.min.js':
            '<%= project.app %>/app.*.js'

    less:
      build:
        options:
          compress: true
        files:
          '<%= project.dist %>/css/main.css':
            '<%= project.assets %>/css/main.less'

    bower_concat:
      build:
        dest: '<%= project.dist %>/js/lib.js'

  grunt.registerTask 'default', [
    'copy', 'coffeelint', 'jshint', 'uglify', 'less', 'bower_concat'
  ]

  # ===========================================================================
  # LOAD GRUNT PLUGINS ========================================================
  # ===========================================================================
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-coffeelint'
