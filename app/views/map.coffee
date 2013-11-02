define ['backbone', 'leaflet', 'models/model', 'views/pin', 'models/notification'], (Backbone, L, Model, PinView, Notification) ->

  Backbone.View.extend
    initialize: ->
      @model = Model.notifs.active
      @render()

      @listenTo(@model, 'add', @addOne)
      @listenTo(@model, 'reset', @addAll)
      @map.on('click', @newPin)

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

    addOne: (notification) ->
      c = @map.getCenter()
      z = @map.getZoom()
      new PinView
        model: notification
        map: @map
      .render()
      @map.setView(c,z)

    newPin: (event) =>
      @newPin.destroyIfNew() if @newPin?
      model = new Notification
        lon: event.latlng.lng
        lat: event.latlng.lat
        new: true
      @newPin = new PinView
        model: model
        map: event.target
      .render()
