express = require 'express'

module.exports = (app) ->

  app.use '/js', require('connect-coffee-script')
    src: __dirname + '/app'
    dest: __dirname + '/public/js'

  app.use '/css', require('stylus').middleware
    src: __dirname + '/stylus'
    dest: __dirname + '/public/css'

  app.use '/js/vendor', express.static(__dirname + '/vendor/js')
  app.use '/css/vendor', express.static(__dirname + '/vendor/css')
  app.use '/templates', express.static(__dirname + '/templates')
  app.use express.static(__dirname + '/public')

  app.use express.bodyParser()

  process.on 'uncaughtException', (err) ->
    console.log err
