dialogue.step()

var _gui_active = true
if global.gui_layer>0 or global.gui_wait>0{
    _gui_active = false
}

if point_in_rectangle(mouse_x,mouse_y,815,398,815+167,398+163) and _gui_active==true{
    onduel = true
}
else {
	onduel = false
}

if mouse_wheel_down() and page<max_page  and _gui_active==true{
    page++
}
if mouse_wheel_up() and page>0 and _gui_active==true{
    page--
}

if page>0{
    var _x = 1024-64
    var _y = 16
    if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left) and _gui_active==true{
        page--
    }
}
if page<max_page{
    var _x = 1024-64
    var _y = 384-48
    if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left) and _gui_active==true{
        page++
    }
}

for (var i = 0; i < bounties_num; i++) {
	var _bounty = bounties[i]
    var _cage = _bounty.cage
    var _effect = _cage.effect
    
    switch (_effect) {
        // case BOUNTY_EFFECT_TYPE.NONE: // intentional
    	case BOUNTY_EFFECT_TYPE.FLOATY:
            
            _cage.effect_time+=_cage.effect_time_speed
            if _cage.effect_time>pi*2{
                _cage.effect_time-=pi*2
            }
            _cage.icon_pos[1] = sin(_cage.effect_time+_cage.effect_time_plus)*_cage.effect_max_y
            
        break;
    	case BOUNTY_EFFECT_TYPE.SIDES:
            
            _cage.effect_time+=_cage.effect_time_speed
            if _cage.effect_time>pi*2{
                _cage.effect_time-=pi*2
            }
            _cage.icon_pos[0] = sin(_cage.effect_time+_cage.effect_time_plus)*_cage.effect_max_x
            
        break;
        case BOUNTY_EFFECT_TYPE.SHAKY:
            
            _cage.effect_time+=choose(0.25,0.5,1)
            if _cage.effect_time>25{
                _cage.effect_time-=25
            }
            
            if (_cage.effect_time+_cage.effect_time_plus) % 2 == 0{
            _cage.icon_pos[0] = random( _cage.effect_shake[0] )
            _cage.icon_pos[1] = random( _cage.effect_shake[1] )
            }
            
        break;
        case BOUNTY_EFFECT_TYPE.PUSH:
            
            if _cage.effect_wait>0{
                _cage.icon_pos[0] = lerp(_cage.icon_pos[0],0,0.2)
                _cage.effect_wait--
            }
            else {
                var _animch = _cage.effect_animcurve
                var _value = animcurve_channel_evaluate( _animch,_cage.effect_pos )
                _cage.effect_pos += _cage.effect_speed
                _cage.icon_pos[0] = _cage.effect_distance*_value
                
                if _cage.effect_pos>=1{
                    _cage.effect_wait = _cage.effect_wait_max
                    _cage.effect_pos = 0
                }
            }
            
        break;
        case BOUNTY_EFFECT_TYPE.REPEAT:
            
            _cage.icon_pos[0] += _cage.effect_speed
            if _cage.icon_pos[0] > _cage.effect_max_pos{
                _cage.icon_pos[0] -= _cage.effect_max_pos
            }

        break;
    }
    
}

var _row = 0
var _col = 0
for (var i = 8*page; i < clamp(8*(page+1),0,bounties_num); i++) {
    
    var _x = 116 + 216*_row
    var _y = 48 + (192)*_col
    var _bounty = bounties[i]
    var _mouse_on = _bounty.mouse_on
    var _cage = _bounty.cage
    var _max_rank = _bounty.max_rank
    var _rank = _bounty.current_rank
    
    if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+109,_y+106) and _gui_active==true{
        _bounty.mouse_on = true
        if mouse_check_button_pressed(mb_left){
            if bounty_selected == i
                bounty_selected = -1
            else 
            	bounty_selected = i
            
            surface_free(bounty_info.surface)
            
            if buffer_exists(bounty_info.buffer)
                buffer_delete(bounty_info.buffer)
            
            bounty_info.initialized = false
        }
    }
    else {
    	_bounty.mouse_on = false
    }
    
    _row++
    if _row>3{
        _row = 0
        _col++
    }
    
}