(function() {
  define(['models/notifications'], function(Notifications) {
    var notifs;
    notifs = new Notifications();
    return {
      notifs: notifs
    };
  });

}).call(this);
