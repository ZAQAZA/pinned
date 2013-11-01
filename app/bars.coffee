define ['jquery', 'handlebars'], ($, Handlebars) ->

  Handlebars.getTemplate = (name) ->
    if (!Handlebars.templates? || !Handlebars.templates[name]?)
      $.ajax
        url: 'templates/' + name + '.handlebars'
        success: (data) ->
          Handlebars.templates = Handlebars.templates || {}
          Handlebars.templates[name] = Handlebars.compile(data)
        async : false
    Handlebars.templates[name]

  Handlebars