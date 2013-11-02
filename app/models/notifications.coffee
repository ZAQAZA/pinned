define ['underscore', 'backbone', 'models/notification'], (_, Backbone, Notification) ->

  Notifications = Backbone.Collection.extend
    model: Notification
    url: '/notifications'

    initialize: (models) ->
      @subsets = []
      @on "remove", @removing
      @on "add", @adding
      @on "change", @changing
      @on "reset", @resetting

    youngest: ->
      young = @max (model) ->
        new Date(model.get("current_server_timestamp"))
      young.get("current_server_timestamp")

    createLiveSubSet: (filter) ->
      collection = new Notifications()
      subset =
        filter: filter
        collection: collection
      @subsets.push subset
      collection

    updateAllSubsets: (modifier, model, context) ->
      _.each @subsets, (subset) -> modifier.call(context, subset, model)

    resettingSubset: (subset) ->
      subset.collection.set (@filter subset.filter)

    removingSubset: (subset, model) ->
      subset.collection.remove model

    addingSubset: (subset, model) ->
      subset.collection.add model if subset.filter(model)

    changingSubset: (subset, model) ->
      subset.collection.remove model unless subset.filter(model)

    removing: (model) ->
      @updateAllSubsets @removingSubset, model, @

    adding: (model) ->
      @updateAllSubsets @addingSubset, model, @

    changing: (model) ->
      @updateAllSubsets @changingSubset, model, @

    resetting: (model) ->
      @updateAllSubsets @resettingSubset, model, @

