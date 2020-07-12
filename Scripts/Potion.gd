extends "res://Scripts/Pickups.gd"

func body_entered(body):
	if body.name == "Player":
		body.update_health(body.health + 22)
		queue_free()
