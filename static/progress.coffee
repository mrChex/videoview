socket = io.connect '/'

socket.on 'convert_progress', (data)->
	$("#progress_container>div").css 'width', "#{data.percent}%"