# Some utils and libraries extensions
define ['jquery', 'underscore', 'handlebars'], ($, _, Handlebars) ->

  # Used for fetching a template from the server, or the precompiled templates.
  # The method caches the templates it fetchs for future use.
  Handlebars.getTemplate = (name) ->
    if (!Handlebars.templates? || !Handlebars.templates[name]?)
      $.ajax
        url: 'templates/' + name + '.handlebars'
        success: (data) ->
          Handlebars.templates = Handlebars.templates || {}
          Handlebars.templates[name] = Handlebars.compile(data)
        async : false
    Handlebars.templates[name]

  # Used to parse form data into JSON - I copied this one from stackoverflow
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

  # Performs a task (fetching/saving from server) periodically untill it succeed.
  persistent = (options, f) ->
    delayed = (task) ->
      setTimeout task, 400

    task = ->
      _.extend options,
        error: ->
          console.log arguments
          delayed task
      f options

    delayed task

  {persistent}