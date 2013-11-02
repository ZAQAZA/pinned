define ['models/notifications'], (Notifications) ->

    activeFilter = (notification) ->
      notification.isActive()

    inRangeFilter = (notification) ->
      notification.inRange()

    notifs = new Notifications()
    activeNotifications = notifs.createLiveSubSet activeFilter
    inRangeNotifications = activeNotifications.createLiveSubSet inRangeFilter

    updates = new Notifications()
    updates.url = '/notifications/updates'

    {notifs, activeNotifications, inRangeNotifications, updates}

