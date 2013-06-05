// Generated by CoffeeScript 1.6.2
(function() {
  var app, io, server;

  app = require('express')();

  server = require('http').createServer(app);

  io = require('socket.io').listen(server);

  server.listen(8089);

  app.get('/', function(req, res) {
    return res.sendfile("" + __dirname + "/index.html");
  });

  app.get('/jquery-2.0.2.min.js', function(req, res) {
    return res.sendfile("" + __dirname + "/jquery-2.0.2.min.js");
  });

  app.get('/control.js', function(req, res) {
    return res.sendfile("" + __dirname + "/controls.js");
  });

  io.sockets.on('connection', function(socket) {
    socket.broadcast.emit('new user', {});
    socket.on('play', function(data) {
      socket.emit('play', {});
      return socket.broadcast.emit('play', {});
    });
    socket.on('pause', function(data) {
      socket.emit('pause', {});
      return socket.broadcast.emit('pause', {});
    });
    return socket.on('restart', function(data) {
      socket.emit('restart', {});
      return socket.broadcast.emit('restart', {});
    });
  });

}).call(this);