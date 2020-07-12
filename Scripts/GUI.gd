extends Control

var paused = false;

func pause():
	paused = true
	get_node("CenterContainer_Pause").visible = true

func unpause():
	paused = false
	
	get_node("CenterContainer_Pause").visible = false
	
func death():
	get_node("ColorRect_Dead").visible = true

func _on_Button_Resume_pressed():
	unpause()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if !paused:
			pause()
		else:
			unpause()

func _on_Button_Suicide_pressed():
	death()

func updateHealth(newHealth):
	get_node("MarginContainer_HUD/VBoxContainer/HBoxContainer/ProgressBar_HP").value = newHealth

func updateMana(newMana):
	get_node("MarginContainer_HUD/VBoxContainer/HBoxContainer/ProgressBar_Mana").value = newMana

func updateScore(newScore):
	get_node("MarginContainer_HUD/VBoxContainer/CenterContainer/HBoxContainer/Label_Score").text = str(newScore)

func updateActiveSpell(spell):
	get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer/IconCanvas").visible = false
	get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer2/IconCanvas").visible = false
	get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer3/IconCanvas").visible = false
	get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer4/IconCanvas").visible = false
	match spell:
		elements.Fire:
			get_node("Skill Container/HBoxContainer2/HBoxContainer/Control/CenterContainer/VBoxContainer/PanelContainer/CenterContainer/TextureRect").texture = load("res://Assets/Graphics/Projectiles/fire_0.png")
			get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer/IconCanvas").visible = true
		elements.Ice:
			get_node("Skill Container/HBoxContainer2/HBoxContainer/Control/CenterContainer/VBoxContainer/PanelContainer/CenterContainer/TextureRect").texture = load("res://Assets/Graphics/Projectiles/ice_0.png")
			get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer2/IconCanvas").visible = true
		elements.Earth:
			get_node("Skill Container/HBoxContainer2/HBoxContainer/Control/CenterContainer/VBoxContainer/PanelContainer/CenterContainer/TextureRect").texture = load("res://Assets/Graphics/Projectiles/rock.png")
			get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer3/IconCanvas").visible = true
		elements.Wind:
			get_node("Skill Container/HBoxContainer2/HBoxContainer/Control/CenterContainer/VBoxContainer/PanelContainer/CenterContainer/TextureRect").texture = load("res://Assets/Graphics/Projectiles/wind_0.png")
			get_node("Skill Container/HBoxContainer2/HBoxContainer/CenterContainer4/IconCanvas").visible = true

func _on_Button_Quit_pressed():
	get_tree().quit()
