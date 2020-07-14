extends Control

var state
var ingame = false
var highscore = 0

var intro = preload("res://Scenes/Intro.tscn")
var game = preload("res://Scenes/Main.tscn")

func _init():
	load_highscore()

func _on_TextureButton_Exit_pressed():
	print("exit")
	get_tree().queue_delete(get_tree())
	get_tree().quit()

func _on_TextureButton_Credits_pressed():
	get_node("TeamMembers").visible = true

func _on_TextureButton_NewGame_pressed():
	add_child(intro.instance())

func _on_AudioStreamPlayer_finished():
	if !ingame:
		get_node("Sound/AudioStreamPlayer_Full").play()

func _on_Timer_timeout():
	get_node("PreSplashScreen").visible = false
	advanceSplashscreen()

var splashscreenIndex = 0
func advanceSplashscreen():
	var i = 0
	for N in get_node("Splashscreens").get_children():
		N.visible = i == splashscreenIndex
		i += 1
	splashscreenIndex += 1
	if splashscreenIndex <= get_node("Splashscreens").get_child_count():
		get_node("Timer").start()
	else:
		get_node("PreSplashScreen").queue_free()
		get_node("Splashscreens").queue_free()
		get_node("Timer").queue_free()

func _on_TextureButton_CreditsBack_pressed():
		get_node("TeamMembers").visible = false

func update_highscore(score):
	highscore = max(score, highscore)
	save_highscore()

func _on_TextureButton_Scores_pressed():
	get_node("HighscoreScreen/CenterContainer_Highscore/VBoxContainer/Label_Highscore").text = str("Highscore: ", highscore)
	get_node("HBoxContainer/CenterContainer/VBoxContainer").visible = false
	get_node("HighscoreScreen").visible = true

# load and save highscore
var path = "res://game-data.cfg"
var config = ConfigFile.new()
var load_response = config.load(path)

func load_highscore():
	highscore = config.get_value("Values", "highscore", highscore)

func save_highscore():
	config.set_value("Values", "highscore", highscore)
	config.save(path)
