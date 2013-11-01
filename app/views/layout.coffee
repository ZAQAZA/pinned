define ['backbone', 'bars'], (Backbone, Handlebars) ->

  Backbone.View.extend
    initialize: ->
      @render()

    render: ->
      @$el.html Handlebars.getTemplate('layout')()
