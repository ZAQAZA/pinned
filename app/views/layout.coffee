define ['backbone', 'bars', 'models/notification'], (Backbone, Handlebars, Noti) ->

  new Noti()

  Backbone.View.extend
    initialize: ->
      @render()

    render: ->
      @$el.html Handlebars.getTemplate('layout')()
