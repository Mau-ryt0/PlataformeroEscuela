extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()

func _on_AudioStreamPlayer2D_finished():
	var _useValue = get_tree().change_scene_to_file("res://Levels/Level.tscn")
