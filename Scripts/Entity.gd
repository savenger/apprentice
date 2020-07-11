extends KinematicBody2D

var MAX_HEALTH
var SPEED
var TYPE
var DAMAGE
var health

var move_dir = Vector2(0, 0)
var knock_dir = Vector2(0, 0)
var sprite_dir = "down"

var hit_stun = 0
var texture_default = null
var texture_hurt = null

func _ready():
	if TYPE == "ENEMY":
		set_collision_mask_bit(1, 1)
		set_physics_process(false)
		texture_default = $Sprite.texture
	# texture_hurt = load($Sprite.texture.get_path().replace(".png", "_hurt.png"))

func movement_loop():
	if TYPE == "PLAYER":
		move_and_slide(move_dir.normalized() * SPEED)
	elif TYPE == "ENEMY":
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
		#$Sprite.texture = texture_hurt
	else:
		#$Sprite.texture = texture_default
		if health <= 0:
			if TYPE == "PLAYER":
				#game_over
				print("game over")
				get_tree().reload_current_scene()
			elif TYPE == "ENEMY":
				get_parent().score += 1
				get_parent().get_node("GUI").updateScore(get_parent().score)
				var drop = randi() % 3
				if drop == 0:
					instance_scene(preload("res://Scenes/Potion.tscn"))
				# instance_scene(preload("res://Scenes/EnemyDeath.tscn"))
				queue_free()
	for area in $Hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if hit_stun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			var multiplier = 1
			if TYPE != "PLAYER":
				if body.get("ELEMENT") == elements.COUNTER_ELEMENTS[get("ELEMENT")]:
					multiplier = 2
				elif body.get("ELEMENT") == get("ELEMENT"):
					multiplier = -1
			else:
				if body.name == "Spell":
					pass
			update_health(health - multiplier * body.get("DAMAGE"))
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

func update_health(value):
	health = clamp(value, 0, MAX_HEALTH)
	if TYPE == "PLAYER":
		get_parent().get_node("GUI").updateHealth( 100 * health / MAX_HEALTH)
	elif TYPE == "ENEMY":
		get_node("HealthBar").value = 100 * health / MAX_HEALTH
