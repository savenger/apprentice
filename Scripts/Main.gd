extends Node2D

var MAX_ENEMIES = 4
var score = 0

var spawning = preload("res://Scenes/Spawning.tscn")

func _process(delta):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var monster_portals = {}
	var supported_monsters = []
	var enemies = 0
	for node in get_children():
		if node.name.find("Spawning") >= 0 or node.name.find("Enemy") == 0 or node.name.find("Enemy") == 1 and node.name.find("Tile") == -1 and node.name.find("Spell") == -1:
			enemies += 1
		elif node.name.find("Portal") >= 0:
			monster_portals[node.get("ELEMENT")] = node
			supported_monsters.append(node.get("ELEMENT"))
	if enemies < MAX_ENEMIES:
		var spawn = spawning.instance()
		spawn.enemy_type = supported_monsters[rng.randi() % len(supported_monsters)]
		spawn.origin = monster_portals[spawn.enemy_type]
		add_child(spawn)
		enemies += 1
