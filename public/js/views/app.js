(function() {
  define(['utils', 'underscore', 'backbone', 'handlebars', 'models/model', 'views/notifications'], function(Utils, _, Backbone, Handlebars, Model, NotificationsView) {
    return Backbone.View.extend({
      initialize: function() {
        this.update();
        return this.render();
      },
      update: function() {
        return Utils.persistent({}, function(opt) {
          return Model.notifs.fetch(_.extend(opt, {
            reset: true
          }));
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
