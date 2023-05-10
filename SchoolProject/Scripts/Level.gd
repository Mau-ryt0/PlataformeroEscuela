extends Node2D

var canChange = false

func _ready():
	canChange = false

func _physics_process(_delta):
	if canChange == true and Input.is_action_just_pressed("ui_accept"):
		Global.index += 1
		get_tree().change_scene(Global.levels[Global.index])
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()

func _on_Player_dead():
	$DeathSound.play()

func _on_DeathSound_finished():
	get_tree().reload_current_scene()

func _on_Brick_broken():
	$FartSound.play()

func _on_Star_GotStar():
	$ScreamSound.play()

func _on_Player_next():
	canChange = true
	$CanvasLayer/Label.show()
