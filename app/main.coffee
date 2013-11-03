requirejs.config
    baseUrl: 'js'

    paths:
      jquery: 'vendor/jquery'
      underscore: 'vendor/underscore'
      backbone: 'vendor/backbone'
      handlebars: 'vendor/handlebars'
      leaflet: 'vendor/leaflet'
#      On a production site the templates should be precompiled to
#      /js/templates.js to save time..
#      templates: 'views/templates'


    shim:
      underscore:
        exports: '_'
      backbone:
        deps: ['underscore', 'jquery']
        exports: 'Backbone'
      handlebars:
        exports: 'Handlebars'
#      templates:
#        deps: ['handlebars']

requirejs ['app'], (app) ->
  app()