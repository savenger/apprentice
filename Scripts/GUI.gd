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
	get_node("MarginContainer_HUD/VBoxContainer/CenterContainer/HBoxContainer/Label_Score").text = newScore
