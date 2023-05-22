extends Node

var canChange = false
var canMove = true
var fullScreen = false
var isPaused = false

var levels = ["res://Levels/Level.tscn", "res://Levels/Level1.tscn", "res://Levels/Level2.tscn", "res://Levels/Level3.tscn", "res://Levels/Level4.tscn", "res://Levels/Level5.tscn", "res://Credits.tscn"]
var index = 0

func _physics_process(_delta):
	if Input.is_action_just_pressed("Fullscreen"):
		if fullScreen == false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			fullScreen = true
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			fullScreen = false
	if Input.is_action_just_pressed("Menu"):
		var _useValue = get_tree().change_scene_to_file("res://Level_select.tscn")
