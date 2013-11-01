(function() {
  define(['jquery', 'underscore', 'bars', 'views/app', 'models/notifications'], function($, _, Handlebars, AppView, Notifs) {
    return function() {
      return new AppView({
        el: $("body")
      });
    };
  });

}).call(this);
