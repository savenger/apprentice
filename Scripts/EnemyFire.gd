extends "res://Scripts/Entity.gd"

var move_timer_length = 15
var move_timer = 0

func _init():
	SPEED = 40
	DAMAGE = 15

func _ready():
	move_dir = dir.rand()

func _physics_process(delta):
	movement_loop()
	sprite_dir_loop()
	damage_loop()
	if move_timer > 0:
		move_timer -= 1
	if move_timer == 0:
		move_dir = dir.rand()
		"""
		if move_dir != Vector2(0, 0):
			anim_switch("walk")
		else:
			anim_switch("idle")
		"""
		move_timer = move_timer_length
