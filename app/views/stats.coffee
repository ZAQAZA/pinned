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
      isShowingAll = active is displaying and active > 0
      isNormal = displaying > 0 and displaying < active
      isNothing = active is 0
      isOutOfRange = !isNormal and !isNothing and !isShowingAll
      {active, displaying, isNormal, isNothing, isOutOfRange, isShowingAll}
