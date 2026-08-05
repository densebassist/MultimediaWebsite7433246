extends VideoStreamPlayer

@onready var button = $"../Pause"



func _on_pause_pressed() -> void:
	paused = !paused
	if paused:
		button.text = "Play"
	
	else:
		button.text = "Pause"



func _on_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/video_projects.tscn")
