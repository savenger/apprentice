extends Control

var state 


func _on_TextureButton_Exit_pressed():
	get_tree().quit()


func _on_TextureButton_Credits_pressed():
	get_node("TeamMembers").visible = true


func _on_TextureButton_NewGame_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_AudioStreamPlayer_finished():
	get_node("Sound/AudioStreamPlayer_Full").play()


func _on_Timer_timeout():
	get_node("PreSplashScreen").visible = false
	advanceSplashscreen()
	
var splashscreenIndex = 0
func advanceSplashscreen():
	var i = 0
	for N in get_node("Splashscreens").get_children():
		if i == splashscreenIndex:
			print(N.name)
			N.visible = true
		else:
			N.visible = false
		i += 1
	
	splashscreenIndex += 1
	if splashscreenIndex <= get_node("Splashscreens").get_child_count():
		get_node("Timer").start()
	else:
		get_node("Splashscreens").visible = false


func _on_TextureButton_CreditsBack_pressed():
		get_node("TeamMembers").visible = false
