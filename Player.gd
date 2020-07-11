extends KinematicBody2D

signal health_updated()
signal killed()

export var max_hp = 100
onready var hp = max_hp

var speed = 200
var dir : Vector2 = Vector2()

var spell = preload("res://Spell.tscn")

func _process(delta):
	attack()

func _physics_process(delta):
	movement()

func movement():
	dir.x = 0
	dir.y = 0
	
	if Input.is_action_pressed("move_up"):
		dir.y -= speed
	if Input.is_action_pressed("move_down"):
		dir.y += speed
	if Input.is_action_pressed("move_left"):
		dir.x -= speed
	if Input.is_action_pressed("move_right"):
		dir.x += speed
	
	dir = move_and_slide(dir)

func attack():
	if Input.is_action_just_pressed("spell"):
		var spell_instance = spell.instance()
		get_node("turnAxis").rotation = get_angle_to(get_global_mouse_position())
		spell_instance.position = get_node("turnAxis/viewDir").get_global_position()
		get_parent().add_child(spell_instance)

func damage(amount):
	set_health(hp - amount)
	print(str(hp) + " hp left") #debug

func set_health(value):
	var prev_hp = hp
	hp = clamp(value, 0, max_hp)
	if hp != prev_hp:
		emit_signal("health_updated", hp)
		if hp == 0:
			emit_signal("killed")
