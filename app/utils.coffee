define ['jquery', 'underscore', 'handlebars'], ($, _, Handlebars) ->

  Handlebars.getTemplate = (name) ->
    if (!Handlebars.templates? || !Handlebars.templates[name]?)
      $.ajax
        url: 'templates/' + name + '.handlebars'
        success: (data) ->
          Handlebars.templates = Handlebars.templates || {}
          Handlebars.templates[name] = Handlebars.compile(data)
        async : false
    Handlebars.templates[name]

  $.fn.serializeObject = ->
    o = {}
    a = @serializeArray()
    $.each a, ->
      if o[@name]?
        o[@name] = [o[@name]] unless o[@name].push
        o[@name].push(@value || '')
      else
        o[@name] = @value || ''
    o

  persistent = (options, f) ->
    retry = setInterval ->
      suc = options.success
      _.extend options,
        success: ->
          suc() if suc?
          clearInterval(retry)
        error: -> console.log arguments
      f options
    , 400

  {persistent}