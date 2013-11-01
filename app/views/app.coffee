define ['utils', 'backbone', 'handlebars', 'models/model', 'views/notifications'], (Utils, Backbone, Handlebars, Model, NotificationsView) ->

  Backbone.View.extend
    initialize: ->
      @update()
      @render()

    update: ->
      Utils.persistent (opt) ->
        Model.notifs.fetch(opt)

    template: Handlebars.getTemplate 'layout'

    render: ->
      @$el.html @template()
      new NotificationsView { el: @$('#notifications') }

