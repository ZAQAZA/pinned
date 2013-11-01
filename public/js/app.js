(function() {
  define(['jquery', 'underscore', 'bars', 'views/layout'], function($, _, Handlebars, Layout) {
    return function() {
      return new Layout({
        el: $("body")
      });
    };
  });

}).call(this);
