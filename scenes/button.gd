extends Button
@export var video_link: String = "https://youtube.com"

func open_link():
	OS.shell_open(video_link)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(open_link)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
