define ['utils', 'backbone', 'handlebars', 'models/model', 'views/map', 'views/notifications'], (Utils, Backbone, Handlebars, Model, MapView, NotificationsView) ->

  Backbone.View.extend
    initialize: ->
      @render()
      @live()

    firstFatch: (cb) ->
      Utils.persistent {success: cb, reset: true}, (opt) ->
        Model.notifs.fetch(opt)

    template: Handlebars.getTemplate 'layout'

    render: ->
      @$el.html @template()
      new NotificationsView { el: @$('#notifications') }
      new MapView { el: @$('#map') }

    live: ->
      delayed = (task) ->
        setTimeout task, 3000

      task = =>
        return @firstFatch(-> delayed task) unless Model.notifs.length
        since = Model.notifs.youngest()
        Model.updates.fetch
          data: {since}
          success: ->
            Model.notifs.add Model.updates.models, {remove: false, merge: true}
            delayed task
          error: ->
            delayed task

      task()

