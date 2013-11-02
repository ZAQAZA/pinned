define ['jquery', 'helpers', 'views/app', 'utils'], ($, H, AppView) ->

  ->
    $ ->
      new AppView { el: $("body") }
