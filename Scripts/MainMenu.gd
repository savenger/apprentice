extends MarginContainer




func _on_TextureButton_Exit_pressed():
	get_tree().quit()


func _on_TextureButton_Credits_pressed():
	pass # Replace with function body.


func _on_TextureButton_NewGame_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
