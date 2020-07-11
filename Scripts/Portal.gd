extends "res://Scripts/Entity.gd"


func _init():
	MAX_HEALTH = 100
	health = MAX_HEALTH
	SPEED = 0
	TYPE = "PORTAL"

var active setget active_set
const MAX_SUPPORTED_MONSTERS = 2
var supported_monsters = MAX_SUPPORTED_MONSTERS

func active_set(new_value):
	active = new_value
	if active:
		health = MAX_HEALTH
		$portal.texture = load("res://Assets/Graphics/portal.png")
		supported_monsters = MAX_SUPPORTED_MONSTERS
	else:
		$portal.texture = load("res://Assets/Graphics/portal_inactive.png")
		supported_monsters = 0

func _on_Timer_timeout():
	print("_on_Timer_timeout()")
	active_set(true)

func _physics_process(delta):
	damage_loop()
	if health == 0 and $Timer.is_stopped():
		active_set(false)
		$Timer.start()
