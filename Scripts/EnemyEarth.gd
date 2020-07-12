extends "res://Scripts/Enemy.gd"

func _init():
	SPEED = 30
	DAMAGE = 15
	TYPE = "ENEMY"
	ELEMENT = global.ELEMENTS.Earth

func _ready():
	pass
