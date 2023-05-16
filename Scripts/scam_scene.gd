extends Control

func _on_scam_timer_timeout():
	var _useValue = get_tree().change_scene_to_file("res://SplashScreen.tscn")
