(function() {
  define(['backbone', 'handlebars', 'models/model', 'views/notification'], function(Backbone, Handlebars, Model, NotificationView) {
    return Backbone.View.extend({
      initialize: function() {
        this.listenTo(Model.notifs, 'all', this.render);
        return this.render();
      },
      template: Handlebars.getTemplate('notifications'),
      render: function() {
        this.$el.html(this.template());
        Model.notifs.each(function(n) {
          var v;
          v = new NotificationView({
            model: n
          });
          return this.$('#notifications-list').append(v.render().el);
        });
        return this;
      }
    });
  });

}).call(this);
