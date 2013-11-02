define ['handlebars'], (Handlebars) ->

  Handlebars.registerHelper 'niceLonLat', (lon, lat) ->
    format = (n) -> Math.round(n*100)/100
    "(#{format lon}, #{format lat})"

  Handlebars.registerHelper 'isNormal', (state) -> state is "normal"
  Handlebars.registerHelper 'isOutOfRange', (state) -> state is "out-of-range"
  Handlebars.registerHelper 'isNothing', (state) -> state is "nothing"
