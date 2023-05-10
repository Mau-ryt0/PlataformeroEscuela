extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()

func _on_AudioStreamPlayer2D_finished():
	get_tree().change_scene("res://Level.tscn")
