extends "res://Scripts/Entity.gd"

var move_timer_length = 15
var move_timer = 0

var ELEMENT

var spell = preload("res://Scenes/EnemySpell.tscn")

func _init():
	MAX_HEALTH = 40
	health = MAX_HEALTH

func attack_loop():
	if randi() % 100 == 1:
		var spell_instance = spell.instance()
		var player = get_node("../Player")
		get_node("Origin").rotation = get_angle_to(player.global_position)
		spell_instance.position = get_node("Origin/Aim").get_global_position()
		get_parent().add_child(spell_instance)

func _physics_process(delta):
	movement_loop()
	sprite_dir_loop()
	damage_loop()
	attack_loop()
	if move_timer > 0:
		move_timer -= 1
	if move_timer == 0:
		# move towards player
		var player = get_node("../Player")
		if player:
			move_dir = -1 * (global_position - player.global_position)
		# TODO: animation
		"""
		if move_dir != Vector2(0, 0):
			anim_switch("walk")
		else:
			anim_switch("idle")
		"""
		anim_switch("walk")
		move_timer = move_timer_length
