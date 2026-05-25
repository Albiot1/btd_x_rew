timer += 0.01
flash_pos += 0.85
if timer>pi*2{
    timer-=pi*2
}
if flash_pos>=140{
    flash_pos-=140+irandom_range(60,180)
}

if pressed_any_key == false{
    if keyboard_check_pressed(vk_anykey){
        pressed_any_key = true
        instance_destroy(obj_attack_trail)
        if global.settings.instant_start_transition == true{
            room_goto(rm_main_menu)
        }
    }
}
else {
    
    cam_anim_pos+=0.025
    
    camy = 976 - 676 * animcurve_channel_evaluate(cam_anim,cam_anim_pos)
    
    camera_set_view_pos(view_camera[0],0,camy)
    
    if cam_anim_pos>=1{
        room_goto(rm_main_menu)
    }
}

if bloon_spawn_cooldown>0{
    bloon_spawn_cooldown--
}
else {
	bloon_spawn_cooldown = 14 + irandom(30)
    instance_create_depth(-100 + random(1224),1640,depth,obj_start_menu_bloon)
}

if blimp_spawn_cooldown>0{
    blimp_spawn_cooldown--
}
else {
	blimp_spawn_cooldown = 240 + random(960)
    instance_create_depth(-100,0+random(1400),depth,obj_start_menu_blimp)
}

if pressed_any_key == true
    exit;

mouse_dist = point_distance(mouse_x,mouse_y,mouse_prev_x,mouse_prev_y)

if mouse_dist>8{
    ds_list_clear(collisions_list)
    var _num = collision_line_list(mouse_x,mouse_y,mouse_prev_x,mouse_prev_y,obj_start_menu_bloon,false,true,collisions_list,true)
    
    for (var i = 0; i < _num; i++) {
    	var _id = collisions_list[| i]
        
        if !instance_exists(_id)
            continue
        
        if _id.mouse_on > 0
            continue
        
        if mouse_dist<40
            _id.mouse_on = 10
        else {
        	_id.mouse_on = 3
        }
        
        audio_play_sound(snd_popping,0,0,1,0,random_range(0.9,1.1))
        instance_create_depth(_id.x,_id.y,_id.depth-1,obj_fake_pop)
        
        _id.image_index--
        if (_id.image_index<0){
            instance_destroy(_id)
            continue
        }
        
        _id.knockback_time = clamp(mouse_dist/2,0,60)
        _id.knockback[0] = clamp( (mouse_x - mouse_prev_x)/60,-4,4 )
        _id.knockback[1] = clamp( (mouse_y - mouse_prev_y)/60,-4,4 )
    }
    
    ds_list_clear(collisions_list)
    _num = collision_line_list(mouse_x,mouse_y,mouse_prev_x,mouse_prev_y,obj_start_menu_blimp,false,true,collisions_list,true)
    
    for (var i = 0; i < _num; i++) {
    	var _id = collisions_list[| i]
        
        if !instance_exists(_id)
            continue
        
        if _id.mouse_on > 0
            continue
        
        if mouse_dist<60
            _id.mouse_on = 10
        else {
        	_id.mouse_on = 3
        }
        
        audio_play_sound(snd_blimp_hit,0,0,1,0,random_range(0.9,1.1))
        _id.life--
        
        instance_create_depth(_id.x+irandom_range(-16,16),_id.y+irandom_range(-8,8),_id.depth-1,obj_fake_pop)
        
        if (_id.life<=0){
            instance_create_depth(_id.x,_id.y,_id.depth-1,obj_fake_pop)
            audio_play_sound(snd_blimp_destroyed,0,0,1,0,random_range(0.9,1.1))
            instance_destroy(_id)
            continue
        }
        
    }
    
}

