extends Node2D

var MAX_ENEMIES = 4
var score = 0

var spawning = preload("res://Scenes/Spawning.tscn")

func _process(delta):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var supported_monsters = 0
	var enemies = 0
	for node in get_children():
		if node.name.find("Spawning") >= 0 or node.name.find("Enemy") == 0 or node.name.find("Enemy") == 1 and node.name.find("Tile") == -1 and node.name.find("Spell") == -1:
			enemies += 1
		elif node.name.find("Portal") >= 0:
			supported_monsters += node.get("supported_monsters")
	if enemies < min(supported_monsters, MAX_ENEMIES):
		var spawn = spawning.instance()
		spawn.enemy_type = rng.randi() % 4
		add_child(spawn)
		enemies += 1
