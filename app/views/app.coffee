define ['utils', 'backbone', 'handlebars', 'models/model', 'views/map', 'views/notifications'], (Utils, Backbone, Handlebars, Model, MapView, NotificationsView) ->

  Backbone.View.extend
    initialize: ->
      @render()
      @live()

    update: (cb) ->
      Utils.persistent {success: cb, reset: true}, (opt) ->
        Model.notifs.fetch(opt)

    template: Handlebars.getTemplate 'layout'

    render: ->
      @$el.html @template()
      new NotificationsView { el: @$('#notifications') }
      new MapView { el: @$('#map') }

    live: ->
      delayed = (task) ->
        setTimeout task, 1000

      task = =>
        return @update(-> delayed task) unless Model.notifs.length
        since = Model.notifs.youngest()
        Model.updates.fetch
          data: {since}
          success: ->
            Model.notifs.set Model.updates.models, {remove: false, merge: true}
            delayed task
          error: ->
            delayed task

      delayed task

