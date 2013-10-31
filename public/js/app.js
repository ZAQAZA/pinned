(function() {
  define(['jquery', 'underscore', 'handlebars'], function() {
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
    return function() {
      return $(function() {
        $('h1').html('I am jquery!');
        return $('#container').html(Handlebars.getTemplate('notification')({
          name: 'Ofri Dagan'
        }));
      });
    };
  });

}).call(this);
