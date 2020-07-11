extends RigidBody2D

var speed = 800
var DAMAGE = 10

func _ready():
	apply_impulse(Vector2(), Vector2(speed, 0).rotated(get_angle_to(get_global_mouse_position())))

func _on_Spell_body_entered(body):
	if body.name != "Player":
		queue_free()
