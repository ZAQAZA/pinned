(function() {
  define(['backbone', 'bars'], function(Backbone, Handlebars) {
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
