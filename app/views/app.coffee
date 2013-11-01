define ['backbone', 'bars', 'models/model', 'views/notifications'], (Backbone, Handlebars, Model, NotificationsView) ->

  Backbone.View.extend
    initialize: ->
      @update()
      @render()

    update: ->
      Model.notifs.fetch
        error: => setTimeout @update, 1000

    template: Handlebars.getTemplate 'layout'

    render: ->
      @$el.html @template()
      new NotificationsView { el: @$('#notifications') }

