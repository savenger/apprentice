extends "res://Scripts/Entity.gd"

export (global.ELEMENTS) var ELEMENT

func _init():
	MAX_HEALTH = 200
	health = MAX_HEALTH
	SPEED = 0
	TYPE = "PORTAL"
	ELEMENT = global.ELEMENTS.Fire

var active setget active_set
const MAX_SUPPORTED_MONSTERS = 2
var supported_monsters = MAX_SUPPORTED_MONSTERS

func _ready():
	match ELEMENT:
		global.ELEMENTS.Fire:
			$portals.frame = 4
		global.ELEMENTS.Ice:
			$portals.frame = 5
		global.ELEMENTS.Earth:
			$portals.frame = 6
		global.ELEMENTS.Wind:
			$portals.frame = 7

func active_set(new_value):
	active = new_value
	if active:
		update_health(MAX_HEALTH)
		$portals.frame = ($portals.frame + 4) % 8
		supported_monsters = MAX_SUPPORTED_MONSTERS
	else:
		$portals.frame = ($portals.frame + 4) % 8
		supported_monsters = 0

func _on_Timer_timeout():
	active_set(true)

func _physics_process(delta):
	damage_loop()
	if health == 0 and $Timer.is_stopped():
		active_set(false)
		$Timer.start()
