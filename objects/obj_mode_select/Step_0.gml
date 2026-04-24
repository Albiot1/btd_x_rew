mode_select.step()
modifications.step()

if global.game_mode != -1{
    var _px = play_button.pos[0]
    var _py = play_button.pos[1]
    
    if point_in_rectangle(mouse_x,mouse_y,_px,_py,_px+play_button.size[0],_py+play_button.size[1]){
        play_button.mouse_on = true
    }
    else {
    	play_button.mouse_on = false
    }
}

