(function() {
  define(['jquery', 'underscore', 'handlebars'], function($, _, Handlebars) {
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
    persistent = function(options, f) {
      var delayed, task;
      delayed = function(task) {
        return setTimeout(task, 400);
      };
      task = function() {
        _.extend(options, {
          error: function() {
            console.log(arguments);
            return delayed(task);
          }
        });
        return f(options);
      };
      return delayed(task);
    };
    return {
      persistent: persistent
    };
  });

}).call(this);
