define ['backbone', 'bars', 'models/model', 'views/notification'], (Backbone, Handlebars, Model, NotificationView) ->

  Backbone.View.extend
    initialize: ->
      @listenTo(Model.notifs, 'all', @render)
      @render()

    template: Handlebars.getTemplate('notifications')

    render: ->
      @$el.html @template()
      Model.notifs.each (n) ->
        v = new NotificationView {model: n}
        @$('#notifications-list').append v.render().el
      @

