define ['utils', 'backbone', 'handlebars', 'models/model', 'views/map', 'views/notifications', 'views/stats'], (Utils, Backbone, Handlebars, Model, MapView, NotificationsView, StatsView) ->

  Backbone.View.extend
    initialize: ->
      @firstFetch()

      @listenToOnce Model.inRangeNotifications, "reset", =>
        @render()
        @live()

    firstFetch: ->
      Utils.persistent {reset: true}, (opt) ->
        Model.notifs.fetch(opt)

    template: Handlebars.getTemplate 'layout'

    render: ->
      @$el.html @template()
      new MapView { el: @$('#map') }
      new NotificationsView { el: @$('#notifications') }
      new StatsView { el: @$('#stats') }

    live: ->
      delayed = (task) ->
        setTimeout task, 3000

      task = =>
        since = Model.notifs.youngest()
        Model.updates.fetch
          data: {since}
          success: ->
            Model.notifs.add Model.updates.models, {remove: false, merge: true}
            delayed task
          error: ->
            delayed task

      delayed task

