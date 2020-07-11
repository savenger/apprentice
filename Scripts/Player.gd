extends "res://Scripts/Entity.gd"

func _init():
	MAX_HEALTH = 100
	health = MAX_HEALTH
	SPEED = 200
	TYPE = "PLAYER"

var dir : Vector2 = Vector2()

var spell = preload("res://Scenes/Spell.tscn")

func attack_loop():
	if Input.is_action_just_pressed("spell"):
		var spell_instance = spell.instance()
		get_node("Origin").rotation = get_angle_to(get_global_mouse_position())
		spell_instance.position = get_node("Origin/Aim").get_global_position()
		get_parent().add_child(spell_instance)

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
