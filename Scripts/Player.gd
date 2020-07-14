extends "res://Scripts/Entity.gd"

func _init():
	MAX_HEALTH = 100
	health = MAX_HEALTH
	SPEED = 500
	TYPE = "PLAYER"
	next_attack = global.ELEMENTS.Fire

var MAX_ENERGY = 100.0
var energy = MAX_ENERGY
var attack_cost = 20
var next_attack
var shot_power : int = 0
var load_attack = false
var just_attacked = true

var spr_player_front = preload("res://Assets/Graphics/Lehrling(Proto).png")
var spr_player_right = preload("res://Assets/Graphics/Lehrling(rightside).png")
var spr_player_back = preload("res://Assets/Graphics/Lehrling(Back).png")
var spr_player_attack = preload("res://Assets/Graphics/Lehrling(Attack).png")
var spell_fire = preload("res://Scenes/SpellFire.tscn")
var spell_earth = preload("res://Scenes/SpellEarth.tscn")
var spell_ice = preload("res://Scenes/SpellIce.tscn")
var spell_wind = preload("res://Scenes/SpellWind.tscn")

func attack_loop():
	var rotation = get_angle_to(get_global_mouse_position())
	get_node("Origin").rotation = rotation
	if Input.is_action_just_pressed("spell"):
		shot_power = 0
		load_attack = true
		just_attacked = false
		if (randi() % 14 < 1):
			next_attack = randi() % 4
		if next_attack == global.ELEMENTS.Fire:
			get_node("Origin/SpellSprite").texture = spell_fire.instance().get_node("spellFire").texture
		elif next_attack == global.ELEMENTS.Ice:
			get_node("Origin/SpellSprite").texture = spell_ice.instance().get_node("spellIce").texture
		elif next_attack == global.ELEMENTS.Earth:
			get_node("Origin/SpellSprite").texture = spell_earth.instance().get_node("spellEarth").texture
		elif next_attack == global.ELEMENTS.Wind:
			get_node("Origin/SpellSprite").texture = spell_wind.instance().get_node("spellWind").texture
		get_node("Origin/SpellSprite").visible = true
	if Input.is_action_pressed("spell") and !just_attacked:
		shot_power += 8
		update_energy(energy - 2)
	else:
		if energy < MAX_ENERGY:
			update_energy(energy + 0.4)
	if (Input.is_action_just_released("spell") or energy <= 0) and !just_attacked:
		get_node("Origin/SpellSprite").visible = false
		var spell
		if next_attack == global.ELEMENTS.Fire:
			spell = spell_fire.instance()
		elif next_attack == global.ELEMENTS.Ice:
			spell = spell_ice.instance()
		elif next_attack == global.ELEMENTS.Earth:
			spell = spell_earth.instance()
		elif next_attack == global.ELEMENTS.Wind:
			spell = spell_wind.instance()
		spell.position = get_node("Origin/Aim").get_global_position()
		spell.rotation = rotation
		spell.SPEED = shot_power * 8
		spell.DAMAGE = shot_power / 6
		spell.ORIGIN = "Player"
		get_parent().add_child(spell)
		load_attack = false
		just_attacked = true

func select_spell_loop():
	if (!load_attack):
		if Input.is_action_just_pressed("use_spell_1"):
			next_attack = global.ELEMENTS.Fire
		elif Input.is_action_just_pressed("use_spell_2"):
			next_attack = global.ELEMENTS.Ice
		elif Input.is_action_just_pressed("use_spell_3"):
			next_attack = global.ELEMENTS.Earth
		elif Input.is_action_just_pressed("use_spell_4"):
			next_attack = global.ELEMENTS.Wind
		elif Input.is_action_just_released("next_spell"):
			next_attack = (next_attack + 1) % 4
		elif Input.is_action_just_released("previous_spell"):
			next_attack = (next_attack + 3) % 4

func update_energy(value):
	energy = clamp(value, 0, MAX_ENERGY)
	get_parent().get_node("GUI").updateMana(energy)

func _physics_process(delta):
	move_dir.x = 0
	move_dir.y = 0
	if Input.is_action_pressed("move_up"):
		move_dir.y -= 5
	if Input.is_action_pressed("move_down"):
		move_dir.y += 5
	if Input.is_action_pressed("move_left"):
		move_dir.x -= 5
	if Input.is_action_pressed("move_right"):
		move_dir.x += 5
	move_dir = move_dir.normalized() * SPEED
	movement_loop()
	sprite_dir_loop()
	anim_switch("walk")
	var attack = next_attack
	select_spell_loop()
	attack_loop()
	if (attack != next_attack):
		get_parent().get_node("GUI").updateActiveSpell(next_attack)
	damage_loop()
