define ['backbone', 'leaflet'], (Backbone, L) ->

  Backbone.View.extend
    initialize: ->
      @render()

    render: ->
      @map = L.map('map').setView([51.505, -0.09], 13);
      mapquestUrl = 'http://{s}.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png'
      subDomains = ['otile1','otile2','otile3','otile4']
      L.tileLayer mapquestUrl,
        maxZoom: 18
        subdomains: subDomains
      .addTo(@map)
