(function() {
  define(['backbone', 'bars', 'models/model', 'views/notifications'], function(Backbone, Handlebars, Model, NotificationsView) {
    return Backbone.View.extend({
      initialize: function() {
        this.update();
        return this.render();
      },
      update: function() {
        var _this = this;
        return Model.notifs.fetch({
          error: function() {
            return setTimeout(_this.update, 1000);
          }
        });
      },
      template: Handlebars.getTemplate('layout'),
      render: function() {
        this.$el.html(this.template());
        return new NotificationsView({
          el: this.$('#notifications')
        });
      }
    });
  });

}).call(this);
