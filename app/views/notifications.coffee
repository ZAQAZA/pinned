define ['utils', 'backbone', 'handlebars', 'models/model', 'views/notification'], (Utils, Backbone, Handlebars, Model, NotificationView) ->

  Backbone.View.extend
    initialize: ->
      @listenTo(Model.notifs, 'add', @addOne)
      @listenTo(Model.notifs, 'reset', @addAll)
      @listenTo(Model.notifs, 'all', @updateStat)

      @render()

    template: Handlebars.getTemplate('notifications')

    render: ->
      @$el.html @template()
      @

    addAll: ->
      alert 'addAll'

    addOne: (notification) ->
      v = new NotificationView {model: notification}
      @$('#notifications-list').append v.render().el

    updateStat: ->

