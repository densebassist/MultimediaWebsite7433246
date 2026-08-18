extends Button


func open_link():
	OS.shell_open("https://drive.google.com/file/d/1gpkIxeM5Ng-wdJNX68NnfUbi_Yl0Kry8/view?usp=sharing")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(open_link)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
