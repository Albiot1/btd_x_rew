///@desc Initializes listener and falloff model
function audio_3d_init(){
	audio_listener_orientation(0,0,0,0,0,0)
	audio_falloff_set_model(audio_falloff_exponent_distance_clamped)
}


