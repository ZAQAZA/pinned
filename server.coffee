express = require 'express'
app = express()
jade = require 'jade'

app.use require('connect-assets')()

app.get '/', (req, res) ->
  html = jade.renderFile __dirname + '/views/index.jade',
    pageTitle: 'Ofri Dagan'
    youAreUsingJade: true
  res.send html

app.use express.static(__dirname + '/public')

app.listen 8080
console.log 'listening 8080 '
