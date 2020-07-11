extends Node2D

const BORDER = 24
var MAX_ENEMIES = 3

var enemy_class = preload("res://Scenes/EnemyFire.tscn")

func _process(delta):
	var enemies = 0
	var win_size = OS.get_window_size()
	for node in get_children():
		if node.name.find("Enemy") == 0 or node.name.find("Enemy") == 1 and node.name.find("Tile") == -1 and node.name.find("Spell") == -1:
			enemies += 1
	if enemies < MAX_ENEMIES:
		var enemy = enemy_class.instance()
		enemy.position.x = rand_range(BORDER, win_size.x - BORDER)
		enemy.position.y = rand_range(BORDER, win_size.y - BORDER)
		add_child(enemy)
		enemies += 1
