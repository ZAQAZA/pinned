define ['backbone', 'handlebars', 'models/model', 'views/notification'], (Backbone, Handlebars, Model, NotificationView) ->

  Backbone.View.extend
    initialize: ->
      @model = Model.inRangeNotifications

      # We need to rerender everything only because of the sorting
      @listenTo(@model, 'change:from_center add remove reset', @addAll)

      @render()

    template: Handlebars.getTemplate('notifications')

    render: ->
      @$el.html @template()

    addAll: ->
      @render()
      @model.sort()
      @model.each @addOne, @

    addOne: (notification) ->
      v = new NotificationView {model: notification}
      @$('#notifications-list').append v.render().el
