extends "res://Scripts/Entity.gd"

var move_timer_length = 15
var move_timer = 0

var ELEMENT

var charged

var spell_fire = preload("res://Scenes/SpellFire.tscn")
var spell_ice = preload("res://Scenes/SpellIce.tscn")
var spell_earth = preload("res://Scenes/SpellEarth.tscn")
var spell_wind = preload("res://Scenes/SpellWind.tscn")

func _init():
	# determines if player has hit this enemy with the enemy's element
	charged = false
	MAX_HEALTH = 40
	health = MAX_HEALTH

func attack_loop():
	if randi() % (300) == 1:
		var spell_instance
		var el = "Fire"
		match ELEMENT:
			global.ELEMENTS.Fire:
				el = "Fire"
				spell_instance = spell_fire.instance()
			global.ELEMENTS.Ice:
				el = "Ice"
				spell_instance = spell_ice.instance()
			global.ELEMENTS.Earth:
				el = "Earth"
				spell_instance = spell_earth.instance()
			global.ELEMENTS.Wind:
				el = "Wind"
				spell_instance = spell_wind.instance()
		spell_instance.ORIGIN = "Enemy"
		if charged:
			spell_instance.DAMAGE *= 2
			spell_instance.set_charged(true)
			charged = false
		print(spell_instance.DAMAGE)
		var player = get_node("../Player")
		var r = get_angle_to(player.global_position)
		get_node("Origin").rotation = r
		spell_instance.position = get_node("Origin/Aim").get_global_position()
		spell_instance.rotation = r
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
