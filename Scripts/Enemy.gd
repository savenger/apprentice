extends RigidBody2D

func _on_Enemy_body_entered(body):
	if body.get_name() == "Player":
		body.damage(20)
