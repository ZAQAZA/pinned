(function() {
  define(['backbone', 'bars', 'models/notification'], function(Backbone, Handlebars, Notification) {
    return Backbone.View.extend({
      tagName: 'li',
      events: {
        "click .title": "toggle"
      },
      initialize: function() {
        return this.render();
      },
      template: Handlebars.getTemplate('notification'),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      },
      toggle: function(event) {
        this.$('form').toggle();
        return event.preventDefault();
      }
    });
  });

}).call(this);
