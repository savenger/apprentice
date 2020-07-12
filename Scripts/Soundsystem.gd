extends AudioStreamPlayer


func duck(enabled):
	
	AudioServer.set_bus_effect_enabled(0, 0, enabled)
	
func playSound(sound):
	match sound:
		"ice_impact":
			get_node("ASP_ShardImpact").pitch_scale = rand_range(0.7, 2)
			get_node("ASP_ShardImpact").play()
		"fire_impact":
			get_node("ASP_FireImpact").pitch_scale = rand_range(0.7, 2)
			get_node("ASP_FireImpact").play()
		"earth_impact":
			get_node("ASP_EarthImpact").pitch_scale = rand_range(0.7, 2)
			get_node("ASP_EarthImpact").play()
		"wind_impact":
			get_node("ASP_WindImpact").pitch_scale = rand_range(0.7, 2)
			get_node("ASP_WindImpact").play()
