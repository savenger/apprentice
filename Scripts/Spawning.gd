extends Particles2D

var enemy_type
const BORDER = 24
const MAX_PARTICLES = 1000
const MIN_PARTICLES = 100

const MIN_X = 64
const MAX_X = 1792
const MIN_Y = 128
const MAX_Y = 768

var spawn_areas = {
	global.ELEMENTS.Fire: [],
	global.ELEMENTS.Ice: [],
	global.ELEMENTS.Earth: [],
	global.ELEMENTS.Wind: []
}
var win_size = OS.get_window_size()
var enemy_ice = preload("res://Scenes/EnemyIce.tscn")
var enemy_fire = preload("res://Scenes/EnemyFire.tscn")
var enemy_earth = preload("res://Scenes/EnemyEarth.tscn")
var enemy_wind = preload("res://Scenes/EnemyWind.tscn")

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	global_position.x = rng.randi_range(MIN_X, MAX_X)
	global_position.y = rng.randi_range(MIN_Y, MAX_Y)

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
