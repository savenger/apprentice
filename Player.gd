extends KinematicBody2D

var speed = 200

var dir : Vector2 = Vector2()

func _process(delta):
	dir.x = 0
	dir.y = 0
	
	if Input.is_action_pressed("move_up"):
		dir.y -= speed
	if Input.is_action_pressed("move_down"):
		dir.y += speed
	if Input.is_action_pressed("move_left"):
		dir.x -= speed
	if Input.is_action_pressed("move_right"):
		dir.x += speed
	
	dir = move_and_slide(dir)
