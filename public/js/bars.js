(function() {
  define(['jquery', 'handlebars'], function($, Handlebars) {
    Handlebars.getTemplate = function(name) {
      if ((Handlebars.templates == null) || (Handlebars.templates[name] == null)) {
        $.ajax({
          url: 'templates/' + name + '.handlebars',
          success: function(data) {
            Handlebars.templates = Handlebars.templates || {};
            return Handlebars.templates[name] = Handlebars.compile(data);
          },
          async: false
        });
      }
      return Handlebars.templates[name];
    };
    return Handlebars;
  });

}).call(this);
