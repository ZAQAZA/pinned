define ['backbone', 'models/notification'], (Backbone, Notification) ->

  Backbone.Collection.extend
    model: Notification
    url: '/notifications'
    parse: (response) -> response
