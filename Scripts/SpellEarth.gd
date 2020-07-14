extends "res://Scripts/Spell.gd"

var charged = false setget set_charged
var sound = preload("res://Assets/Sounds/SFX/ASP_EarthImpact.tscn")

func _init():
	SPEED = 800
	ELEMENT = global.ELEMENTS.Earth
	ORIGIN = "Player"

func _on_Spell_body_entered(body):
	if body.name != ORIGIN:
		call_deferred("splash")
		var node = sound.instance()
		node.position = position
		node.pitch_scale = rand_range(0.7, 2)
		get_parent().add_child(node)
		queue_free()

func set_charged(value):
	charged = value
	if charged:
		$spellEarth/Particles2D.amount *= 50
