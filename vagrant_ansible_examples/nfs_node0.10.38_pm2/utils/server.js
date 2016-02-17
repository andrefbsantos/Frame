var restify = require('restify');
var config = require('config');

// Application

var message = config.get('message');

function helloThere(req, res, next){
  res.send(message + ' there');
  next();
}

function hello(req, res, next) {
  res.send(message + ' ' + req.params.name);
  next();
}

var server = restify.createServer();
server.get('/hello/:name', hello);
server.get('/hello', helloThere);

module.exports = server;
