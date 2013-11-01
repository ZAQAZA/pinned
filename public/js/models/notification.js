(function() {
  define(['backbone'], function(Backbone) {
    return Backbone.Model.extend({
      initialize: function() {},
      urlRoot: '/notifications',
      upvoteUrl: function() {
        return this.url() + '/upvote';
      },
      sync: function(method, model, options) {
        if (options['upvote']) {
          options.url = this.upvoteUrl();
        }
        return Backbone.sync.call(model, method, model, options);
      }
    });
  });

}).call(this);
