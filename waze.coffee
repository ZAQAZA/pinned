request = require 'request'

wazeBaseUrl = 'http://test-notifications.staging.waze.com/'
wazify = (path) -> wazeBaseUrl + path

module.exports = (app) ->

  app.get '/notifications', (req, res) ->
    url = 'notifications.json'
    request(wazify url).pipe res

  app.get '/notifications/updates', (req, res) ->
    url = 'notifications/updates.json'
    r = request.get
      url: wazify url
      qs: req.query
    r.pipe res

  app.post '/notifications', (req, res) ->
    url = 'notifications.json'
    r = request.post
      url: wazify url
      json: req.body
    r.pipe res

  app.put '/notifications/:id', (req, res) ->
    url = 'notifications/' + req.params.id + '.json'
    r = request.put
      url: wazify url
      json: req.body
    r.pipe res

  app.delete '/notifications/:id', (req, res) ->
    url = 'notifications/' + req.params.id + '.json'
    request.del(wazify url).pipe res

  app.put '/notifications/:id/upvote', (req, res) ->
    url = 'notifications/' + req.params.id + '/upvote.json'
    request.put(wazify url).pipe res
