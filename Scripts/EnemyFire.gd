extends "res://Scripts/Enemy.gd"

func _init():
	SPEED = 50
	DAMAGE = 10
	TYPE = "ENEMY"
	ELEMENT = global.ELEMENTS.Fire

func _ready():
	pass
