if collision_circle(mouse_x,mouse_y,12,self,false,false){
    if mouse_on == false{
        mouse_on = true
        
        audio_play_sound(snd_blimp_hit,0,0,1,0,random_range(0.9,1.1))
        life--
        image_speed = 0
        
        switch (life) {
            case 2:
                image_index = 9
            break;
            case 1:
                image_index = 10
            break;
            case 0:
                instance_create_depth(x,y,depth-1,obj_fake_pop)
                audio_play_sound(snd_blimp_destroyed,0,0,1,0,random_range(0.9,1.1))
                instance_destroy()
                
            break;
        }
        
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

if life==3{
    if image_index > 8
        image_index = 0
}
