define ['handlebars'], (Handlebars) ->

  Handlebars.registerHelper 'niceLonLat', (lon, lat) ->
    format = (n) -> Math.round(n*100)/100
    "(#{format lon}, #{format lat})"

