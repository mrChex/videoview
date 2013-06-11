app = require('express')()
server = require('http').createServer app
io = require('socket.io').listen server
convert = require 'convert'

server.listen 8089

app.get '/', (req, res)->
	res.sendfile "#{__dirname}/templates/index.html"

app.get '/progress', (req, res)->
	res.sendfile "#{__dirname}/templates/progress.html"

app.get '/jquery-2.0.2.min.js', (req, res)->
	res.sendfile "#{__dirname}/static/jquery-2.0.2.min.js"

app.get '/control.js', (req, res)->
	res.sendfile "#{__dirname}/static/controls.js"

app.get '/progress.js', (req, res)->
	res.sendfile "#{__dirname}/static/progress.js"


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

	socket.on 'do_convert', (data)->
		console.log 'do convert!'
		convert.do (percent)->
			socket.emit 'convert_progress', {"percent": percent}
			socket.broadcast.emit 'convert_progress', {"percent": percent}