extends "res://Scripts/Spell.gd"

var charged = false setget set_charged

func _init():
	SPEED = 800
	ELEMENT = global.ELEMENTS.Fire
	ORIGIN = "Player"

func _on_Spell_body_entered(body):
	if body.name != ORIGIN:
		splash()
		get_parent().get_node("Soundsystem").playSound("fire_shard")
		queue_free()

func set_charged(value):
	charged = value
	if charged:
		$spellFire/Particles2D.amount *= 50
