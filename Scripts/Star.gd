extends Area2D

signal GotStar

func _on_Star_body_entered(body):
	if body.name == "Player":
		emit_signal("GotStar")
		#queue_free()
