extends "res://Scripts/Spell.gd"

func _init():
	SPEED = 800
	DAMAGE = 10
	ELEMENT = elements.Ice

func _on_Spell_body_entered(body):
	if body.name != "Player":
		queue_free()
