(function() {
  define(['utils', 'backbone', 'handlebars', 'models/model', 'views/notification'], function(Utils, Backbone, Handlebars, Model, NotificationView) {
    return Backbone.View.extend({
      initialize: function() {
        this.model = Model.notifs.active;
        this.listenTo(this.model, 'add', this.addOne);
        this.listenTo(this.model, 'reset', this.addAll);
        this.listenTo(this.model, 'all', this.updateStat);
        return this.render();
      },
      template: Handlebars.getTemplate('notifications'),
      render: function() {
        return this.$el.html(this.template());
      },
      addAll: function() {
        this.render();
        return this.model.each(this.addOne, this);
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
