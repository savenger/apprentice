extends Area2D

var ELEMENT
var DAMAGE = 1
var life_timer = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	match ELEMENT:
		global.ELEMENTS.Ice:
			get_node("Node/Particles_Ice").visible = true
		global.ELEMENTS.Fire:
			get_node("Node/Particles_Fire").visible = true
		global.ELEMENTS.Earth:
			get_node("Node/Particles2D_Earth").visible = true
		global.ELEMENTS.Wind:
			get_node("Node/Particles2D_Wind").visible = true 
			

func _process(delta):
	life_timer -= 1
	if life_timer <= 0:
		queue_free()
