(function() {
  define(['backbone', 'bars'], function(Backbone, Handlebars) {
    return Backbone.View.extend({
      initialize: function() {
        return this.render();
      },
      template: Handlebars.getTemplate('layout'),
      render: function() {
        return this.$el.html(this.template());
      }
    });
  });

}).call(this);
