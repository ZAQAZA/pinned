# Main app controller
# Bootstraps the app by fetching all notifications from the server,
# creating all 3 main views of the app and starts a periodic pull of new updates from the server.
define ['utils', 'backbone', 'handlebars', 'models/model', 'views/map', 'views/notifications', 'views/stats'], (Utils, Backbone, Handlebars, Model, MapView, NotificationsView, StatsView) ->

  Backbone.View.extend
    initialize: ->
      @firstFetch()

      # After the first fetch, we wait untill changes have reach the last sub-collection,
      # then we can continue drawing the app.
      @listenToOnce Model.inRangeNotifications, "reset", =>
        @render()
        @live()

    firstFetch: ->
      Utils.persistent {reset: true}, (opt) ->
        Model.notifs.fetch(opt)

    # Main layout template
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

