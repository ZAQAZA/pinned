(function() {
  define(['utils', 'backbone', 'handlebars', 'models/model', 'views/notification'], function(Utils, Backbone, Handlebars, Model, NotificationView) {
    return Backbone.View.extend({
      initialize: function() {
        this.listenTo(Model.notifs, 'add', this.addOne);
        this.listenTo(Model.notifs, 'reset', this.addAll);
        this.listenTo(Model.notifs, 'all', this.updateStat);
        return this.render();
      },
      template: Handlebars.getTemplate('notifications'),
      render: function() {
        this.$el.html(this.template());
        return this;
      },
      addAll: function() {
        return alert('addAll');
      },
      addOne: function(notification) {
        var v;
        v = new NotificationView({
          model: notification
        });
        return this.$('#notifications-list').append(v.render().el);
      },
      updateStat: function() {}
    });
  });

}).call(this);
