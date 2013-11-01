define ['underscore', 'backbone', 'models/notification'], (_, Backbone, Notification) ->

  Notifications = Backbone.Collection.extend
    model: Notification
    url: '/notifications'

    initialize: (models) ->
      @active = new Backbone.Collection(models)
      @on "reset add", @reFilter

    reFilter: ->
      @active.set(@where({is_active: true}), {merge: true})

    youngest: ->
      young = @max (model) ->
        new Date(model.get("current_server_timestamp"))
      young.get("current_server_timestamp")


