extends RigidBody2D

var ELEMENT
var SPEED
var DAMAGE
var ORIGIN

func _ready():
	apply_impulse(Vector2(), Vector2(SPEED, 0).rotated(get_rotation()))
