define ['backbone', 'handlebars', 'models/model'], (Backbone, Handlebars, Model) ->

  Backbone.View.extend
    initialize: ->
      @active = Model.activeNotifications
      @inRange = Model.inRangeNotifications

      @listenTo @active, 'all', @render
      @listenTo @inRange, 'all', @render

      @render()

    template: Handlebars.getTemplate('stats')

    render: ->
      @$el.html @template(@stats())


    stats: ->
      {active, displaying} =
        active: @active.length
        displaying: @inRange.length
      isNormal = displaying > 0
      isNothing = active is 0
      isOutOfRange = !isNormal and !isNothing
      {active, displaying, isNormal, isNothing, isOutOfRange}
