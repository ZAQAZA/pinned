define ['models/notifications'], (Notifications) ->

    activeFilter = (notification) ->
      notification.isActive()

    notifs = new Notifications()
    activeNotifications = notifs.createLiveSubSet activeFilter

    updates = new Notifications()
    updates.url = '/notifications/updates'

    {notifs, activeNotifications, updates}

