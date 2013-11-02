define ['backbone'], (Backbone) ->

  Backbone.Model.extend
    initialize: ->

    urlRoot: '/notifications'

    upvoteUrl: ->
      @url() + '/upvote'

    latlon: -> [@get('lat'), @get('lon')]

    sync: (method, model, options) ->
      options.url = @upvoteUrl() if options['upvote']
      Backbone.sync.call(model, method, model, options) 

    isActive: ->
      @get('is_active')

    inRange: ->
      @get('in_range')

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


