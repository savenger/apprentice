extends "res://Scripts/Pickups.gd"

func body_entered(body):
	if body.name == "Player":
		body.health += 15
		print(str(body.health) + "hp")
		queue_free()
