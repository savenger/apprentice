extends "res://Scripts/Pickups.gd"

func body_entered(body):
	if body.name == "Player":
		body.hp += 15
		queue_free()
