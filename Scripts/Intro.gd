extends Node2D

func _on_BtnStart_pressed():
	get_parent().add_child(get_parent().game.instance())
	get_parent().ingame = true
	get_parent().get_node("Sound/AudioStreamPlayer_Full").stop()
	queue_free()
