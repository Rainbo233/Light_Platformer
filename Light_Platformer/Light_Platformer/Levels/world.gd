extends Node2D

@onready var player := $Player
@onready var ui := $VictoryUI
@onready var time_label := $VictoryUI/TimeLabel


func _on_goal_body_entered(body):
	
	if body is CharacterBody2D:
		time_label.text = "Final Time: " + player.get_final_time()
		ui.show()
		player.set_physics_process(false)
		player.stopwatch.hide()
	
