extends CharacterBody2D

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
	velocity.y += GRAV
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if axis.x == -1 and global_position.x > 192:
		$Icon.flip_h = true
		$Icon.rotate(-0.05)
		velocity.x = axis.x * VEL
	elif axis.x == 1 and global_position.x < 832:
		$Icon.flip_h = false
		$Icon.rotate(0.05)
		velocity.x = axis.x * VEL
	else:
		velocity.x = 0
	
	if self.is_on_floor():
		velocity.y -= GRAV*32
		$AnimationPlayer.play("Jump")
	velocity *= 60*delta
	move_and_slide()
	
	if global_position.y >= 592:
		emit_signal("dead")
		queue_free()

func _on_Star_GotStar():
	canMove = false
	var tween = create_tween()
	tween.tween_property($Icon, "modulate", Color(255, 255, 255, 0), 1)
	emit_signal("next")

func _on_Area2D_body_entered(body):
	if body.is_in_group("Spikes"):
		emit_signal("dead")
		queue_free()

func _on_spikes_map_tree_entered():
	emit_signal("dead")
	queue_free()

func _on_spikes_map_child_entered_tree(node):
	if node.name == "Player":
		emit_signal("dead")
		queue_free()
