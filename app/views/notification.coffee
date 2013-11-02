define ['utils', 'underscore', 'backbone', 'handlebars', 'models/model', 'models/notification'], (Utils, _, Backbone, Handlebars, Model, Notification) ->

  Backbone.View.extend
    tagName: 'li'

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

    persistSave: (attr, options) ->
      Utils.persistent options || {}, (opt) =>
        @model.save(attr, opt)

    toggle: (event) ->
      @model.set('visible', !@model.get('visible'))
      event.preventDefault()

    submit: (event) ->
      @persistSave @$('form').serializeObject()
      event.preventDefault()

    upvote: (event) ->
      @persistSave {}, {upvote: true}
      event.preventDefault()

    clear: (event) ->
      Utils.persistent {}, (opt) =>
        @model.destroy(opt)
      event.preventDefault()
