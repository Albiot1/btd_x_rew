///@desc Save's the surface to a buffer (don't forget to destroy the buffer afterwards)
///@arg {Id.Surface}
///@return {Id.buffer} Buffer
function surface_to_buffer(surf){
	
	if surface_exists(surf){
	
	var w_=surface_get_width(surf)
	var h_=surface_get_height(surf)
	
	var buff_=buffer_create( w_ * h_ * 4, buffer_fixed, 1 )
	buffer_get_surface(buff_,surf,0)
	
	return buff_
	
	}
	else{
	return -1	
	}
	
}