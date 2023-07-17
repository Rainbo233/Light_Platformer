extends CharacterBody2D

@export var speed := 300.0
@export var dash_speed := 100
@export var jump_velocity := -400.0
@export var double_jump_enabled := false
@export var dash_enabled := false

@onready var dash_timer := $Dash_Timer
@onready var flashlight := $Flashlight
@onready var stopwatch := $stopwatch

var jumps := 2
var dash_off_cooldown := true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	flashlight.look_at(get_global_mouse_position())
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		if Input.is_action_just_pressed("jump") and double_jump_enabled:
			jump(delta)
		
	
	if is_on_floor():
		
		jumps = 2
		
	
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump(delta)
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	# Handle Dash.
	if Input.is_action_just_pressed("dash") and dash_enabled:
		
		if dash_off_cooldown:
			dash(direction)
			
	
	move_and_slide()

func jump(delta) -> void:
	
	jumps -= 1
	if jumps >= 0:
		velocity.y = jump_velocity
	

func enable_double_jump() -> void:
	
	double_jump_enabled = true
	

func dash(direction) -> void:
	
	dash_off_cooldown = false
	position.x += dash_speed * direction
	dash_timer.start()
	
	

func get_final_time() -> String:
	
	return stopwatch.text
	

func enable_dash() -> void:
	
	dash_enabled = true
	

func _on_dash_timer_timeout():
	
	dash_off_cooldown = true
	
