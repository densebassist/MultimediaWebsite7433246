extends Area2D

# Tracks if the player is standing on the teleporter
var is_player_touching: bool = false

# Prevents the teleporter from being triggered multiple times
var teleporting: bool = false

# The target coordinates where the player will be sent
@export var target_position: Vector2 = Vector2(-720, 584)
@export var target_scene: PackedScene


func _ready() -> void:
	print("test")


func _on_body_entered(body: Node2D) -> void:
	print("Inside")
	
	if body.is_in_group("Player"):
		is_player_touching = true


func _on_body_exited(body: Node2D) -> void:
	print("Outside")
	
	if body.is_in_group("Player"):
		is_player_touching = false


func _unhandled_input(event: InputEvent) -> void:
	# Only trigger once when E is initially pressed
	if event.is_action_pressed("interact") and is_player_touching and not teleporting:
		teleport_player()


func teleport_player() -> void:
	if not target_scene:
		print("Warning: No target scene assigned to this teleporter!")
		return
	
	teleporting = true
	
	print("Teleporting")
	
	# Fade to black
	ScreenTransition.get_node("AnimationPlayer").play("fade_to_black")
	await ScreenTransition.get_node("AnimationPlayer").animation_finished
	
	# Small delay before changing scenes
	await get_tree().create_timer(1.0).timeout
	
	# Change scene
	get_tree().change_scene_to_packed(target_scene)
	ScreenTransition.get_node("AnimationPlayer").play("fade_in")
