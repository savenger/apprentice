extends "res://Scripts/Entity.gd"


func _init():
	MAX_HEALTH = 100
	health = MAX_HEALTH
	SPEED = 0
	TYPE = "PORTAL"

var active setget active_set
var supported_monsters = 2

func active_set(new_value):
	active = new_value
	if active:
		$portal.texture = load("res://Assets/Graphics/portal.png")
	else:
		$portal.texture = load("res://Assets/Graphics/portal_inactive.png")

func _on_Timer_timeout():
	active = true
