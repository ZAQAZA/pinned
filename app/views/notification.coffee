define ['utils', 'backbone', 'handlebars', 'models/notification'], (Utils, Backbone, Handlebars, Notification) ->

  Backbone.View.extend
    tagName: 'li'

    events:
      "click .title": "toggle"
      "click :submit": "submit"

    initialize: ->
      @render()

    template: Handlebars.getTemplate('notification')

    render: ->
      @$el.html @template(@model.toJSON())
      @

    toggle: (event) ->
      @$('form').toggle()
      event.preventDefault()

    submit: (event) ->
      attr = @$('form').serializeObject()
      Utils.persistent (opt) =>
        @model.save(attr, opt)
      event.preventDefault()
