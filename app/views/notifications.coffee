define ['backbone', 'handlebars', 'models/model', 'views/notification'], (Backbone, Handlebars, Model, NotificationView) ->

  Backbone.View.extend
    initialize: ->
      @model = Model.inRangeNotifications

      # We need to rerender everything only because of the sorting.
      # If the sorting was not an issue we could just append an added model.
      # with the sorting it's more complicated... unless we implement some sort
      # of our own.
      @listenTo(@model, 'change:from_center add remove reset', @render)

      @render()

    template: Handlebars.getTemplate('notifications')

    render: ->
      @$el.html @template()
      @model.sort()
      @model.each @addOne, @

    addOne: (notification) ->
      v = new NotificationView {model: notification}
      @$('#notifications-list').append v.render().el
