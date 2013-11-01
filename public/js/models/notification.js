(function() {
  define(['backbone'], function(Backbone) {
    return Backbone.Model.extend({
      initialize: function() {
        return alert('notification created');
      }
    });
  });

}).call(this);
