extends Area2D

var ELEMENT
var DAMAGE = 2
var life_timer = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	life_timer -= 1
	if life_timer <= 0:
		queue_free()
