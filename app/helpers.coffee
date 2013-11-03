define ['handlebars'], (Handlebars) ->

  # nicly fotmatting lon-lat inthe form of (X.XX, X.XX)
  Handlebars.registerHelper 'niceLonLat', (lon, lat) ->
    format = (n) -> Math.round(n*100)/100
    "(#{format lon}, #{format lat})"

