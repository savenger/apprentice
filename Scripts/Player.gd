extends "res://Scripts/Entity.gd"

func _init():
	MAX_HEALTH = 100
	health = MAX_HEALTH
	SPEED = 300
	TYPE = "PLAYER"

var spell = preload("res://Scenes/Spell.tscn")
var MAX_ENERGY = 100.0
var energy = MAX_ENERGY
var attack_cost = 20

func attack_loop():
	var v = energy
	if energy < MAX_ENERGY:
		v += 0.5
	if Input.is_action_just_pressed("spell") && energy - attack_cost > 0:
		v -= attack_cost
		var spell_instance = spell.instance()
		get_node("Origin").rotation = get_angle_to(get_global_mouse_position())
		spell_instance.position = get_node("Origin/Aim").get_global_position()
		get_parent().add_child(spell_instance)
	update_energy(v)

func update_energy(value):
	energy = clamp(value, 0, MAX_ENERGY)
	get_parent().get_node("GUI").updateMana(energy)

func _physics_process(delta):
	move_dir.x = 0
	move_dir.y = 0
	if Input.is_action_pressed("move_up"):
		move_dir.y -= 1
	if Input.is_action_pressed("move_down"):
		move_dir.y += 1
	if Input.is_action_pressed("move_left"):
		move_dir.x -= 1
	if Input.is_action_pressed("move_right"):
		move_dir.x += 1
	move_dir = move_dir.normalized() * SPEED
	movement_loop()
	attack_loop()
	damage_loop()
