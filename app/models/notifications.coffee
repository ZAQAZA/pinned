define ['backbone', 'models/notification'], (Backbone, Notification) ->

  Notifications = Backbone.Collection.extend
    model: Notification
    url: '/notifications'

    initialize: (models) ->
      @active = new Backbone.Collection(models)
      @on "reset", @reFilter

    reFilter: ->
      @active.reset(@where {is_active: true})

