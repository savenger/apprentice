extends Node2D

const BORDER = 24
var MAX_ENEMIES = 4
var score = 0

var enemy_ice = preload("res://Scenes/EnemyIce.tscn")
var enemy_fire = preload("res://Scenes/EnemyFire.tscn")
var enemy_earth = preload("res://Scenes/EnemyEarth.tscn")
var enemy_wind = preload("res://Scenes/EnemyWind.tscn")

func _process(delta):
	var supported_monsters = 0
	var enemies = 0
	var win_size = OS.get_window_size()
	for node in get_children():
		if node.name.find("Enemy") == 0 or node.name.find("Enemy") == 1 and node.name.find("Tile") == -1 and node.name.find("Spell") == -1:
			enemies += 1
		elif node.name.find("Portal") >= 0:
			print("ROFL")
			print(node.get("supported_monsters"))
			supported_monsters += node.get("supported_monsters")
	print(supported_monsters)
	if enemies < min(supported_monsters, MAX_ENEMIES):
		var enemy
		var enemy_type = randi() % 4
		if enemy_type == elements.Fire:
			enemy = enemy_fire.instance()
		elif enemy_type == elements.Ice:
			enemy = enemy_ice.instance()
		elif enemy_type == elements.Earth:
			enemy = enemy_earth.instance()
		elif enemy_type == elements.Wind:
			enemy = enemy_wind.instance()
		enemy.position.x = rand_range(BORDER, win_size.x - BORDER)
		enemy.position.y = rand_range(BORDER, win_size.y - BORDER)
		add_child(enemy)
		enemies += 1
