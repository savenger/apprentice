extends AudioStreamPlayer


func duck(enabled):
	
	AudioServer.set_bus_effect_enabled(0, 0, enabled)
	
