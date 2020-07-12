extends Control

var paused = false



func pause():
	paused = true
	get_tree().paused = true
	get_node("CenterContainer_Pause").visible = true

func unpause():
	paused = false
	get_tree().paused = false
	
	get_node("CenterContainer_Pause").visible = false

var deathMessages = ["U Dead", "You have died", "Try again", "It was just a scratch!"]
	
func death():
	get_tree().paused = true
	get_node("ColorRect_Dead").visible = true
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomNumber = rng.randf_range(0, deathMessages.size())
	get_node("ColorRect_Dead/CenterContainer_DeathScreen/VBoxContainer/Label_Dead").text = deathMessages[randomNumber]

func _on_Button_Resume_pressed():
	unpause()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_node("Panel_Controls").visible:
			close_Controls()	
		elif !paused:
			pause()
		else:
			unpause()

func _on_Button_Suicide_pressed():
	death()

func updateHealth(newHealth):
	get_node("MarginContainer_HUD/VBoxContainer/HBoxContainer/HBoxContainer/VBoxContainer/ProgressBar_HP").value = newHealth

func updateMana(newMana):
	get_node("MarginContainer_HUD/VBoxContainer/HBoxContainer/HBoxContainer/VBoxContainer2/ProgressBar_Mana").value = newMana

func updateScore(newScore):
	get_node("MarginContainer_HUD/VBoxContainer/HBoxContainer/HBoxContainer/ReferenceRect/CenterContainer/HBoxContainer/Label_Score").text = str(newScore)

func updateActiveSpell(spell):
	get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer/IconCanvas").visible = false
	get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer2/IconCanvas").visible = false
	get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer3/IconCanvas").visible = false
	get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer4/IconCanvas").visible = false
	match spell:
		global.ELEMENTS.Fire:
			get_node("Skill Container/HBoxContainer2/HBoxContainer/Control/CenterContainer/VBoxContainer/PanelContainer/CenterContainer/TextureRect").texture = load("res://Assets/Graphics/Projectiles/fire_0.png")
			get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer/IconCanvas").visible = true
		global.ELEMENTS.Ice:
			get_node("Skill Container/HBoxContainer2/HBoxContainer/Control/CenterContainer/VBoxContainer/PanelContainer/CenterContainer/TextureRect").texture = load("res://Assets/Graphics/Projectiles/ice_0.png")
			get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer2/IconCanvas").visible = true
		global.ELEMENTS.Earth:
			get_node("Skill Container/HBoxContainer2/HBoxContainer/Control/CenterContainer/VBoxContainer/PanelContainer/CenterContainer/TextureRect").texture = load("res://Assets/Graphics/Projectiles/rock.png")
			get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer3/IconCanvas").visible = true
		global.ELEMENTS.Wind:
			get_node("Skill Container/HBoxContainer2/HBoxContainer/Control/CenterContainer/VBoxContainer/PanelContainer/CenterContainer/TextureRect").texture = load("res://Assets/Graphics/Projectiles/wind_0.png")
			get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer4/IconCanvas").visible = true

func _on_Button_Quit_pressed():
	get_tree().quit()





func _on_Button_Controls_pressed():
	get_node("Panel_Controls").visible = true
	
func close_Controls():
	get_node("Panel_Controls").visible = false	



func _on_Button_Menu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	unpause()
	get_tree().paused = false


func _on_Button_Retry_pressed():
	get_node("ColorRect_Dead").visible = true
	get_tree().reload_current_scene()
	unpause()
	get_tree().paused = false
