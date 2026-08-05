extends Area2D
func _ready() -> void:
	print("test")

# Tracks if the player is standing on the teleporter
var is_player_touching: bool = false

# The target coordinates where the player will be sent
@export var target_position: Vector2 = Vector2(-720, 584)
@export var target_scene: PackedScene


func _on_body_entered(body: Node2D) -> void:
	
	print("Inside")
	if body.is_in_group("Player"):
		is_player_touching = true
		

func _on_body_exited(body: Node2D) -> void:
	print("Outisde")
	if body.is_in_group("Player"):
		is_player_touching = false

func _unhandled_input(event: InputEvent) -> void:
	# Checks if the player is touching the object AND presses E
	if is_player_touching and Input.is_action_pressed("interact"):
		await get_tree().create_timer(0.2).timeout
		print("Teleporting")
		ScreenTransition.get_node("AnimationPlayer").play("fade_to_black")
		await ScreenTransition.get_node("AnimationPlayer").animation_finished
		teleport_player()
		

func teleport_player() -> void:
	if target_scene:
		await get_tree().create_timer(1).timeout
		
		get_tree().change_scene_to_packed(target_scene)
	else:
		print("Warning: No target scene assigned to this teleporter!")

	
	
		#player.global_position = target_position
		#await get_tree().create_timer(1.0).timeout

	ScreenTransition.get_node("AnimationPlayer").play("fade_in")
