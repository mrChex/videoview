// Generated by CoffeeScript 1.6.2
(function() {
  var app, convert, io, server;

  app = require('express')();

  server = require('http').createServer(app);

  io = require('socket.io').listen(server);

  convert = require('convert');

  server.listen(8089);

  app.get('/', function(req, res) {
    return res.sendfile("" + __dirname + "/templates/index.html");
  });

  app.get('/progress', function(req, res) {
    return res.sendfile("" + __dirname + "/templates/progress.html");
  });

  app.get('/jquery-2.0.2.min.js', function(req, res) {
    return res.sendfile("" + __dirname + "/static/jquery-2.0.2.min.js");
  });

  app.get('/control.js', function(req, res) {
    return res.sendfile("" + __dirname + "/static/controls.js");
  });

  app.get('/progress.js', function(req, res) {
    return res.sendfile("" + __dirname + "/static/progress.js");
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
    socket.on('restart', function(data) {
      socket.emit('restart', {});
      return socket.broadcast.emit('restart', {});
    });
    return socket.on('do_convert', function(data) {
      console.log('do convert!');
      return convert["do"](function(percent) {
        socket.emit('convert_progress', {
          "percent": percent
        });
        return socket.broadcast.emit('convert_progress', {
          "percent": percent
        });
      });
    });
  });

}).call(this);
