express = require 'express'
app = express()

app.use '/js', require('connect-coffee-script')
  src: __dirname + '/app'
  dest: __dirname + '/public/js'

app.use '/css', require('stylus').middleware
  src: __dirname + '/stylus'
  dest: __dirname + '/public/css'

app.use '/js/vendor', express.static(__dirname + '/vendor')
app.use '/templates', express.static(__dirname + '/templates')
app.use express.static(__dirname + '/public')

app.listen 8080
console.log 'listening 8080'
