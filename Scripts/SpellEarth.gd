extends "res://Scripts/Spell.gd"

func _init():
	SPEED = 800
	DAMAGE = 30
	ELEMENT = elements.Earth
	ORIGIN = "Player"

func _on_Spell_body_entered(body):
	if body.name != ORIGIN:
		queue_free()
