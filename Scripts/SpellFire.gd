extends "res://Scripts/Spell.gd"

var charged = false setget set_charged

func _init():
	SPEED = 800
	ELEMENT = global.ELEMENTS.Fire
	ORIGIN = "Player"

func _on_Spell_body_entered(body):
	if body.name != ORIGIN:
		splash()
		var sound = load("res://Assets/Sounds/SFX/ASP_FireImpact.tscn")
		var node = sound.instance()
		node.position = position
		node.pitch_scale = rand_range(0.7, 2)
		get_parent().add_child(node)
		
		queue_free()

func set_charged(value):
	charged = value
	if charged:
		$spellFire/Particles2D.amount *= 50
