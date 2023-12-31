extends Label

var time_elapsed := 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	
	var minutes := time_elapsed / 60
	var seconds := fmod(time_elapsed, 60)
	var milliseconds := fmod(time_elapsed, 1) * 100
	var time_string := "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
	
	text = time_string
	
