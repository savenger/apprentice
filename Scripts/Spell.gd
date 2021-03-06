extends RigidBody2D

var ELEMENT
var SPEED = 15
var DAMAGE = 10
var ORIGIN
var splash = preload("res://Scenes/Splash.tscn")

func _ready():
	apply_impulse(Vector2(), Vector2(SPEED, 0).rotated(get_rotation()))

func splash():
	var splash_instance = splash.instance()
	splash_instance.global_position = get_global_position()
	splash_instance.ELEMENT = ELEMENT
	get_parent().add_child(splash_instance)
