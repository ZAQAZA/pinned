(function() {
  define(['models/notifications'], function(Notifications) {
    var notifs, updates;
    notifs = new Notifications();
    updates = new Notifications();
    updates.url = '/notifications/updates';
    return {
      notifs: notifs,
      updates: updates
    };
  });

}).call(this);
