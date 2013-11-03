# A collection of notifications
# It supports the creation of live-updating sub-collections which are created using a filter
# and are maintained and updated as the parent collection updates.
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

    # Returns the latest update time we have from the server.
    youngest: ->
      young = @max (model) ->
        new Date(model.get("current_server_timestamp"))
      young.get("current_server_timestamp")

    # Used to sort this collection - by the distance from center of map.
    comparator: (notification) ->
      notification.get('from_center')

    # Created a new sub-collection of this collection containing only the models which
    # returns true when applied the filter function provided.
    # If you don't need live updating collection - just use @filter().
    createLiveSubSet: (filter) ->
      collection = new Notifications(filter)
      subset =
        filter: filter
        collection: collection
      @subsets.push subset
      collection

    # The rest of the methods here are for keeping the subsets of this collection up-to-date.
    # The changes should recursively find their way to the most specific subset.

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

