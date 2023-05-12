extends Node2D

func _physics_process(delta):
	$CanvasLayer/Label.rect_position.y -= 48*delta

func _on_AudioStreamPlayer2D_finished():
	get_tree().quit()
