(function() {
  define(['backbone', 'models/notification'], function(Backbone, Notification) {
    var Notifications;
    return Notifications = Backbone.Collection.extend({
      model: Notification,
      url: '/notifications',
      initialize: function(models) {
        this.active = new Backbone.Collection(models);
        return this.on("reset", this.reFilter);
      },
      reFilter: function() {
        return this.active.reset(this.where({
          is_active: true
        }));
      }
    });
  });

}).call(this);
