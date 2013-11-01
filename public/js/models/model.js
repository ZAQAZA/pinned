(function() {
  define(['models/notifications'], function(Notifications) {
    var notifs;
    notifs = new Notifications();
    notifs.url = '/notifications';
    return {
      notifs: notifs
    };
  });

}).call(this);
