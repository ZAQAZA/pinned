(function() {
  define(['backbone', 'bars', 'models/notification'], function(Backbone, Handlebars, Noti) {
    new Noti();
    return Backbone.View.extend({
      initialize: function() {
        return this.render();
      },
      render: function() {
        return this.$el.html(Handlebars.getTemplate('layout')());
      }
    });
  });

}).call(this);
