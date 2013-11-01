define ['utils', 'backbone', 'handlebars', 'models/notification'], (Utils, Backbone, Handlebars, Notification) ->

  Backbone.View.extend
    tagName: 'li'

    defaults:
      'visible': false

    events:
      "click .title": "toggle"
      "click input[name='commit']": "submit"
      "click input[name='upvote']": "upvote"
      "click input[name='delete']": "clear"

    initialize: ->
      @listenTo(@model, 'change', @render)
      @listenTo(@model, 'destroy', @remove)

    template: Handlebars.getTemplate('notification')

    render: ->
      @$el.html @template(@model.toJSON())
      @

    persistSave: (attr) ->
      Utils.persistent (opt) =>
        @model.save(attr, opt)

    toggle: (event) ->
      @model.set('visible', !@model.get('visible'))
      event.preventDefault()

    submit: (event) ->
      @persistSave @$('form').serializeObject()
      event.preventDefault()

    upvote: (event) ->
      @model.set('votes_up', @model.get('votes_up') + 1)
      #@persistSave { votes_up: @model.get('votes_up') + 1 }
      event.preventDefault()

    clear: (event) ->
      Utils.persistent (opt) =>
        @model.destroy(opt)
      event.preventDefault()
