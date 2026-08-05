extends CharacterBody2D

const walk_SPEED = 80.0
const run_SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var camera_2d: Camera2D = $Camera2D
@onready var jump_sound: AudioStreamPlayer2D = $jump_sound
@onready var click_sound: AudioStreamPlayer2D = $click_sound




func _physics_process(delta: float) -> void:
	

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction and Input.is_action_pressed("sprint"):
		velocity.x = direction * run_SPEED

	elif direction:
		velocity.x = direction * walk_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, walk_SPEED)
		
			
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	


	# Play animations
	if is_on_floor():
		if direction != 0:
			$AnimatedSprite2D.play("walk")
		else:
			$AnimatedSprite2D.play("idle")
			
		if not is_on_floor():
			$AnimatedSprite2D.play("jump")
	else:
		$AnimatedSprite2D.play("jump")
	
	move_and_slide()
	
	if Input.is_action_just_pressed("click"):
		click_sound.play()





		
