switch (state) {
	case SETTINGS_PANEL_STATE.APPEAR:
        var _an_value = animcurve_channel_evaluate(chan[0],anim_pos)
        y = 38+650 - 650*_an_value
        anim_pos+=0.025
        
        if back_alpha < 1
            back_alpha+=0.25
        
        if anim_pos>=1{
            state = SETTINGS_PANEL_STATE.SHOW
            anim_pos = 0
        }
    break;
    case SETTINGS_PANEL_STATE.SHOW:

    break;
    case SETTINGS_PANEL_STATE.DISSAPEAR:
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

if state != SETTINGS_PANEL_STATE.HOTKEYS{
    if global.gui_wait == 0{
        main_settings.step(x,y)
        
        if exit_button.step(x,y){
            state = SETTINGS_PANEL_STATE.DISSAPEAR
            global.gui_layer = 0
            global.gui_wait = 10
            exit
        }
    }
}
else{
    if global.gui_wait == 0{
        hotkey_settings.step(x,y)
        
        if back_button.step(x,y){
            state = SETTINGS_PANEL_STATE.SHOW
            
            global.settings.hotkeys = variable_clone( hotkey_settings.keys )
            
            global.gui_wait = 10
            exit
        }
    }
}
