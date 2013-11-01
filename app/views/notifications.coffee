define ['utils', 'backbone', 'handlebars', 'models/model', 'views/notification'], (Utils, Backbone, Handlebars, Model, NotificationView) ->

  Backbone.View.extend
    initialize: ->
      @model = Model.notifs.active

      @listenTo(@model, 'add', @addOne)
      @listenTo(@model, 'reset', @addAll)
      @listenTo(@model, 'all', @updateStat)

      @render()

    template: Handlebars.getTemplate('notifications')

    render: ->
      @$el.html @template()

    addAll: ->
      @render()
      @model.each @addOne, @

    addOne: (notification) ->
      v = new NotificationView {model: notification}
      @$('#notifications-list').append v.render().el

    updateStat: ->

