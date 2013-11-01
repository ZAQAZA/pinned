(function() {
  define(['jquery', 'handlebars'], function($, Handlebars) {
    var persistent;
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
    $.fn.serializeObject = function() {
      var a, o;
      o = {};
      a = this.serializeArray();
      $.each(a, function() {
        if (o[this.name] != null) {
          if (!o[this.name].push) {
            o[this.name] = [o[this.name]];
          }
          return o[this.name].push(this.value || '');
        } else {
          return o[this.name] = this.value || '';
        }
      });
      return o;
    };
    persistent = function(f) {
      var retry;
      return retry = setInterval(function() {
        return f({
          success: function() {
            return clearInterval(retry);
          }
        });
      }, 400);
    };
    return {
      persistent: persistent
    };
  });

}).call(this);
