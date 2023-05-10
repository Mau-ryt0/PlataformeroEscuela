extends KinematicBody2D

const GRAV = 8
const VEL = 128
var POS = Vector2.ZERO
var axis = Vector2.ZERO

var canMove = true

signal dead
signal next

func _physics_process(delta):
	if canMove == true:
		movement(delta)

func movement(delta):
	POS.y += GRAV
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if axis.x == -1 and global_position.x > 0:
		$Icon.flip_h = true
		$Icon.rotate(-0.05)
		POS.x = axis.x * VEL
	elif axis.x == 1 and global_position.x < 640:
		$Icon.flip_h = false
		$Icon.rotate(0.05)
		POS.x = axis.x * VEL
	else:
		POS.x = 0
	
	if self.is_on_floor():
		POS.y -= GRAV*32
		$AnimationPlayer.play("Jump")
	
	POS = move_and_slide(POS*60*delta, Vector2(0, -1))
	
	if global_position.y >= 592:
		emit_signal("dead")
		queue_free()

func _on_Star_GotStar():
	canMove = false
	var tween = create_tween()
	tween.tween_property($Icon, "modulate", Color(255, 255, 255, 0), 1)
	emit_signal("next")
