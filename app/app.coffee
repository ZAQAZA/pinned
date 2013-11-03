# Creating the app view and attaching to the body for kicking things off
define ['jquery', 'helpers', 'views/app', 'utils'], ($, H, AppView) ->

  ->
    $ ->
      new AppView { el: $("body") }
