define ['utils', 'backbone', 'handlebars', 'leaflet'], (Utils, Backbone, Handlebars, L) ->

  Backbone.View.extend
    className: 'pin'

    events:
      "click input[name='commit']": "submit"

    initialize: (options) ->
      @map = options.map
      @pin()
      @listenTo(@model, 'change', @refresh)

    template: ->
      if @model.get('new') then Handlebars.getTemplate('pin_new') else Handlebars.getTemplate('pin')

    render: ->
      @$el.html @template()(@model.toJSON())
      @refresh()

    pin: ->
      @popup = L.popup()
      @marker = L.marker(@model.latlon()).addTo(@map)
      @marker.bindPopup(@popup)

    refresh: ->
      @popup.setContent(@el)

    persistSave: (attr, options) ->
      Utils.persistent options || {}, (opt) =>
        @model.save(attr, opt)

    submit: (event) ->
      @persistSave @$('form').serializeObject()
      event.preventDefault()
