extends Node2D

func _ready():
	Global.canChange = false
	if OS.get_name() == "Android":
		$CanvasLayer/Label.queue_free()

func _physics_process(_delta):
	if Global.canChange == true and Input.is_action_just_pressed("ui_accept"):
		$VideoPlayer.show()
		$VideoPlayer.play()
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
	Global.canChange = true
	$CanvasLayer/Label.show()

func _on_VideoPlayer_finished():
	Global.index += 1
	get_tree().change_scene(Global.levels[Global.index])
