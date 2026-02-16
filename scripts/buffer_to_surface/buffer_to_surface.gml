///@desc Sets data from buffer to a surface
///@arg {Id.Buffer}
///@arg {Id.Surface}
///@arg {Real} Surface_width
///@arg {Real} Surface_height
function buffer_to_surface(buff,surf,s_w,s_h){

if !surface_exists(surf){
	surf=surface_create(s_w,s_h)	
}

buffer_set_surface(buff,surf,0)
	
}
