extends AnimatableBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var up_or_down = "up"
func _ready() -> void:
	var up_or_down = "up"




func _on_area_2d_body_entered(body: Node2D):
	# Check if the body that touched us is named "Player"
	if body.name == "Player":
		if up_or_down == "up":
			animation_player.play("move_down") 
			await get_tree().create_timer(5.0).timeout
			up_or_down = "down"
			
		elif up_or_down == "down":
			animation_player.play("move_up")
			await get_tree().create_timer(5.0).timeout
			up_or_down = "up"
			
		else:
			pass
	return up_or_down	

func _process(delta: float) -> void:
	_on_area_2d_body_entered
