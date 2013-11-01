define ['backbone', 'bars', 'models/notification'], (Backbone, Handlebars, Notification) ->

  Backbone.View.extend
    tagName: 'li'

    events:
      "click .title": "toggle"

    initialize: ->
      @render()

    template: Handlebars.getTemplate('notification')

    render: ->
      @$el.html @template(@model.toJSON())
      @

    toggle: (event) ->
      @$('form').toggle()
      event.preventDefault()
