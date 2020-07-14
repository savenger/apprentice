extends "res://Scripts/Spell.gd"

var charged = false setget set_charged

func _init():
	SPEED = 800
	ELEMENT = global.ELEMENTS.Wind
	ORIGIN = "Player"

func _on_Spell_body_entered(body):
	if body.name != ORIGIN:
		call_deferred("splash")
		queue_free()

func set_charged(value):
	charged = value
	if charged:
		$spellWind/Particles2D.amount *= 50
