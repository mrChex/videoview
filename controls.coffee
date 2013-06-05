socket = io.connect '/'
video = $("#video")[0]

play = ->
	console.log "Play initialized"
	console.log video
	$("#video")[0].play()

pause = ->
	console.log "Pause initialized"
	$("#video")[0].pause()

restart = ->
	console.log "Restart initialized"
	$("#video")[0].currentTime = 0



socket.on 'play', (data)->
	console.log "Do play"
	play()

socket.on 'pause', (data)->
	console.log "Do play"
	pause()

socket.on 'restart', (data)->
	console.log "Do restart"
	restart()

socket.on 'new user', (data)->
	console.log "user connected"


$("#play_link").on 'click', -> socket.emit "play"
$("#pause_link").on 'click', -> socket.emit "pause"
$("#restart_link").on 'click', -> socket.emit "restart"