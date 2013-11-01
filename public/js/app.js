(function() {
  define(['jquery', 'views/app', 'utils'], function($, AppView) {
    return function() {
      return new AppView({
        el: $("body")
      });
    };
  });

}).call(this);
