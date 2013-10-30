sys = require "sys"
my_http = require "http"
server = my_http.createServer (request,response) ->
  sys.puts "I got kicked"
  response.writeHeader 200, {"Content-Type": "text/plain"}
  response.write "Hello World"
  response.end()

server.listen 8080
sys.puts "Server Running on 8080"