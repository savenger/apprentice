extends ColorRect

func _on_Button_Back_pressed():
	visible = false
	get_parent().get_node("HBoxContainer/CenterContainer/VBoxContainer").visible = true
