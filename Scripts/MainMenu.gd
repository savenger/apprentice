extends Control




func _on_TextureButton_Exit_pressed():
	get_tree().quit()


func _on_TextureButton_Credits_pressed():
	pass # Replace with function body.


func _on_TextureButton_NewGame_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_AudioStreamPlayer_finished():
	get_node("Node/AudioStreamPlayer_Full").play()


func _on_Timer_timeout():
	advanceSplashscreen()
	
var splashscreenIndex = 1
func advanceSplashscreen():
	for N in get_node("Splashscreens").get_children():
		if N == splashscreenIndex:
			N.visible = true
		else:
			N.visible = false
	
	splashscreenIndex += 1
	if splashscreenIndex <= get_node("Splashscreens").get_child_count():
		get_node("Timer").start()
