extends "res://Scripts/Enemy.gd"

func _init():
	SPEED = 60
	DAMAGE = 8
	TYPE = "ENEMY"
	ELEMENT = global.ELEMENTS.Wind

func _ready():
	pass
