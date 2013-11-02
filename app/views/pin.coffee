define ['utils', 'underscore', 'backbone', 'handlebars', 'leaflet', 'models/model'], (Utils, _, Backbone, Handlebars, L, Model) ->

  Backbone.View.extend
    className: 'pin'

    events:
      "click input[name='commit']": "submit"

    initialize: (options) ->
      @map = options.map
      @pin()
      @listenTo @model, 'change', @render
      @listenTo @model, 'remove', @unpin

    template: ->
      if @model.get('new') then Handlebars.getTemplate('pin_new') else Handlebars.getTemplate('pin')

    render: ->
      @$el.html @template()(@model.toJSON())
      @popup.setContent(@el)
      @

    pin: ->
      @popup = L.popup()
      @marker = L.marker(@model.latlon()).addTo(@map)
      @marker.bindPopup(@popup).openPopup()

    persistSave: (attr, options) ->
      Utils.persistent options || {}, (opt) =>
        @model.save(attr, opt)

    submit: (event) ->
      @persistSave _.extend(@$('form').serializeObject(), {new: false}),
        success: => Model.notifs.add @model
      event.preventDefault()

    destroyIfNew: ->
      return unless @model.get('new')
      @unpin()

    unpin: ->
      @map.removeLayer @marker
      @remove()

