# Represent a notification
define ['backbone'], (Backbone) ->

  Backbone.Model.extend
    initialize: ->

    urlRoot: '/notifications'

    upvoteUrl: ->
      @url() + '/upvote'

    latlon: -> [@get('lat'), @get('lon')]

    # Overriding Backbone.sync to use the right url in case we just want to
    # up-vote
    sync: (method, model, options) ->
      options.url = @upvoteUrl() if options['upvote']
      Backbone.sync.call(model, method, model, options)

    isActive: ->
      @get('is_active')

    inRange: ->
      @get('in_range')

    fromCenter: ->
      @get('from_center')

    # Updates this model with info about the current viewport of the map.
    # Called by the Map view when the view port changes.
    updateRange: (viewPort) ->
      @set
        'from_center': @distanceFromCenter(viewPort.center)
        'in_range': @isInRange(viewPort.bounds)

    asPoint: ->
      new L.LatLng @get('lat'), @get('lon')

    distanceFromCenter: (center) ->
      center.distanceTo @asPoint()

    isInRange: (bounds) ->
      bounds.contains @asPoint()


