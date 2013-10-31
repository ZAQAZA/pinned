express = require 'express'
wazeProxy = require './waze'
configure = require './configure'

app = express()
configure app
wazeProxy app
app.listen 8080

console.log 'listening 8080'
