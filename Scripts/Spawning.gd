extends Particles2D

var enemy_type
var origin
const BORDER = 24
const MAX_PARTICLES = 500
const MIN_PARTICLES = 200

const MIN_X = 256
const MAX_X = 1664
const MIN_Y = 256
const MAX_Y = 640
const spawn_range = 150

var win_size = OS.get_window_size()
var enemy_ice = preload("res://Scenes/EnemyIce.tscn")
var enemy_fire = preload("res://Scenes/EnemyFire.tscn")
var enemy_earth = preload("res://Scenes/EnemyEarth.tscn")
var enemy_wind = preload("res://Scenes/EnemyWind.tscn")

func _ready():
	var rng = RandomNumberGenerator.new()
	for area in $Hitbox.get_overlapping_areas():
		print(area)
	rng.randomize()
	var upper_x = origin.global_position.x + spawn_range
	var lower_x = origin.global_position.x - spawn_range
	var upper_y = origin.global_position.y + spawn_range
	var lower_y = origin.global_position.y - spawn_range
	global_position.x = rng.randi_range(max(lower_x, MIN_X), min(upper_x, MAX_X))
	global_position.y = rng.randi_range(max(lower_y, MIN_Y), min(upper_y, MAX_Y))

func _process(delta):
	# more particles every second (max 5 seconds) (from 100 to 1000)
	amount = MIN_PARTICLES + ((MAX_PARTICLES - MIN_PARTICLES) * $Timer.wait_time / $Timer.time_left)

func _on_Timer_timeout():
	var enemy
	if enemy_type == global.ELEMENTS.Fire:
		enemy = enemy_fire.instance()
	elif enemy_type == global.ELEMENTS.Ice:
		enemy = enemy_ice.instance()
	elif enemy_type == global.ELEMENTS.Earth:
		enemy = enemy_earth.instance()
	elif enemy_type == global.ELEMENTS.Wind:
		enemy = enemy_wind.instance()
	enemy.position = global_position
	get_parent().add_child(enemy)
	queue_free()
