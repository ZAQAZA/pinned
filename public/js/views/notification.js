(function() {
  define(['utils', 'backbone', 'handlebars', 'models/notification'], function(Utils, Backbone, Handlebars, Notification) {
    return Backbone.View.extend({
      tagName: 'li',
      events: {
        "click .title": "toggle",
        "click :submit": "submit"
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
      },
      submit: function(event) {
        var attr,
          _this = this;
        attr = this.$('form').serializeObject();
        Utils.persistent(function(opt) {
          return _this.model.save(attr, opt);
        });
        return event.preventDefault();
      }
    });
  });

}).call(this);
