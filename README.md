Pinned
=========

### Live Notifications System Pinned to a Map
***

A small app used to create notification assosiated with a geo-location by clicking on a map.

**Have a look at a live website [here].**  
(please allow some time for the app to load at the first time, as the free heroku account has a hibernation feature to save resources)

Installation
-------------

Follow this if you want to run the code yourself:  
```sh
git clone https://github.com/ZAQAZA/pinned.git
cd pinned
npm install
npm start
```
Goto http://localhost:PORT (PORT is 8080 or ENV.PORT)  
Note, you need an internet connection for the app to work because of the WAZE API.

General Architecture
--------------------

- The app is almost enirely client-side.
- A small [node.js] server is used to serve all application assets (js, css and templates). Compilation of stylus and coffeescript happens per request of first use.
- The server also provides a proxy-API for the provided WAZE API (because of the same-origin policy).
- On the client I used [backbone.js] for seperation of models and view-controllers.
- A collection of all available notification is maintained on the client and periodically merged with new updates from the server.


What I Have Used
----------------
To complete the task I used the following libraries/projects
- [node.js] - The server that serves the app and proxies WAZE API. I used the following node.js modules:
    - [express.js] - For routing, and using connect-middlewares.
    - [request] - For proxing the API requests.
    - [coffee-script] - For a coffeescript compiler. Both on the server, and of request-time client side javascripts.
    - [connect-coffee-script] - For a middleware that uses the coffe-script module to compile coffeescript assets on request.
    - [stylus] - For compiling stylus files to css.
- [backbone.js] - For an MV* separation of responsibilities.
    - [jQuery] - (backbone dependency)
    - [underscore] - (backbone dependency)
- [require.js] - For module loading.
- [handlebars.js] - For HTML templating.
- [leaflet.js] - For a map implementation. 


  [here]: http://shrouded-atoll-1527.herokuapp.com/
  [backbone.js]: http://documentcloud.github.io/backbone/
  [node.js]: http://nodejs.org
  [express.js]: http://expressjs.com/
  [request]: https://github.com/mikeal/request
  [coffee-script]: https://github.com/jashkenas/coffee-script/
  [connect-coffee-script]: https://github.com/wdavidw/node-connect-coffee-script
  [stylus]: https://github.com/LearnBoost/stylus
  [Twitter Bootstrap]: http://twitter.github.com/bootstrap/
  [jQuery]: http://jquery.com  
  [underscore]: http://underscorejs.org/
  [require.js]: http://requirejs.org/
  [handlebars.js]: http://handlebarsjs.com/
  [leaflet.js]: http://leafletjs.com/   
