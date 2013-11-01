define ['backbone'], (Backbone) ->

  Backbone.Model.extend
    initialize: ->
    urlRoot: '/notifications'

    upvoteUrl: ->
      @url() + '/upvote'

    sync: (method, model, options) ->
      options.url = @upvoteUrl() if options['upvote']
      Backbone.sync.call(model, method, model, options) 


