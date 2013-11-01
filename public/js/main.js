(function() {
  requirejs.config({
    baseUrl: 'js',
    paths: {
      jquery: 'vendor/jquery',
      underscore: 'vendor/underscore',
      backbone: 'vendor/backbone',
      handlebars: 'vendor/handlebars',
      leaflet: 'vendor/leaflet'
    },
    shim: {
      underscore: {
        exports: '_'
      },
      backbone: {
        deps: ['underscore', 'jquery'],
        exports: 'Backbone'
      },
      handlebars: {
        exports: 'Handlebars'
      }
    }
  });

  requirejs(['app'], function(app) {
    return app();
  });

}).call(this);
