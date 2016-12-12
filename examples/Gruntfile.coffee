module.exports = (grunt) ->
  LIVERELOAD_PORT = 35729
  project = "#{__dirname}"
  root = 'app'

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig
    watch:
      configFiles:
        files: [
          'Gruntfile.coffee'
          'config/*.{coffee,js}'
        ]
        options:
          reload: true
          livereload: LIVERELOAD_PORT
      coffee:
        files: [
          "#{root}/scripts/**/*.coffee"
        ]
        tasks: ['coffee:compile']
      js:
        files: [
          "#{root}/scripts/**/*.js"
        ]
      html:
        files: [
          "#{root}/index.html"
          "#{root}/views/**/*.html"
        ]
      css:
        files: [
          "#{root}/styles/**/*.css"
        ]
      sass:
        files: [
          "#{root}/styles/**/*.{sass,scss}"
        ]
        tasks: ['compass:compile']
      # less:
      #   files: [
      #     "#{root}/styles/**/*.less"
      #   ]
      images:
        files: [
          "#{root}/images/**/*.{png,jpg,jpeg,gif,webp,svg}"
        ]

    connect:
      server:
        options:
          port: 9000
          hostname: 'localhost'
          base: 'app'

    open:
      server:
        path: "http://localhost:9000"

    coffee:
      compile:
        expand: true,
        flatten: true,
        cwd: "#{root}/scripts/"
        src: [
          '*.coffee'
        ]
        dest: '.tmp/scripts/'
        ext: '.js'

    compass:
      compile:
        options:
          expand: true,
          cwd: "#{root}/styles/"
          src: [
            '*.{sass,scss}'
          ]
          dest: '.tmp/styles/'
          ext: '.css'

    clean:
      options:
        'no-write': false
      build: [
        'dist'
      ]
      dependencies: [
        "#{project}/node_modules/"
        "#{root}/lib/"
      ]
      server: '.tmp'

  grunt.registerTask 'serve', (target) ->
    return grunt.task.run [
      'clean:server'
      'connect'
      'watch'
      'open'
    ]
  grunt.registerTask 'default', [
    'serve'
  ]
