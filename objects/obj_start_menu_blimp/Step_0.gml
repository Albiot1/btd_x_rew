if mouse_on>0
    mouse_on--

if inside_room == false{
    if point_in_rectangle(x,y,0,0,room_width,room_height){
        inside_room = true
    }
}

if life>7{
    if image_index > 8
        image_index = 0
}
else {
    if image_speed>0{
        image_speed = 0
    }
    
	if life>4{
        image_index = 9
    }
    else {
    	image_index = 10
    }
}
