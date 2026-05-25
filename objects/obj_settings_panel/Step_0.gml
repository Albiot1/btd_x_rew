switch (state) {
	case SETTINGS_PANEL_STATE.APPEAR:
        var _an_value = animcurve_channel_evaluate(chan[0],anim_pos)
        y = 38+650 - 650*_an_value
        anim_pos+=0.025
        
        if back_alpha < 1
            back_alpha=min(back_alpha+0.25,1)
        
        if anim_pos>=1{
            state = SETTINGS_PANEL_STATE.SHOW
            anim_pos = 0
        }
    break;
    case SETTINGS_PANEL_STATE.SHOW:
        if global.gui_wait == 0{
            main_settings.step(x,y)
            
            if point_in_rectangle(mouse_x,mouse_y,x+back_button_x,y+back_button_y,x+back_button_x+64,y+back_button_y+64){
                back_button_mouse_on = true
                if mouse_check_button_pressed(mb_left){
                    state = SETTINGS_PANEL_STATE.DISAPPEAR
                    global.gui_layer = 0
                    global.gui_wait = 10
                    exit
                }
            }
            else {
            	back_button_mouse_on = false
            }
        }
    break;
    case SETTINGS_PANEL_STATE.DISAPPEAR:
        var _an_value = animcurve_channel_evaluate(chan[1],anim_pos)
        y = 38+650*_an_value
        anim_pos+=0.025
        
        if back_alpha>0
            back_alpha -= 0.25
        
        if anim_pos>=1{
            instance_destroy()
        }
    break;
}

if state == SETTINGS_PANEL_STATE.HOTKEYS{
    if global.gui_wait == 0{
        hotkey_settings.step(x,y)
        
        if point_in_rectangle(mouse_x,mouse_y,x+back_button_x,y+back_button_y,x+back_button_x+64,y+back_button_y+64) and hotkey_settings.replacing==-1{
            back_button_mouse_on = true
            if mouse_check_button_pressed(mb_left){
                state = SETTINGS_PANEL_STATE.SHOW
                global.settings.hotkeys = variable_clone( hotkey_settings.keys )
                global.gui_wait = 10
                back_button_sprite = spr_exit_button
            }
        }
        else {
        	back_button_mouse_on = false
        }
    }
}
