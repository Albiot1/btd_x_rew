var _all_alpha = true
for (var i = 0; i < info.number; i++) {
    var _txt = info.texts[i]
    if i == 0{
        if texts_alpha[i] < 1{
            texts_alpha[i] = min(texts_alpha[i]+0.25,1)
            _all_alpha = false
        }
    }
    else {
        if texts_alpha[i-1] == 1{
            if _txt == "" and texts_alpha[i] < 1
                texts_alpha[i] = 1
            if texts_alpha[i] < 1{
                texts_alpha[i]=min(texts_alpha[i]+0.25,1)
                _all_alpha = false
            }
        }
    }
}

switch (state) {
	case INFO_PANEL_STATE.APPEAR:
        var _an_value = animcurve_channel_evaluate(chan[0],anim_pos)
        y = 38+650 - 650*_an_value
        anim_pos+=0.025
        
        if back_alpha < 1
            back_alpha=min(back_alpha+0.25,1)
        
        if anim_pos>=1{
            state = INFO_PANEL_STATE.SHOW
            anim_pos = 0
        }
    break;
    case INFO_PANEL_STATE.SHOW:
        if wait>0
            wait--
        
        if mouse_check_button_pressed(mb_left) and wait==0{
            if _all_alpha == false{
                for (var i = 0; i < info.number; i++) {
                    texts_alpha[i] = 1
                }
            }
        }
        
        if _all_alpha == true{
            if exit_button.step(x,y){
                state = INFO_PANEL_STATE.DISAPPEAR
                global.gui_layer = 0
                global.gui_wait = 10
            }
        }
        
    break;
    case INFO_PANEL_STATE.DISAPPEAR:
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



