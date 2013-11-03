express = require 'express'
wazeProxy = require './waze'
configure = require './configure'

port = process.env.PORT || 8080
app = express()
configure app
wazeProxy app
app.listen port

console.log "Server in listening port #{port}"
