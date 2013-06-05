// Generated by CoffeeScript 1.6.2
(function() {
  var pause, play, restart, socket, video;

  socket = io.connect('/');

  video = $("#video")[0];

  play = function() {
    console.log("Play initialized");
    console.log(video);
    return $("#video")[0].play();
  };

  pause = function() {
    console.log("Pause initialized");
    return $("#video")[0].pause();
  };

  restart = function() {
    console.log("Restart initialized");
    return $("#video")[0].currentTime = 0;
  };

  socket.on('play', function(data) {
    console.log("Do play");
    return play();
  });

  socket.on('pause', function(data) {
    console.log("Do play");
    return pause();
  });

  socket.on('restart', function(data) {
    console.log("Do restart");
    return restart();
  });

  socket.on('new user', function(data) {
    return console.log("user connected");
  });

  $("#play_link").on('click', function() {
    return socket.emit("play");
  });

  $("#pause_link").on('click', function() {
    return socket.emit("pause");
  });

  $("#restart_link").on('click', function() {
    return socket.emit("restart");
  });

}).call(this);
