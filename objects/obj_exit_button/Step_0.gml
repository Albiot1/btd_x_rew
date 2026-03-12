if point_in_rectangle(mouse_x,mouse_y,x,y,x+64,y+64) and global.gui_layer == my_layer and global.gui_wait == 0{
    mouse_on = true
    if mouse_check_button_pressed(mb_left){
        switch (room) {
        	default: room_goto(rm_main_menu) break;
        }
    }
}
else {
    mouse_on = false
}