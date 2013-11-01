(function() {
  define(['backbone', 'models/notification'], function(Backbone, Notification) {
    return Backbone.Collection.extend({
      model: Notification,
      url: '/notifications',
      parse: function(response) {
        return response;
      }
    });
  });

}).call(this);
