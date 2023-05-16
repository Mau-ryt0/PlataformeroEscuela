extends Node2D

func _ready():
	if OS.get_name() != "Android":
		$CanvasLayer/Label2.show()

func _physics_process(delta):
	$CanvasLayer/Label.position.y -= 46*delta

func _on_AudioStreamPlayer2D_finished():
	pass #get_tree().quit()

func _on_level_select_pressed():
	var _useValue = get_tree().change_scene_to_file("res://Level_select.tscn")
