app = require('express')()
server = require('http').createServer app
io = require('socket.io').listen server

server.listen 8089

app.get '/', (req, res)->
	res.sendfile "#{__dirname}/index.html"

app.get '/jquery-2.0.2.min.js', (req, res)->
	res.sendfile "#{__dirname}/jquery-2.0.2.min.js"

app.get '/control.js', (req, res)->
	res.sendfile "#{__dirname}/controls.js"

io.sockets.on 'connection', (socket)->
	socket.broadcast.emit 'new user', {}

	socket.on 'play', (data)->
		socket.emit 'play', {}
		socket.broadcast.emit 'play', {}

	socket.on 'pause', (data)->
		socket.emit 'pause', {}
		socket.broadcast.emit 'pause', {}

	socket.on 'restart', (data)->
		socket.emit 'restart', {}
		socket.broadcast.emit 'restart', {}

