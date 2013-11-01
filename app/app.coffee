define ['jquery', 'underscore', 'bars', 'views/layout'], ($, _, Handlebars, Layout) ->

  ->
    new Layout { el: $("body") }