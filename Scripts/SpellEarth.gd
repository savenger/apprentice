extends "res://Scripts/Spell.gd"

var charged = false setget set_charged

func _init():
	SPEED = 800
	ELEMENT = global.ELEMENTS.Earth
	ORIGIN = "Player"

func _on_Spell_body_entered(body):
	if body.name != ORIGIN:
		splash()
		queue_free()

func set_charged(value):
	charged = value
	if charged:
		$spellEarth/Particles2D.amount *= 50
