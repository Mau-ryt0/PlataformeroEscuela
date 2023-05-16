extends Control

signal next

func _physics_process(_delta):
	if Global.canChange == true:
		$CanvasLayer/NextLevel.show()
#	if Global.canChange == true:
#		$CanvasLayer/NextLevel.show()

func _on_restart_pressed():
	var _useValue = get_tree().reload_current_scene()

func _on_next_level_pressed():
	if Global.canChange == true:
		emit_signal("next")

func _on_level_select_pressed():
	var _useValue = get_tree().change_scene_to_file("res://Level_select.tscn")

func _on_pause_pressed():
	if Global.isPaused == false:
		Global.isPaused = true
		get_tree().paused = true
	else:
		Global.isPaused = false
		get_tree().paused = false
