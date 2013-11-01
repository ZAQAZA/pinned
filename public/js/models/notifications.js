(function() {
  define(['underscore', 'backbone', 'models/notification'], function(_, Backbone, Notification) {
    var Notifications;
    return Notifications = Backbone.Collection.extend({
      model: Notification,
      url: '/notifications',
      initialize: function(models) {
        this.active = new Backbone.Collection(models);
        return this.on("reset add", this.reFilter);
      },
      reFilter: function() {
        return this.active.set(this.where({
          is_active: true
        }), {
          merge: true
        });
      },
      youngest: function() {
        var young;
        young = this.max(function(model) {
          return new Date(model.get("current_server_timestamp"));
        });
        return young.get("current_server_timestamp");
      }
    });
  });

}).call(this);
