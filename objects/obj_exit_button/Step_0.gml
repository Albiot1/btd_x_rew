var _clicked = false

if point_in_rectangle(mouse_x,mouse_y,x,y,x+64,y+64) and global.gui_layer == my_layer and global.gui_wait == 0{
    mouse_on = true
    if mouse_check_button_pressed(mb_left){
        _clicked = true
    }
}
else {
    mouse_on = false
}

if keyboard_check_pressed(vk_escape){
    if global.gui_layer == my_layer and global.gui_wait == 0{
        _clicked = true
    }
}

if _clicked{
    switch (room) {
        default: room_goto(rm_main_menu) break;
        case rm_mode_select: room_goto(rm_play_menu) break;
    }
}