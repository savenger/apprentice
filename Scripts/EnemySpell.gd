extends RigidBody2D

var speed = 500
var DAMAGE = 10

func _ready():
	var player = get_node("../Player")
	apply_impulse(Vector2(), Vector2(speed, 0).rotated(get_angle_to(player.global_position)))

func _on_Spell_body_entered(body):
	queue_free()
