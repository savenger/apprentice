extends KinematicBody2D

var MAX_HEALTH = 100
var SPEED
var TYPE = "ENEMY"
var DAMAGE

var move_dir = Vector2(0, 0)
var knock_dir = Vector2(0, 0)
var sprite_dir = "down"

var hit_stun = 0
var texture_default = null
var texture_hurt = null
var health = MAX_HEALTH

func _ready():
	if TYPE == "ENEMY":
		set_collision_mask_bit(1, 1)
		set_physics_process(false)
	texture_default = $Sprite.texture
	# texture_hurt = load($Sprite.texture.get_path().replace(".png", "_hurt.png"))

func movement_loop():
	var motion
	if hit_stun == 0:
		motion = move_dir.normalized() * SPEED
	else:
		motion = knock_dir.normalized() * 125
	move_and_slide(motion, Vector2(0, 0))

func sprite_dir_loop():
	match move_dir:
		dir.left:
			sprite_dir = "left"
		dir.right:
			sprite_dir = "right"
		dir.up:
			sprite_dir = "up"
		dir.down:
			sprite_dir = "down"

func anim_switch(animation):
	var new_anim = str(animation, sprite_dir)
	if $AnimationPlayer.current_animation != new_anim:
		$AnimationPlayer.play(new_anim)

func damage_loop():
	health = min(MAX_HEALTH, health)
	if hit_stun > 0:
		hit_stun -= 1
		$Sprite.texture = texture_hurt
	else:
		$Sprite.texture = texture_default
		if TYPE == "ENEMY" && health <= 0:
			var drop = randi() % 3
			if drop == 0:
				instance_scene(preload("res://Scenes/Potion.tscn"))
			# instance_scene(preload("res://Scenes/EnemyDeath.tscn"))
			queue_free()
	for area in $hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if hit_stun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			health -= body.get("DAMAGE")
			hit_stun = 10
			knock_dir = global_transform.origin - body.global_transform.origin

func use_item(item):
	var new_item = item.instance()
	new_item.add_to_group(str(new_item.get_name(), self))
	add_child(new_item)
	if get_tree().get_nodes_in_group(str(new_item.get_name(), self)).size() > new_item.max_amount:
		new_item.queue_free()

func instance_scene(scene):
	var new_scene = scene.instance()
	new_scene.global_position = global_position
	get_parent().add_child(new_scene)
