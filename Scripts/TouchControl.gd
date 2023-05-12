extends Control

func _ready():
	if OS.get_name() != "Android":
		$CanvasLayer.hide()

func _physics_process(delta):
	if Global.canChange == true and OS.get_name() == "Android":
		$CanvasLayer/NextLevel.show()
