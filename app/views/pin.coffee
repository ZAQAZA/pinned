define ['utils', 'backbone', 'handlebars', 'leaflet'], (Utils, Backbone, Handlebars, L) ->

  Backbone.View.extend
    className: 'pin'

    events:
      "click input[name='commit']": "submit"

    initialize: (options) ->
      @map = options.map
      @listenTo(@model, 'change', @render)

    template: Handlebars.getTemplate('pin')

    render: ->
      @$el.html @template(@model.toJSON())
      marker = L.marker(@model.latlon()).addTo(@map)
      marker.bindPopup(@el).openPopup();

    persistSave: (attr, options) ->
      Utils.persistent options || {}, (opt) =>
        @model.save(attr, opt)

    submit: (event) ->
      @persistSave @$('form').serializeObject()
      event.preventDefault()
