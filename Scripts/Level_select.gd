extends Control

func _ready():
	if OS.get_name() != "Android":
		$CanvasLayer2.show()

func _on_level_pressed():
	Global.index = 0
	var _useValue = get_tree().change_scene_to_file(Global.levels[Global.index])

func _on_level_1_pressed():
	Global.index = 1
	var _useValue = get_tree().change_scene_to_file(Global.levels[Global.index])

func _on_level_2_pressed():
	Global.index = 2
	var _useValue = get_tree().change_scene_to_file(Global.levels[Global.index])
