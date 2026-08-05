extends Control
var paused = true
var playback_position = 0.0
@onready var button: Button = $Pause

@onready var music: AudioStreamPlayer = $Music
@onready var progress = $TextureProgressBar

func _ready():
	progress.max_value = music.stream.get_length()
	progress.value = 0

func _process(_delta):
	if music.playing:
		progress.value = music.get_playback_position()

	

	

func _on_pause_button_down() -> void:
	if music.playing:
		playback_position = music.get_playback_position()
		music.stop()
		button.text = "Play"
	else:
		music.play(playback_position)
		button.text = "Pause"


#func _on_texture_progress_bar_gui_input(event: InputEvent) -> void:
#	if event is InputEventMouseButton and event.pressed:
#		var percent = event.position.x / size.x
#		music.seek(percent * music.stream.get_length())
