# Declares the connect middlewares we will use.
express = require 'express'

module.exports = (app) ->

  # Compling coffeescripts from /app to /public/js when requests to /js come.
  app.use '/js', require('connect-coffee-script')
    src: __dirname + '/app'
    dest: __dirname + '/public/js'

  # Compling stylus from /stylus to /public/css when requests to /css come.
  app.use '/css', require('stylus').middleware
    src: __dirname + '/stylus'
    dest: __dirname + '/public/css'

  # Some static folders path definitions.
  app.use '/js/vendor', express.static(__dirname + '/vendor/js')
  app.use '/css/vendor', express.static(__dirname + '/vendor/css')
  app.use '/templates', express.static(__dirname + '/templates')
  app.use express.static(__dirname + '/public')

  # For easy access to the post params
  app.use express.bodyParser()

  # Catch-all error handling
  process.on 'uncaughtException', (err) ->
    console.log err
