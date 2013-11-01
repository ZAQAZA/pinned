define ['utils', 'underscore', 'backbone', 'handlebars', 'models/model', 'views/notifications'], (Utils, _, Backbone, Handlebars, Model, NotificationsView) ->

  Backbone.View.extend
    initialize: ->
      @update()
      @render()

    update: ->
      Utils.persistent {}, (opt) ->
        Model.notifs.fetch(_.extend opt, {reset: true})

    template: Handlebars.getTemplate 'layout'

    render: ->
      @$el.html @template()
      new NotificationsView { el: @$('#notifications') }

