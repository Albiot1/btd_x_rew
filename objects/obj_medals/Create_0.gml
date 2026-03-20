all_achievements_order = array_union( global.achievements_order.milestone,global.achievements_order.tower,global.achievements_order.challenge )

draw_set_font(font_general_15)

achievements = {
    unlocked: [0,0,0],
    maximum: [0,0,0],
    page: 0,
    max_page: 0,
    current_order: [],
    current_order_num: 0,
    number_to_claim: 0,
    mouse_on: -1,
    type_selected: -1,
    claim_button:{
        text: global.translation[$ "achievement_claim_button"],
        px: 12,
        py: 576-54,
        text_w: string_width(global.translation[$ "achievement_claim_button"])+16,
        mouse_on: false
    },
    type_buttons: {
        px:[],
        py:[],
        text:[],
        type:[],
        icon:[],
        selected:-1,
        mouse_on:-1,
        num:0,
        add:function (_x,_y,_text,_icon,_type){
            array_push(px,_x)
            array_push(py,_y)
            array_push(text,_text)
            array_push(icon,_icon)
            array_push(type,_type)
            num++
        },
        step:function (){
            mouse_on = -1
            for (var i = 0; i < num; i++) {
                var _x = px[i]
                var _y = py[i]
                
                if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+96,_y+96){
                    mouse_on = i
                    if mouse_check_button_pressed(mb_left){
                        if selected == i{
                            obj_medals.achievements.type_selected = -1
                            selected = -1
                            obj_medals.achievements.update()
                        }
                        else {
                            obj_medals.achievements.type_selected = type[i]
                            selected = i
                            obj_medals.achievements.update()
                        }
                    }
                }
            }
        },
        draw:function (){
            draw_set_halign(fa_middle)
            draw_set_font(font_general_12)
            var _unlocked = obj_medals.achievements.unlocked
            var _maximum = obj_medals.achievements.maximum
            for (var i = 0; i < num; i++) {
                var _x = px[i]
                var _y = py[i]
                var _txt = text[i]
                var _ico = icon[i]
                
                shader_set(sh_replace)
                shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
                shader_set_uniform_f(global.shaders.replace[1],mouse_on == i or selected == i)
            	draw_sprite_stretched(spr_achievement_type_panel,0,_x,_y,96,96)
                shader_reset()
                
                draw_sprite(spr_achievemnt_type_icons,_ico,_x+16,_y+16)
                draw_text_outline(_x+48,_y+2,c_black,c_white,_txt)
                
                draw_text_outline(_x+48,_y+96-20,c_black,c_white,$"{_unlocked[i]}/{_maximum[i]}")
            }
            draw_set_halign(fa_left)
        }
    },
    step:function (){
        mouse_on = -1
        
        if number_to_claim>0{
            
            var _cx = claim_button.px
            var _cy = claim_button.py
            var _w = claim_button.text_w
            
            if point_in_rectangle(mouse_x,mouse_y,_cx,_cy,_cx+_w,_cy+48){
                claim_button.mouse_on = true
                if mouse_check_button_pressed(mb_left){
                    
                    for (var i = 0; i < current_order_num; i++) {
                        var _data = global.achievements[$ current_order[i]]
                        
                        if _data.state != ACHIEVEMENT_STATE.UNLOCKED_NOTCHECKED
                            continue
                        
                        number_to_claim--
                    
                        var _rewards = _data.reward
                        var _xrand = _w/2 - 16
                        var _yrand = 16
                        var _start_x = _cx+_w/2+32 + irandom_range(-_xrand,_xrand)
                        var _start_y = _cy+24+32 + irandom_range(-_yrand,_yrand)
                        
                        if variable_struct_exists(_rewards,"trophy"){
                            with instance_create_depth(_start_x,_start_y,-1,obj_fake_resource){
                                sprite_index = spr_trophy_fake
                                next_x = 925
                                next_y = 500+32
                            }
                            global.trophies+=_rewards.trophy
                        }
                        if variable_struct_exists(_rewards,"monkey_money"){
                            with instance_create_depth(_start_x,_start_y,-1,obj_fake_resource){
                                sprite_index = spr_monkey_money_icon_fake
                                next_x = 850
                                next_y = 500+32
                            }
                            global.monkey_money+=_rewards.monkey_money
                        }
                        if variable_struct_exists(_rewards,"bloon_point"){
                            with instance_create_depth(_start_x,_start_y,-1,obj_fake_resource){
                                sprite_index = spr_bloons_point_fake
                                next_x = 775
                                next_y = 500+32
                            }
                            global.bloon_points+=_rewards.bloon_point
                        }
                        
                        global.achievements[$ current_order[i] ].state = ACHIEVEMENT_STATE.CHECKED
                    }
                    
                    while (floor(global.trophies/10) - global.goodie_points_used > global.goodie_points){
                        with instance_create_depth(925+32,500+32,-1,obj_fake_resource){
                            sprite_index = spr_goodie_token_fake
                            next_x = 700
                            next_y = 500+32
                        }
                        global.goodie_points++
                    }
                    
                }
            }
            else {
            	claim_button.mouse_on = false
            }
        }
        
        var _row = 0
        var _col = 0

        var _start_i = 8*page
        var _end_i = clamp(8*(page+1),_start_i,current_order_num)
        
        var _x = 19
        var _y = 32+96+24
        for (var i = _start_i; i < _end_i; i++) {
            var _ax = _x + 464*_row
            var _ay = _y + 90*_col
            var _data = global.achievements[$ current_order[i] ]
            var _state = _data.state
            if point_in_rectangle(mouse_x,mouse_y,_ax,_ay,_ax+374+73,_ay+84){
                mouse_on = i
                if _state == ACHIEVEMENT_STATE.UNLOCKED_NOTCHECKED and mouse_check_button_pressed(mb_left){
                    number_to_claim--
                    
                    var _rewards = _data.reward
                    
                    if variable_struct_exists(_rewards,"trophy"){
                        with instance_create_depth(_ax+32,_ay+32,-1,obj_fake_resource){
                            sprite_index = spr_trophy_fake
                            next_x = 925
                            next_y = 500+32
                        }
                        global.trophies+=_rewards.trophy
                    }
                    if variable_struct_exists(_rewards,"monkey_money"){
                        with instance_create_depth(_ax+32,_ay+32,-1,obj_fake_resource){
                            sprite_index = spr_monkey_money_icon_fake
                            next_x = 850
                            next_y = 500+32
                        }
                        global.monkey_money+=_rewards.monkey_money
                    }
                    if variable_struct_exists(_rewards,"bloon_point"){
                        with instance_create_depth(_ax+32,_ay+32,-1,obj_fake_resource){
                            sprite_index = spr_bloons_point_fake
                            next_x = 775
                            next_y = 500+32
                        }
                        global.bloon_points+=_rewards.bloon_point
                    }
                    
                    while (floor(global.trophies/10) - global.goodie_points_used > global.goodie_points){
                        with instance_create_depth(925+32,500+32,-1,obj_fake_resource){
                            sprite_index = spr_goodie_token_fake
                            next_x = 700
                            next_y = 500+32
                        }
                        global.goodie_points++
                    }
                    
                    global.achievements[$ current_order[i] ].state = ACHIEVEMENT_STATE.CHECKED
                }
            }
            
            _row++
            if _row>1{
                _row = 0
                _col++
            }
        }
        
        if mouse_wheel_down(){
            if page<max_page{
                page++
            }
        }
        if mouse_wheel_up(){
            if page>0{
                page--
            }
        }
    },
    draw:function (){
        var _type_text = "ALL"
        switch (type_selected) {
        	case ACHIEVEMENT_MAIN_TYPE.CHALLENGE: _type_text = "CHALLENGES" break;
            case ACHIEVEMENT_MAIN_TYPE.MILESTONE: _type_text = "MILESTONES" break;
            case ACHIEVEMENT_MAIN_TYPE.TOWER: _type_text = "TOWERS" break;
        }
        draw_set_font(font_general_12)
        draw_text_outline(room_width/2-148-48,32+96,c_black,c_white,$"SHOWING : "+_type_text+" ACHIEVEMENTS")
        
        var _row = 0
        var _col = 0

        var _start_i = 8*page
        var _end_i = clamp(8*(page+1),_start_i,current_order_num)
        
        var _x = 19
        var _y = 32+96+24
        draw_set_font(font_general_12)
        for (var i = _start_i; i < _end_i; i++) {
            var _ax = _x + 464*_row
            var _ay = _y + 90*_col
            var _data = global.achievements[$ current_order[i] ]
            var _state = _data.state
            var _mouse_on = mouse_on == i
            
            switch (_state) {
            	case ACHIEVEMENT_STATE.LOCKED:
                    var _r = DISABLED_OUTLINE_R, _g = DISABLED_OUTLINE_G, _b = DISABLED_OUTLINE_B
                    
                    if _mouse_on == true{
                        _r = HOVER_OUTLINE_R
                        _g = HOVER_OUTLINE_G
                        _b = HOVER_OUTLINE_B
                    }
                    
                    shader_set(sh_replace)
                    shader_set_uniform_f(global.shaders.replace[0],_r,_g,_b)
                    shader_set_uniform_f(global.shaders.replace[1],true)
                    draw_sprite_stretched(spr_achievement_bar_bottom,0,_ax+73,_ay+7,374,73)
                    draw_sprite_stretched(spr_achievement_bar_top,0,_ax,_ay,84,84)
                    shader_reset()
                    
                    var _text = _data.text
                    draw_sprite(spr_achievement_locked_icon,0,_ax,_ay)
                    
                    draw_text_ext_color(_ax+84,_ay+9,_text,16,359,c_black,c_black,c_black,c_black,1)
                break;
                case ACHIEVEMENT_STATE.UNLOCKED_NOTCHECKED:
                    var _r = COMPLETED_OUTLINE_R, _g = COMPLETED_OUTLINE_G, _b = COMPLETED_OUTLINE_B
                    
                    if _mouse_on == true{
                        _r = HOVER_OUTLINE_R
                        _g = HOVER_OUTLINE_G
                        _b = HOVER_OUTLINE_B
                    }
                    
                    shader_set(sh_replace)
                    shader_set_uniform_f(global.shaders.replace[0],_r,_g,_b)
                    shader_set_uniform_f(global.shaders.replace[1],true)
                    draw_sprite_stretched(spr_achievement_bar_bottom,0,_ax+73,_ay+7,374,73)
                    draw_sprite_stretched(spr_achievement_bar_top,0,_ax,_ay,84,84)
                    shader_reset()
                    
                    var _icon = _data.icon
                    
                    draw_sprite(_icon,0,_ax,_ay)
                    
                    draw_set_valign(fa_center)
                    draw_text_color(_ax+84,_ay+9+36,"CLICK TO RECEIVE REWARD!",c_black,c_black,c_black,c_black,1)
                    draw_set_valign(fa_top)
                break;
                case ACHIEVEMENT_STATE.CHECKED:
                    var _r = GRAYED_OUT_OUTLINE_R, _g = GRAYED_OUT_OUTLINE_G, _b = GRAYED_OUT_OUTLINE_B
                    
                    if _mouse_on == true{
                        _r = HOVER_OUTLINE_R
                        _g = HOVER_OUTLINE_G
                        _b = HOVER_OUTLINE_B
                    }
                    
                    shader_set(sh_replace)
                    shader_set_uniform_f(global.shaders.replace[0],_r,_g,_b)
                    shader_set_uniform_f(global.shaders.replace[1],true)
                    draw_sprite_stretched(spr_achievement_bar_bottom,0,_ax+73,_ay+7,374,73)
                    draw_sprite_stretched(spr_achievement_bar_top,0,_ax,_ay,84,84)
                    shader_reset()
                    
                    var _icon = _data.icon
                    
                    var _text = _data.text
                    draw_sprite(_icon,1,_ax,_ay)
                    
                    draw_text_ext_color(_ax+84,_ay+9,_text,16,359,c_black,c_black,c_black,c_black,1)
                break;
            }
            
            _row++
            if _row>1{
                _row = 0
                _col++
            }
        }
        
        if number_to_claim>0{
            var _cx = claim_button.px
            var _cy = claim_button.py
            var _txt = claim_button.text
            var _w = claim_button.text_w
            draw_set_font(font_general_15)
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],claim_button.mouse_on)
            draw_sprite_stretched(spr_achievement_type_panel,0,_cx,_cy,_w,48)
            shader_reset()
            
            draw_text_outline(_cx+8,_cy+12,c_black,c_green,_txt)
        }
        
        draw_sprite_stretched(spr_scroll_bar,0,1024-64,0,64,576)
        if page>0
        draw_sprite(spr_scroll_up,0,1024-64,16)
        
        draw_sprite_stretched(spr_scroll_bar_thumb,0,1024-56,48+2+416*(page/max_page),SCROLL_THUMB_WIDTH,SCROLL_THUMB_HEIGHT)
        
        if page<max_page
        draw_sprite(spr_scroll_down,0,1024-64,576-48)
    },
    update:function (){
        page = 0
        switch (type_selected) {
        	case ACHIEVEMENT_MAIN_TYPE.MILESTONE: current_order = global.achievements_order.milestone break;
            case ACHIEVEMENT_MAIN_TYPE.CHALLENGE: current_order = global.achievements_order.challenge break;
            case ACHIEVEMENT_MAIN_TYPE.TOWER: current_order = global.achievements_order.tower break;
            case -1: current_order = obj_medals.all_achievements_order break;
        }
        current_order_num = array_length(current_order)
        
        for (var i = 0; i < current_order_num; i++) {
        	if global.achievements[$ current_order[i]].state == ACHIEVEMENT_STATE.UNLOCKED_NOTCHECKED
                number_to_claim++
        }
        
        max_page = ceil( current_order_num/8 )-1
    },
}

achievemnts_unlocked = 0
achievemnts_maximum = 0

var _unlocked = 0
var _achievement_ids = global.achievements_order.milestone
achievements.maximum[0] = array_length(_achievement_ids)
for (var i = 0; i < achievements.maximum[0]; i++) {
    var _state = global.achievements[$ _achievement_ids[i] ].state
	if _state == ACHIEVEMENT_STATE.CHECKED or _state == ACHIEVEMENT_STATE.UNLOCKED_NOTCHECKED{
        _unlocked++
    }
}
achievements.unlocked[0] = _unlocked

_unlocked = 0
_achievement_ids = global.achievements_order.tower
achievements.maximum[1] = array_length(_achievement_ids)
for (var i = 0; i < achievements.maximum[1]; i++) {
    var _state = global.achievements[$ _achievement_ids[i] ].state
	if _state == ACHIEVEMENT_STATE.CHECKED or _state == ACHIEVEMENT_STATE.UNLOCKED_NOTCHECKED{
        _unlocked++
    }
}
achievements.unlocked[1] = _unlocked

_unlocked = 0
_achievement_ids = global.achievements_order.challenge
achievements.maximum[2] = array_length(_achievement_ids)
for (var i = 0; i < achievements.maximum[2]; i++) {
    var _state = global.achievements[$ _achievement_ids[i] ].state
	if _state == ACHIEVEMENT_STATE.CHECKED or _state == ACHIEVEMENT_STATE.UNLOCKED_NOTCHECKED{
        _unlocked++
    }
}
achievements.unlocked[2] = _unlocked

for (var i = 0; i < 3; i++) {
	achievemnts_maximum+=achievements.maximum[i]
    achievemnts_unlocked+=achievements.unlocked[i]
}

achievements.type_buttons.add(room_width/2-148-48,32,global.translation[$ "achievement_type_0"],0,ACHIEVEMENT_MAIN_TYPE.MILESTONE)
achievements.type_buttons.add(room_width/2-48,32,global.translation[$ "achievement_type_1"],1,ACHIEVEMENT_MAIN_TYPE.TOWER)
achievements.type_buttons.add(room_width/2+148-48,32,global.translation[$ "achievement_type_2"],2,ACHIEVEMENT_MAIN_TYPE.CHALLENGE)

instance_create_depth(4,5,depth,obj_exit_button)

achievements.update()
