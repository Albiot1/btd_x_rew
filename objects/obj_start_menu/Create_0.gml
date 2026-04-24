draw_set_font(font_start_menu)

bloon_spawn_cooldown = 2
blimp_spawn_cooldown = 10
pressed_any_key = false
camy = 976
cammaxy = 976-576-100
cam_anim = animcurve_get_channel( animcurve_get(an_start_camera_pan),"curve1" )
cam_anim_pos = 0

deluxe_surface = undefined
timer = 0
flash_pos = 0

mouse_prev_x = mouse_x
mouse_prev_y = mouse_y
mouse_diff = 0
mouse_dist = 0

instance_create_depth(0,0,98,obj_attack_trail)

mdraw = [0,0,0,0]

collisions_list = ds_list_create()

depth = -500