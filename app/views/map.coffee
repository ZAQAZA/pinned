define ['backbone', 'leaflet', 'models/model', 'views/pin', 'models/notification'], (Backbone, L, Model, PinView, Notification) ->

  Backbone.View.extend
    initialize: ->
      @model = Model.activeNotifications
      @render()

      @listenTo @model, 'add', @addOne
      @listenTo @model, 'reset', @addAll
      @map.on 'click', @newPin, @
      @map.on 'dragend', @updateRangeAll, @
      @map.on 'zoomend', @updateRangeAll, @

    render: ->
      @map = L.map('map').setView([11, 22], 4)
      mapquestUrl = 'http://{s}.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png'
      subDomains = ['otile1','otile2','otile3','otile4']
      L.tileLayer mapquestUrl,
        maxZoom: 18
        subdomains: subDomains
      .addTo(@map)

    addAll: ->
      @render()
      @model.each @addOne, @

    createPinView: (options) ->
      closeNew = =>
        @newPinView.destroyIfNew() if @newPinView?
      pin = new PinView(options)
      pin.marker.on 'click', closeNew, @
      pin

    addOne: (notification) ->
      c = @map.getCenter()
      z = @map.getZoom()
      @createPinView
        model: notification
        map: @map
      .render()
      @updateRangeOne notification
      @map.setView(c,z)


    newPin: (event) ->
      @newPinView.destroyIfNew() if @newPinView?
      model = new Notification
        lon: event.latlng.lng
        lat: event.latlng.lat
        new: true
      @updateRangeOne model
      @newPinView = @createPinView
        model: model
        map: event.target
      .render()
      @newPinView.marker.openPopup()

    updateRangeOne: (model) ->
      viewPort =
        center: @map.getCenter()
        bounds: @map.getBounds()
      model.updateRange viewPort

    updateRangeAll: ->
      Model.activeNotifications.each @updateRangeOne, @

