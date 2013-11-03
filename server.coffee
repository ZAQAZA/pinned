# Server bootstrapping
express = require 'express'
wazeProxy = require './waze'
configure = require './configure'

port = process.env.PORT || 8080
app = express()
configure app # middlewares
wazeProxy app # WAZE API
app.listen port

console.log "Server in listening port #{port}"
