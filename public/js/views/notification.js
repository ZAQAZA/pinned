(function() {
  define(['utils', 'backbone', 'handlebars', 'models/notification'], function(Utils, Backbone, Handlebars, Notification) {
    return Backbone.View.extend({
      tagName: 'li',
      defaults: {
        'visible': false
      },
      events: {
        "click .title": "toggle",
        "click input[name='commit']": "submit",
        "click input[name='upvote']": "upvote",
        "click input[name='delete']": "clear"
      },
      initialize: function() {
        this.listenTo(this.model, 'change', this.render);
        return this.listenTo(this.model, 'destroy', this.remove);
      },
      template: Handlebars.getTemplate('notification'),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      },
      persistSave: function(attr) {
        var _this = this;
        return Utils.persistent(function(opt) {
          return _this.model.save(attr, opt);
        });
      },
      toggle: function(event) {
        this.model.set('visible', !this.model.get('visible'));
        return event.preventDefault();
      },
      submit: function(event) {
        this.persistSave(this.$('form').serializeObject());
        return event.preventDefault();
      },
      upvote: function(event) {
        this.model.set('votes_up', this.model.get('votes_up') + 1);
        return event.preventDefault();
      },
      clear: function(event) {
        var _this = this;
        Utils.persistent(function(opt) {
          return _this.model.destroy(opt);
        });
        return event.preventDefault();
      }
    });
  });

}).call(this);