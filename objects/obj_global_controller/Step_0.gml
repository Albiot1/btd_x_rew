if global.gui_wait>0
    global.gui_wait--

if keyboard_check_pressed(vk_f12){
    global.show_debug = !global.show_debug
    show_debug_log(global.show_debug)
}