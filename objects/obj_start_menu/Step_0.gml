if pressed_any_key == false{
    if keyboard_check_pressed(vk_anykey){
        pressed_any_key = true
        cam_vpeed = 0.05
    }
}
else {
    
    cam_vspeed += 0.02
    
    camy-=cam_vspeed
    camera_set_view_pos(view_camera[0],0,camy)
    
	next_room_timer--
    if next_room_timer==0{
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