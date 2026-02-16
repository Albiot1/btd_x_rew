if collision_circle(mouse_x,mouse_y,12,self,false,false){
    if mouse_on == false{
        mouse_on = true
        
        if image_index>0
            image_index--
        else
            instance_destroy()
        
        audio_play_sound(snd_popping,0,0,1,0,random_range(0.9,1.1))
        instance_create_depth(x,y,depth-1,obj_fake_pop)
        type --
    }
}
else {
	mouse_on = false
}

if inside_room == false{
    if point_in_rectangle(x,y,0,0,room_width,room_height){
        inside_room = true
    }
}