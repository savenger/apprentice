extends Area2D

var ELEMENT
var DAMAGE = 1
var life_timer = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("get_ready")

func get_ready():
	match ELEMENT:
		global.ELEMENTS.Ice:
			get_node("Node/Particles_Ice").emitting = true
			get_node("Node/Particles_Ice/Particles2D3_IceWind").emitting = true
		global.ELEMENTS.Fire:
			get_node("Node/Particles_Fire").emitting = true
		global.ELEMENTS.Earth:
			get_node("Node/Particles2D_Earth").emitting = true
			get_node("Node/Particles2D_Earth/Particles2D3_IceWind2").emitting = true
		global.ELEMENTS.Wind:
			get_node("Node/Particles2D_Wind").emitting = true 
			get_node("Node/Particles2D_Wind/Particles2D").emitting = true

func _process(delta):
	life_timer -= 1
	if life_timer <= 0:
		queue_free()
