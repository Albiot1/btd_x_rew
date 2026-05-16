switch (state) {
	case CREDITS_STATE.APPEAR:
        var _an_value = animcurve_channel_evaluate(chan[0],anim_pos)
        y = 38+650 - 650*_an_value
        anim_pos+=0.025
        
        if back_alpha < 1
            back_alpha+=0.25
        
        if anim_pos>=1{
            state = CREDITS_STATE.SHOW
            anim_pos = 0
        }
    break;
    case CREDITS_STATE.SHOW:
        if wait>0
            wait--
        
        if exit_button.step(x,y){
            state = CREDITS_STATE.DISSAPEAR
            global.gui_layer = 0
            global.gui_wait = 10
            exit
        }
        
        var _all_alpha = true
        for (var i = 0; i < info.number[page]; i++) {
            var _txt = info.texts[page][i]
            if i == 0{
                if texts_alpha[i] < 1{
                    texts_alpha[i]+=0.1
                    _all_alpha = false
                }
            }
            else {
            	if texts_alpha[i-1] == 1{
                    if _txt == "" and texts_alpha[i] < 1
                        texts_alpha[i] = 1
                    if texts_alpha[i] < 1{
                        texts_alpha[i]+=0.1
                        _all_alpha = false
                    }
                }
            }
        }
        
        if mouse_check_button_pressed(mb_left) and wait==0{
            if _all_alpha == true{
                if page<max_page{
                    page++
                    texts_alpha = array_create(info.number[page],0)
                }
                else {
                	state = CREDITS_STATE.DISSAPEAR
                    global.gui_layer = 0
                    global.gui_wait = 10
                }
            }
            else {
                for (var i = 0; i < info.number[page]; i++) {
                    texts_alpha[i] = 1
                }
            }
        }
    break;
    case CREDITS_STATE.DISSAPEAR:
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



