(function() {
  define(['backbone'], function(Backbone) {
    return Backbone.Model.extend({
      urlRoot: '/notifications',
      initialize: function() {}
    });
  });

}).call(this);
