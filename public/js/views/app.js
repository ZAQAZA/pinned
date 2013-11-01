(function() {
  define(['utils', 'underscore', 'backbone', 'handlebars', 'models/model', 'views/notifications'], function(Utils, _, Backbone, Handlebars, Model, NotificationsView) {
    return Backbone.View.extend({
      initialize: function() {
        this.render();
        return this.live();
      },
      update: function(cb) {
        return Utils.persistent({
          success: cb,
          reset: true
        }, function(opt) {
          return Model.notifs.fetch(opt);
        });
      },
      template: Handlebars.getTemplate('layout'),
      render: function() {
        this.$el.html(this.template());
        return new NotificationsView({
          el: this.$('#notifications')
        });
      },
      live: function() {
        var delayed, task,
          _this = this;
        delayed = function(task) {
          return setTimeout(task, 1000);
        };
        task = function() {
          var since;
          if (!Model.notifs.length) {
            return _this.update(function() {
              return delayed(task);
            });
          }
          since = Model.notifs.youngest();
          return Model.updates.fetch({
            data: {
              since: since
            },
            success: function() {
              Model.notifs.set(Model.updates.models, {
                remove: false,
                merge: true
              });
              return delayed(task);
            },
            error: function() {
              return delayed(task);
            }
          });
        };
        return delayed(task);
      }
    });
  });

}).call(this);
