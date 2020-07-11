extends RigidBody2D

var ELEMENT
var SPEED
var DAMAGE

func _ready():
	apply_impulse(Vector2(), Vector2(SPEED, 0).rotated(get_angle_to(get_global_mouse_position())))
