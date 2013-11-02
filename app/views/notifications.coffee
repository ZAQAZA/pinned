define ['backbone', 'handlebars', 'models/model', 'views/notification'], (Backbone, Handlebars, Model, NotificationView) ->

  Backbone.View.extend
    initialize: ->
      @model = Model.inRangeNotifications

      @listenTo(@model, 'add', @addOne)
      @listenTo(@model, 'remove', @addAll)
      @listenTo(@model, 'reset', @addAll)

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
