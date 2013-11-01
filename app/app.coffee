define ['jquery', 'underscore', 'bars', 'views/app', 'models/notifications'], ($, _, Handlebars, AppView, Notifs) ->

  ->
    new AppView { el: $("body") }
