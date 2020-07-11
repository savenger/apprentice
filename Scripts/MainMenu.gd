extends Control




func _on_TextureButton_Exit_pressed():
	get_tree().quit()


func _on_TextureButton_Credits_pressed():
	pass # Replace with function body.


func _on_TextureButton_NewGame_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_AudioStreamPlayer_finished():
	get_node("Node/AudioStreamPlayer_Full").play()


