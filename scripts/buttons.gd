extends Control
@export_file("*.tscn") var last_scene: String



func _on_button_quit_pressed() -> void:
	ScreenTransition.get_node("AnimationPlayer").play("fade_to_black")
	await ScreenTransition.get_node("AnimationPlayer").animation_finished
	get_tree().quit()
	
	
func _on_button_back_pressed() -> void:
	if last_scene == "":
		print("ERROR: No previous scene assigned!")
		return
	
	print("Going back to: ", last_scene)
	
	ScreenTransition.get_node("AnimationPlayer").play("fade_to_black")
	await ScreenTransition.get_node("AnimationPlayer").animation_finished
	
	get_tree().change_scene_to_file(last_scene)
	ScreenTransition.get_node("AnimationPlayer").play("fade_in")


func _on_button_home_pressed() -> void:
	ScreenTransition.get_node("AnimationPlayer").play("fade_to_black")
	#await ScreenTransition.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	ScreenTransition.get_node("AnimationPlayer").play("fade_in")
	
