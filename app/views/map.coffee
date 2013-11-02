define ['backbone', 'leaflet', 'models/model', 'views/pin'], (Backbone, L, Model, PinView) ->

  Backbone.View.extend
    initialize: ->
      @model = Model.notifs.active

      @listenTo(@model, 'add', @addOne)
      @listenTo(@model, 'reset', @addAll)
      @listenTo(@model, 'all', @updateStat)

      @render()

    render: ->
      @map = L.map('map').setView([11, 22], 4);
      mapquestUrl = 'http://{s}.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png'
      subDomains = ['otile1','otile2','otile3','otile4']
      L.tileLayer mapquestUrl,
        maxZoom: 18
        subdomains: subDomains
      .addTo(@map)

    addAll: ->
      alert 'all'
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
