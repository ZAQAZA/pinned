# Holds the models used by the views in this app
define ['models/notifications'], (Notifications) ->

    activeFilter = (notification) ->
      notification.isActive()

    inRangeFilter = (notification) ->
      notification.inRange()

    # A collection of all notifications
    notifs = new Notifications()

    # A sub-collection of just the active ones
    activeNotifications = notifs.createLiveSubSet activeFilter

    # A sub collection of just the active ones that are visible in the current vireport of the map
    inRangeNotifications = activeNotifications.createLiveSubSet inRangeFilter

    # A collection for fetching new updates from the server
    updates = new Notifications()
    updates.url = '/notifications/updates'

    {notifs, activeNotifications, inRangeNotifications, updates}

