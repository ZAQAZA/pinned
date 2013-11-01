(function() {
  define(['utils', 'underscore', 'backbone', 'handlebars', 'models/model', 'views/notifications'], function(Utils, _, Backbone, Handlebars, Model, NotificationsView) {
    return Backbone.View.extend({
      initialize: function() {
        this.update();
        this.render();
        return this.live();
      },
      update: function() {
        return Utils.persistent({}, function(opt) {
          return Model.notifs.fetch(_.extend(opt, {
            reset: true
          }));
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
        return setInterval(function() {
          var since;
          since = Model.notifs.youngest();
          return Model.updates.fetch({
            data: {
              since: since
            },
            success: function() {
              return Model.notifs.set(Model.updates.models, {
                remove: false,
                merge: true
              });
            }
          });
        }, 2000);
      }
    });
  });

}).call(this);
