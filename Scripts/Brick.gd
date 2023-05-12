extends StaticBody2D

export var life = 1

signal broken

func _ready():
	if (life == 1):
		$Sprite.modulate = Color(128, 128, 128)

func _on_Area2D_body_entered(body):
	if body.name == "Player" and life == 0:
		emit_signal("broken")
		queue_free()
	elif body.name == "Player":
		life -= 1
		$Sprite.frame = 1
