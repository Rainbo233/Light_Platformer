extends Area2D

@export var is_dash := false


func _process(delta):
	
	pass
	

func _on_body_entered(body):
	
	if body is CharacterBody2D:
		
		if is_dash:
		
			body.enable_dash()
			queue_free()
		
		else:
		
			body.enable_double_jump()
			queue_free()
		
		
	
	
	
