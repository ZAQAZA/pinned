define ['underscore', 'backbone', 'models/notification'], (_, Backbone, Notification) ->

  Backbone.Collection.extend
    model: Notification
    url: '/notifications'

    initialize: (models) ->
      @active = new Backbone.Collection(models)
      @on "remove", @removing
      @on "add change reset", @reFilter

    reFilter: ->
      @active.set(@where({is_active: true}), {merge: true})

    removing: (model) ->
      @active.remove model

    youngest: ->
      young = @max (model) ->
        new Date(model.get("current_server_timestamp"))
      young.get("current_server_timestamp")


