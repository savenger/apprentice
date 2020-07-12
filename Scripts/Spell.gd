extends RigidBody2D

var ELEMENT
var SPEED
var DAMAGE
var ORIGIN

func _ready():
	if ORIGIN == "Player":
		apply_impulse(Vector2(), Vector2(SPEED, 0).rotated(get_rotation()))
	else:
		var player = get_node("../Player")
		apply_impulse(Vector2(), Vector2(SPEED, 0).rotated(get_angle_to(player.global_position)))
