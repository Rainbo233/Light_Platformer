extends Area2D

@export var is_dash := false


func _process(delta):
	
	pass
	

func _on_body_entered(body):
	
	if is_dash:
		
		body.enable_dash()
		
	else:
		
		body.enable_double_jump()
		
	
