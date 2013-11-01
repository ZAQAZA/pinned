(function() {
  define(['utils', 'backbone', 'handlebars', 'models/model', 'views/notifications'], function(Utils, Backbone, Handlebars, Model, NotificationsView) {
    return Backbone.View.extend({
      initialize: function() {
        this.update();
        return this.render();
      },
      update: function() {
        return Utils.persistent(function(opt) {
          return Model.notifs.fetch(opt);
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
