function draw_slider(id_,spr_bot,spr_top,max_val,x_,y_,mx_,my_,default_=1){
	
	if !variable_instance_exists(id,"slider"){
	slider={}
	slider[$ id_]={pos:default_,grab:false}
	}
	else if !variable_struct_exists(slider,id_){
	slider[$ id_]={pos:default_,grab:false}
	}
	
	var slider_w=sprite_get_width(spr_bot)
	var slider_h=sprite_get_height(spr_bot)
	var grab_w=sprite_get_width(spr_top)
	var grab_h=sprite_get_height(spr_top)
	var c_pos=slider[$ id_].pos
	var c_grab=slider[$ id_].grab
	
	draw_sprite(spr_bot,0,x_,y_)
	
	var grab_x=x_+grab_w/2+(slider_w-grab_w)*c_pos
	var grab_y=y_
	
	draw_sprite(spr_top,0,grab_x,grab_y)
	
	if c_grab==false{
		if (point_in_rectangle(mx_,my_,grab_x-grab_w/2,grab_y-grab_h/2,grab_x+grab_w/2,grab_y+grab_h/2) or point_in_rectangle(mx_,my_,x_,y_-slider_h/2,x_+slider_w,y_+slider_h/2)) and mouse_check_button_pressed(mb_left){
			slider[$ id_].grab=true
		}
	}
	if c_grab==true{
	slider[$ id_].pos=median( 0,1, (mx_-x_-grab_w/2)/(slider_w-grab_w) )
	show_debug_message(slider[$ id_].pos)
	
	if !mouse_check_button(mb_left)
	slider[$ id_].grab=false
	
	return slider[$ id_].pos
	}

}