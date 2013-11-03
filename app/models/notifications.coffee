define ['underscore', 'backbone', 'models/notification', 'models/model'], (_, Backbone, Notification, Model) ->

  Notifications = Backbone.Collection.extend
    model: Notification
    url: '/notifications'

    initialize: (myFilter) ->
      @subsets = []
      @myFilter = myFilter || (-> true)
      @on "remove", @removing
      @on "add", @adding
      @on "change", @changing
      @on "reset", @resetting

    youngest: ->
      young = @max (model) ->
        new Date(model.get("current_server_timestamp"))
      young.get("current_server_timestamp")

    createLiveSubSet: (filter) ->
      collection = new Notifications(filter)
      subset =
        filter: filter
        collection: collection
      @subsets.push subset
      collection

    updateAllSubsets: (modifier, model, context) ->
      _.each @subsets, (subset) -> modifier.call(context, subset, model)

    resettingSubset: (subset) ->
      subset.collection.reset (@filter subset.filter)

    removingSubset: (subset, model) ->
      subset.collection.remove model

    addingSubset: (subset, model) ->
      subset.collection.add model if subset.filter(model)

    changingSubset: (subset, model) ->
      subset.collection.add model if subset.filter(model)

    removing: (model) ->
      @updateAllSubsets @removingSubset, model, @

    adding: (model) ->
      @updateAllSubsets @addingSubset, model, @

    resetting: (model) ->
      @updateAllSubsets @resettingSubset, model, @

    changing: (model) ->
      return @remove model unless (@myFilter model)
      @updateAllSubsets @changingSubset, model, @

    comparator: (notification) ->
      notification.get('from_center')
