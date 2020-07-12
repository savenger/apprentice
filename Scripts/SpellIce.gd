extends "res://Scripts/Spell.gd"

func _init():
	SPEED = 800
	ELEMENT = global.ELEMENTS.Ice
	ORIGIN = "Player"

func _on_Spell_body_entered(body):
	if body.name != ORIGIN:
		splash()
		queue_free()
