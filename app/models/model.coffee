define ['models/notifications'], (Notifications) ->

    notifs = new Notifications()
    updates = new Notifications()
    updates.url = '/notifications/updates'

    {notifs, updates}

