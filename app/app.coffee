define ['jquery', 'underscore', 'handlebars'], ->
  Handlebars.getTemplate = (name) ->
    if (!Handlebars.templates? || !Handlebars.templates[name]?)
      $.ajax
        url: 'templates/' + name + '.handlebars'
        success: (data) ->
          Handlebars.templates = Handlebars.templates || {}
          Handlebars.templates[name] = Handlebars.compile(data)
        async : false
    Handlebars.templates[name]

  ->
    $ ->
      $('h1').html 'I am jquery!'
      $('#container').html Handlebars.getTemplate('notification')({name: 'Ofri Dagan'})
