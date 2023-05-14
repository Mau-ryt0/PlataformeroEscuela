extends Node

var canChange = false
var fullScreen = false

# var levels = ["res://Levels/Level.tscn", "res://Levels/Level1.tscn", "res://Levels/Level2.tscn", "res://Levels/Level3.tscn", "res://Credits.tscn"]
var levels = ["res://Levels/Level.tscn", "res://Levels/Level1.tscn", "res://Levels/Level2.tscn", "res://Credits.tscn"]
var index = 0

func _physics_process(_delta):
	if Input.is_action_just_pressed("Fullscreen"):
		if fullScreen == false:
			DisplayServer.window_set_mode(4, 0)
			fullScreen = true
		else:
			DisplayServer.window_set_mode(0, 0)
			fullScreen = false
