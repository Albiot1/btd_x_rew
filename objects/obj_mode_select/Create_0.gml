global.game_mode = -1

milestone_bar = {
    pos:[804,142],
    surface:-1,
    buffer:-1,
    initialized:false,
    surface_size:[200,275],
    text_high_score:scr_get_translation("mode_high_score"),
    text_best_time:scr_get_translation("mode_best_time"),
    text_best_wave:"",
    text_no_score:scr_get_translation("mode_no_best"),
    highest_waves:[0,0,0],
    draw:function (){
        
        var _map_info = global.tracks[$ global.current_map]
        var _best_time = _map_info.best_time
        var _best_score = _map_info.best_score.overall
        
        if !initialized{
            surface = surface_create(surface_size[0],surface_size[1])
            
            draw_set_font(font_general_12)
            align_set(fa_center,fa_middle)
            surface_set_target(surface)
            
            var _sc_pos = [ surface_size[0]/2-47,0 ]
            
            var _score_fill_start_pos = [27,249]
            var _time_fill_start_pos = [57,249]
            var _fill_height = 43
            var _fill_spacing = 7
            
            var _px = _sc_pos[0]
            var _py = _score_fill_start_pos[1]
            
            var _time_milestone = _map_info.milestone.timetrial
            var _score_milestone = _map_info.milestone.score
            for (var i = 0; i < 5; i++) {
                var _score = global.milestone_rewards.score.value[i]
                var _time = global.milestone_rewards.timetrial.time[i]
                var _mm = global.milestone_rewards.score.monkeymoney[i]
                var _bp = global.milestone_rewards.score.bloonpoints[i]
                
            	draw_sprite(spr_score_milestone_icon,0,_px-16,_py-_fill_height/2-24)
                draw_text_outline(_px+15-16,_py-_fill_height/2+12,c_black,c_white,scr_format_number(_score))
                
                draw_sprite(spr_cash_reward_icon,0,_px+95,_py-_fill_height/2-9)
                draw_text_outline(_px+95,_py-_fill_height/2+12,c_black,COLOR_MONKEYMONEY,_mm)
                
                draw_sprite(spr_bp_reward_icon,0,_px+95+38,_py-_fill_height/2-9)
                draw_text_outline(_px+95+38,_py-_fill_height/2+12,c_black,COLOR_BLOONPOINTS,_bp)
                
                if _score_milestone>=i+1{
                    draw_rectangle_color(_sc_pos[0]+_score_fill_start_pos[0],_py-_fill_height,_sc_pos[0]+_score_fill_start_pos[0]+10,_py,COLOR_SCORE_BAR,COLOR_SCORE_BAR,COLOR_SCORE_BAR,COLOR_SCORE_BAR,0)
                }
                else {
                    var _percent = 0
                    
                    var _last_score = 0
                    
                    if i > 0{
                        _last_score = global.milestone_rewards.score.value[i-1]
                    }
                    
                    if _best_score>_last_score{
                        if _best_score<_score{
                            _percent = _best_score / _score
                        }
                        else {
                        	_percent = 1
                        }
                    }
                        
                    draw_rectangle_color(_sc_pos[0]+_score_fill_start_pos[0],_py-_fill_height*_percent,_sc_pos[0]+_score_fill_start_pos[0]+10,_py,COLOR_SCORE_BAR,COLOR_SCORE_BAR,COLOR_SCORE_BAR,COLOR_SCORE_BAR,0)
                }
                
                if _time_milestone>=i+1{
                    draw_rectangle_color(_sc_pos[0]+_time_fill_start_pos[0],_py-_fill_height,_sc_pos[0]+_time_fill_start_pos[0]+10,_py,COLOR_SCORE_BAR_TIME,COLOR_SCORE_BAR_TIME,COLOR_SCORE_BAR_TIME,COLOR_SCORE_BAR_TIME,0)
                }
                else {
                    var _percent = 0
                    if _best_time>_time{
                        var _last_val = 860
                        
                        if i > 0{
                            _last_val = global.milestone_rewards.timetrial.time[i-1]
                        }
                        
                        var _max_diff = _last_val - _time
                        
                        if _best_time < _last_val{
                            _last_val = _best_time
                        }
                        
                        _percent = (_max_diff - (_last_val-_time))/_max_diff
                    }
                    else {
                    	_percent = 1
                    }
                    
                    draw_rectangle_color(_sc_pos[0]+_time_fill_start_pos[0],_py-_fill_height*_percent,_sc_pos[0]+_time_fill_start_pos[0]+10,_py,COLOR_SCORE_BAR_TIME,COLOR_SCORE_BAR_TIME,COLOR_SCORE_BAR_TIME,COLOR_SCORE_BAR_TIME,0)
                }
                
                
                _py -= _fill_height + _fill_spacing
            }
            
            
            draw_sprite(spr_score_meter,0,_sc_pos[0],_sc_pos[1])
            
            
            surface_reset_target()
            align_reset()
            
            buffer = surface_to_buffer(surface)
        }
        
        if !surface_exists(surface){
            surface = surface_create(surface_size[0],surface_size[1])
            buffer_to_surface(buffer,surface)
        }
        
        draw_surface(surface,pos[0],pos[1])
        
        draw_set_halign(fa_right)
        
        if _best_score != 0{
            draw_text(pos[0],pos[1]+249,text_high_score+scr_format_number(_best_score))
        }
        else {
        	draw_text(pos[0],pos[1]+249,text_high_score+text_no_score)
        }
        
        
        if _best_time != 86_400{
            draw_text(pos[0],pos[1]+249-24,text_best_time+scr_format_time(_best_time))
        }
        else {
        	draw_text(pos[0],pos[1]+249-24,text_best_time+text_no_score)
        }
        
        draw_text(pos[0],pos[1]+249-24-24-24-24-24,text_best_wave)
        
        draw_set_halign(fa_left)
        
    },
    clean_up:function (){
        surface_free(surface)
        if buffer_exists(buffer){
            buffer_delete(buffer)
        }
    },
    init:function (){
        var _data = global.tracks[$ global.current_map]
        
        highest_waves = [
            _data.best_wave.normal,
            _data.best_wave.impoppable,
            _data.best_wave.nightmare
        ]
        
        var _score_normal = highest_waves[0] == 0 ? text_no_score : highest_waves[0]
        var _score_impopp = highest_waves[1] == 0 ? text_no_score : highest_waves[1]
        var _score_nightm = highest_waves[2] == 0 ? text_no_score : highest_waves[2]
        
        text_best_wave = scr_text_format_insert( scr_get_translation("mode_highest_waves"),[_score_normal,_score_impopp,_score_nightm] )
    }
}

modifications = {
    tab_pos:[80,416-25],
    tab_txt:scr_get_translation("mode_mods"),
    text_points_multiplier:scr_get_translation("mode_multiplier"),
    tab_w:0,
    tab_h:50,
    name:[],
    desc:[],
    desc_w:210,
    multipliers:[],
    type:[],
    selected:[],
    sprite:[],
    show_desc:noone,
    mouse_on:-1,
    number:0,
    buttons_pos:[37,452],
    buttons_size:[118,53],
    buttons_spacing:[22,10],
    enabled:false,
    add:function (_text,_multiplier,_type,_spr){
        array_push(name,scr_get_translation("mod_"+_text+"_name"))
        array_push(desc,scr_get_translation("mod_"+_text+"_desc"))
        array_push(multipliers,_multiplier)
        array_push(type,_type)
        array_push(selected,false)
        array_push(sprite,_spr)
        number++
    },
    init:function (){
        draw_set_font(font_general_15)
        
        tab_w = string_width(tab_txt) + 32
    },
    step:function (){
        var _px = buttons_pos[0]
        var _py = buttons_pos[1]
        var _pos = 0
        var _w = buttons_size[0]
        var _h = buttons_size[1]
        
        mouse_on = -1
        show_desc = noone
        
        for (var i = 0; i < number; i++) {

            if enabled == true{
                if point_in_rectangle(mouse_x,mouse_y,_px,_py,_px+_w,_py+_h){
                    mouse_on = i
                    if mouse_check_button_pressed(mb_left){
                        
                        if selected[i] == true{
                            selected[i] = false
                        }
                        else {
                        	selected[i] = true
                            
                            for (var c = 0; c < number; c++) {
                            	
                                if c==i
                                    continue
                                
                                if type[c] == type[i]{
                                    selected[c] = false
                                    break
                                }
                                
                            }
                            
                        }
                        
                        obj_mode_select.multipliers_update()
                        
                    }
                    show_desc = desc[i] + scr_text_format_insert( text_points_multiplier,[multipliers[i]] )
                }
            }
            
            _py += _h+buttons_spacing[1]
            _pos++
            if _pos>1{
                _py = buttons_pos[1]
                _px += _w+buttons_spacing[0]
                _pos = 0
            }
            
        }
    },
    draw:function (){
        draw_set_font(font_general_15)
        
        var _tab_x = tab_pos[0]
        var _tab_y = tab_pos[1]
        
        draw_sprite_stretched(spr_category_panel,0,_tab_x,_tab_y,tab_w,tab_h)
        draw_text_color(_tab_x+10,_tab_y+10,tab_txt,c_black,c_black,c_black,c_black,1)
        
        draw_set_font(font_general_12)
        align_set(fa_center,fa_middle)
        
        var _px = buttons_pos[0]
        var _py = buttons_pos[1]
        var _pos = 0
        var _w = buttons_size[0]
        var _h = buttons_size[1]
        
        for (var i = 0; i < number; i++) {
            
            var _spr = sprite[i]
            var _name = name[i]
            var _selected = selected[i]
            
            var _r = HOVER_OUTLINE_R
            var _g = HOVER_OUTLINE_G
            var _b = HOVER_OUTLINE_B
            
            if _selected == true{
                if mouse_on != i{
                    _r = COMPLETED_OUTLINE_R
                    _g = COMPLETED_OUTLINE_G
                    _b = COMPLETED_OUTLINE_B
                }
            }
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],_r,_g,_b)
            shader_set_uniform_f(global.shaders.replace[1],mouse_on == i or _selected == true)
            
            draw_sprite_stretched(_spr,0,_px,_py,_w,_h)
            
            shader_reset()
            
            draw_text_color(_px+_w/2,_py+_h/2,_name,c_black,c_black,c_black,c_black,1)
            
            if enabled == false{
                draw_sprite_stretched_ext(_spr,0,_px,_py,_w,_h,c_black,0.5)
            }
            
            _py += _h+buttons_spacing[1]
            _pos++
            if _pos>1{
                _py = buttons_pos[1]
                _px += _w+buttons_spacing[0]
                _pos = 0
            }
            
        }
        
        align_reset()
        
        if enabled == true and show_desc != noone{
            var _desc = show_desc
            var _str_h = string_height_ext(_desc,16,desc_w)+16
            var _str_w = string_width_ext(_desc,16,desc_w)
            
            draw_sprite_stretched(spr_mod_description_tab,0,mouse_x,mouse_y-_str_h,_str_w+8,_str_h)
            draw_text_ext_color(mouse_x+4,mouse_y-_str_h+4,_desc,16,desc_w,c_black,c_black,c_black,c_black,1)
        }
        
    }
}

modifications.add("six_towers",1.6,0,spr_button_increase_difficulty)
modifications.add("random_towers",2.2,0,spr_button_increase_difficulty_3)

modifications.add("wave_squeeze",1.6,1,spr_button_increase_difficulty)
modifications.add("wave_smush",2.2,1,spr_button_increase_difficulty_2)

modifications.add("faster_bloons",1.45,2,spr_button_increase_difficulty)
modifications.add("fastest_bloons",1.9,2,spr_button_increase_difficulty_2)

modifications.add("stronger_bloons",1.3,3,spr_button_increase_difficulty)
modifications.add("strongerer_bloons",1.9,3,spr_button_increase_difficulty_2)

modifications.add("no_lives_lost",1.4,4,spr_button_increase_difficulty)
modifications.add("wave_skip",2,5,spr_button_increase_difficulty)

mode_select = {
    tab_pos:[80,4],
    tab_txt:scr_get_translation("mode_select"),
    tab_w:0,
    tab_h:50,
    difficulties_pos:[169,128],
    difficulties_txt:[],
    difficulties_size:[180,50],
    difficulties_color:[ #c0ffc0,#ff8080,#962c8a,#ffff47 ],
    difficulties_type:[ GAME_MODES.NORMAL,GAME_MODES.IMPOPPABLE,GAME_MODES.NIGHTMARE,GAME_MODES.TIME_TRIAL ],
    difficulties_mouse_on: -1,
    difficulties_number:4,
    difficulties_unlocked:[],
    milestones_pos:[169,0],
    milestones_anim:animcurve_get_channel( animcurve_get(an_milestone_appear),"curve1" ),
    milestones_anim_pos:[],
    milestones_anim_value:[],
    milestones_height:52,
    milestones_txt:[],
    milestones_number:0,
    milestones_done:[],
    milestones_color:c_white,
    milestones_width:[],
    milestones_main_text:"",
    
    milestones_reset:function (){
        milestones_anim_pos = []
        milestones_anim_value = []
        milestones_txt = []
        milestones_number = 0
        milestones_done = []
        milestones_color = c_white
        milestones_width = []
        milestones_main_text = ""
    },
    milestones_get:function (){
        
        draw_set_font(font_general_20)
        
        if global.game_mode == GAME_MODES.TIME_TRIAL{
            milestones_main_text = scr_get_translation("mode_milestones_time")
        }
        else {
        	milestones_main_text = scr_get_translation("mode_milestones")
        }
        
        switch (global.game_mode) {
        	case GAME_MODES.NORMAL:
                
                var _normal = global.milestone_rewards.normal
                var _num = array_length(_normal.wave)
                var _milestone = global.tracks[$ global.current_map].milestone.normal
                
                milestones_number = _num
                for (var i = 0; i < _num; i++) {
                	milestones_anim_pos[i] = -1 * (i/_num)
                    milestones_anim_value[i] = 0
                    
                    if _milestone >= i+1{
                        milestones_done[i] = true
                    }
                    else {
                    	milestones_done[i] = false
                    }
                    
                    var _txt = string(_normal.wave[i])
                    
                    milestones_txt[i] = _txt
                    
                    if i == 0{
                        milestones_width[i] = string_width(_txt)+32
                    }
                    else {
                    	milestones_width[i] = string_width(_txt)+64
                    }
                    
                }
                
            break;
            case GAME_MODES.IMPOPPABLE:
                
                var _impoppable = global.milestone_rewards.impoppable
                var _num = array_length(_impoppable.wave)
                var _milestone = global.tracks[$ global.current_map].milestone.impoppable
                
                milestones_number = _num
                for (var i = 0; i < _num; i++) {
                	milestones_anim_pos[i] = -1 * (i/_num)
                    milestones_anim_value[i] = 0
                    
                    if _milestone >= i+1{
                        milestones_done[i] = true
                    }
                    else {
                    	milestones_done[i] = false
                    }
                    
                    var _txt = string(_impoppable.wave[i])
                    
                    milestones_txt[i] = _txt
                    
                    if i == 0{
                        milestones_width[i] = string_width(_txt)+32
                    }
                    else {
                    	milestones_width[i] = string_width(_txt)+64
                    }
                }
                
            break;
            case GAME_MODES.NIGHTMARE:
                
                var _nightmare = global.milestone_rewards.nightmare
                var _num = array_length(_nightmare.wave)
                var _milestone = global.tracks[$ global.current_map].milestone.nightmare
                
                milestones_number = _num
                for (var i = 0; i < _num; i++) {
                	milestones_anim_pos[i] = -1 * (i/_num)
                    milestones_anim_value[i] = 0
                    
                    if _milestone >= i+1{
                        milestones_done[i] = true
                    }
                    else {
                    	milestones_done[i] = false
                    }
                    
                    var _txt = string(_nightmare.wave[i])
                    
                    milestones_txt[i] = _txt
                    
                    if i == 0{
                        milestones_width[i] = string_width(_txt)+32
                    }
                    else {
                    	milestones_width[i] = string_width(_txt)+64
                    }
                }
                
            break;
            case GAME_MODES.TIME_TRIAL:
                
                var _timetrial = global.milestone_rewards.timetrial
                var _num = array_length(_timetrial.time)
                var _milestone = global.tracks[$ global.current_map].milestone.timetrial
                
                milestones_number = _num
                for (var i = 0; i < _num; i++) {
                	milestones_anim_pos[i] = -1 * (i/_num)
                    milestones_anim_value[i] = 0
                    
                    if _milestone >= i+1{
                        milestones_done[i] = true
                    }
                    else {
                    	milestones_done[i] = false
                    }
                    
                    var _txt = scr_format_time(_timetrial.time[i])
                    
                    milestones_txt[i] = _txt
                    
                    if i == 0{
                        milestones_width[i] = string_width(_txt)+32
                    }
                    else {
                    	milestones_width[i] = string_width(_txt)+64
                    }
                }
                
            break;
        }
    },
    
    sandbox_pos:[444,18],
    sandbox_txt:scr_get_translation("mode_name_sand"),
    sandbox_size:[200,52],
    sandbox_mouse_on: false,
    values_anim: animcurve_get_channel( animcurve_get(an_mode_value_appear),"curve1" ),
    values_anim_pos: [0,0,0],
    values_anim_value: [0,0,0],
    values_icons: [spr_cash_icon,spr_lives_icon,spr_score_milestone_icon],
    values_texts: [scr_get_translation("mode_cash"),scr_get_translation("mode_lives"),scr_get_translation("mode_points")],
    values_width: [],
    values_pos: [169,0],
    values_color: [COLOR_INGAME_CASH,COLOR_INGAME_LIVES,c_white],
    starting_lives_value:0,
    starting_cash_value:0,
    point_multiplier_value:0,
    point_multiplier_base_value:0,
    infinite_txt:scr_get_translation("mode_infinite_resource"),
    
    values_reset:function (){
        values_anim_pos = [0,0,0]
        values_anim_value = [0,0,0]
        starting_lives_value = 0
        starting_cash_value = 0
        point_multiplier_value = 0
        point_multiplier_base_value = 0
    },
    values_get:function (){
        values_anim_pos[0] = -0.2
        values_anim_pos[1] = -0.4
        values_anim_pos[2] = -0.6
        if global.game_mode!=GAME_MODES.SANDBOX{
            starting_lives_value = global.game_modes_info.starting_lives[global.game_mode]
            starting_cash_value = global.game_modes_info.starting_cash[global.game_mode]
            point_multiplier_value = global.game_modes_info.points_multiplier[global.game_mode]
            point_multiplier_base_value = global.game_modes_info.points_multiplier[global.game_mode]
            
            obj_mode_select.multipliers_update()
            
            obj_mode_select.modifications.enabled = true
        }
        else {
        	starting_lives_value = infinite_txt
            starting_cash_value = infinite_txt
            point_multiplier_value = 0
            point_multiplier_base_value = 0
            
            obj_mode_select.modifications.enabled = false
        }
    },
    
    init:function (){
        draw_set_font(font_general_15)
        
        tab_w = string_width(tab_txt) + 32
        difficulties_pos[1] = sandbox_pos[1] + sandbox_size[1] + 16
        milestones_pos[1] = difficulties_pos[1] + difficulties_size[1] + 16
        values_pos[1] = milestones_pos[1] + milestones_height + 32
        
        for (var i = 0; i < difficulties_number; i++) {
            
            if global.rank >= global.game_modes_info.unlock_rank[i]{
                difficulties_unlocked[i] = true
                difficulties_txt[i] = scr_get_translation("mode_name_"+string(i))
            }
            else {
            	difficulties_unlocked[i] = false
                difficulties_txt[i] = scr_get_translation("mode_name_locked")+string( global.game_modes_info.unlock_rank[i] )
            }
            
        }
        
        draw_set_font(font_general_20)
        
        for (var i = 0; i < 3; i++) {
        	values_width[i] = string_width(values_texts[i])
        }
        
    },
    step:function (){
        var _diff_x = difficulties_pos[0]
        var _diff_y = difficulties_pos[1]
        var _diff_w = difficulties_size[0]
        var _diff_h = difficulties_size[1]
        
        difficulties_mouse_on = -1
        
        for (var i = 0; i < difficulties_number; i++) {
            
            if point_in_rectangle(mouse_x,mouse_y,_diff_x,_diff_y,_diff_x+_diff_w,_diff_y+_diff_h){
                var _difficulty_type = difficulties_type[i]
                
                difficulties_mouse_on = i
                if mouse_check_button_pressed(mb_left) and difficulties_unlocked[i] == true and global.game_mode != _difficulty_type{
                    global.game_mode = _difficulty_type
                    milestones_reset()
                    milestones_get()
                    values_reset()
                    values_get()
                    milestones_color = difficulties_color[i]
                }
            }
            
            _diff_x+=190
        }
        
        var _sandbox_x = sandbox_pos[0]
        var _sandbox_y = sandbox_pos[1]
        var _sandbox_w = sandbox_size[0]
        var _sandbox_h = sandbox_size[1]

        if point_in_rectangle(mouse_x,mouse_y,_sandbox_x,_sandbox_y,_sandbox_x+_sandbox_w,_sandbox_y+_sandbox_h){
            sandbox_mouse_on = true
            if mouse_check_button_pressed(mb_left) and global.game_mode != GAME_MODES.SANDBOX{
                global.game_mode = GAME_MODES.SANDBOX
                milestones_reset()
                values_reset()
                values_get()
            }
        }
        else {
        	sandbox_mouse_on = false
        }
        
        if global.game_mode != -1 and global.game_mode != GAME_MODES.SANDBOX{
            for (var i = 0; i < milestones_number; i++) {
                
                if milestones_anim_pos[i]<1{
                    milestones_anim_pos[i]+=0.05
                    milestones_anim_value[i] = animcurve_channel_evaluate( milestones_anim,milestones_anim_pos[i] )
                }
                
            }
        }
        
        if global.game_mode != -1{
            for (var i = 0; i < 3; i++) {
                
                if values_anim_pos[i] < 1{
            	    values_anim_pos[i]+=0.05
                    values_anim_value[i] = animcurve_channel_evaluate( values_anim,values_anim_pos[i] )
                }
                
            }
        }
        
    },
    draw:function (){
        draw_set_font(font_general_15)
        
        draw_sprite_stretched(spr_scroll_bar,0,0,0,64,416)
        
        var _tab_x = tab_pos[0]
        var _tab_y = tab_pos[1]
        
        draw_sprite_stretched(spr_category_panel,0,_tab_x,_tab_y,tab_w,tab_h)
        draw_text_color(_tab_x+10,_tab_y+10,tab_txt,c_black,c_black,c_black,c_black,1)
    
        draw_set_font(font_general_20)
        draw_set_halign(fa_middle)
    
        var _diff_x = difficulties_pos[0]
        var _diff_y = difficulties_pos[1]
        var _diff_w = difficulties_size[0]
        var _diff_h = difficulties_size[1]
        
        for (var i = 0; i < difficulties_number; i++) {
            var _color = difficulties_color[i]
            var _txt = difficulties_txt[i]
            var _diff = difficulties_type[i]
            var _unlocked = difficulties_unlocked[i]
            
            var _r = HOVER_OUTLINE_R, _g = HOVER_OUTLINE_G, _b = HOVER_OUTLINE_B
            
            if global.game_mode == _diff and difficulties_mouse_on != i{
                _r = COMPLETED_OUTLINE_R
                _g = COMPLETED_OUTLINE_G
                _b = COMPLETED_OUTLINE_B
            }
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],_r,_g,_b)
            shader_set_uniform_f(global.shaders.replace[1],difficulties_mouse_on == i || global.game_mode == _diff)
        	draw_sprite_stretched_ext(spr_difficulty_panel,0,_diff_x,_diff_y,_diff_w,_diff_h,_color,1)
            shader_reset()
            
            if !_unlocked{
                draw_sprite_stretched_ext(spr_difficulty_panel,0,_diff_x,_diff_y,_diff_w,_diff_h,c_black,0.3)
            }
            
            draw_text_color(_diff_x+90,_diff_y+8,_txt,c_black,c_black,c_black,c_black,1)
            
            _diff_x+=190
        }
        
        var _sandbox_x = sandbox_pos[0]
        var _sandbox_y = sandbox_pos[1]
        var _sandbox_w = sandbox_size[0]
        var _sandbox_h = sandbox_size[1]
        
        var _r = HOVER_OUTLINE_R, _g = HOVER_OUTLINE_G, _b = HOVER_OUTLINE_B
        
        if global.game_mode == GAME_MODES.SANDBOX and sandbox_mouse_on == false{
            _r = COMPLETED_OUTLINE_R
            _g = COMPLETED_OUTLINE_G
            _b = COMPLETED_OUTLINE_B
        }
        
        shader_set(sh_replace)
        shader_set_uniform_f(global.shaders.replace[0],_r,_g,_b)
        shader_set_uniform_f(global.shaders.replace[1],sandbox_mouse_on == true || global.game_mode == GAME_MODES.SANDBOX)
        draw_sprite_stretched(spr_sandbox_panel,0,_sandbox_x,_sandbox_y,_sandbox_w,_sandbox_h)
        shader_reset()
        
        draw_text_color(_sandbox_x+_sandbox_w/2,_sandbox_y+8,sandbox_txt,c_black,c_black,c_black,c_black,1)
        
        var _milestone_x = milestones_pos[0]
        var _milestone_y = milestones_pos[1]
        var _milestone_color = milestones_color
        var _milestone_height = milestones_height
        var _spr = spr_milestone_first_panel
        var _xfix = -8
        
        draw_set_font(font_general_15)
        draw_set_halign(fa_left)
        
        if milestones_number > 0{
            draw_text_color(_milestone_x - milestones_width[0] * (1 - milestones_anim_value[0]),_milestone_y - 12,milestones_main_text,c_black,c_black,c_black,c_black,milestones_anim_value[0])
        }
        
        draw_set_font(font_general_20)
        draw_set_halign(fa_middle)
        
        _milestone_y += 16
        
        for (var i = 0; i < milestones_number; i++) {
        	var _anim_value = milestones_anim_value[i]
            var _milestone_text = milestones_txt[i]
            var _milestone_width = milestones_width[i]
            var _milestone_done = milestones_done[i]
            
            var _px = _milestone_x - _milestone_width * ( 1 - _anim_value )
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],_milestone_done)
            draw_sprite_stretched_ext(_spr,0,_px,_milestone_y,_milestone_width,_milestone_height,_milestone_color,_anim_value)
            shader_reset()
            
            draw_text_color(_px+_milestone_width/2+_xfix+4,_milestone_y+8,_milestone_text,c_black,c_black,c_black,c_black,_anim_value)
            
            _milestone_x += _milestone_width - 16
            
            if i == 0{
                _spr = spr_milestone_rest_panel
                _xfix = 0
            }
            if i == 3{
                if global.game_mode != GAME_MODES.TIME_TRIAL and global.game_mode != GAME_MODES.SANDBOX{
                    _spr = spr_milestone_freeplay_panel
                }
            }
        }
        
        draw_set_halign(fa_left)
        
        
        var _values_x = values_pos[0]
        var _values_y = values_pos[1]
        
        if global.game_mode == GAME_MODES.SANDBOX{
            _values_y = milestones_pos[1]
        }
        
        var _values_data = [ starting_cash_value,starting_lives_value,point_multiplier_value ]
        var _endletter = ["$","","x"]
        
        for (var i = 0; i < 3; i++) {
        	var _icon = values_icons[i]
            var _text = values_texts[i]
            var _anim_value = values_anim_value[i]
            var _data = _values_data[i]
            var _color = values_color[i]
            var _width = values_width[i]
            
            var _xshift = 32 * ( 1 - _anim_value )
            
            draw_sprite_ext(_icon,0,_values_x - _xshift,_values_y,1,1,0,c_white,_anim_value)
            
            if _anim_value<1
                draw_set_alpha(_anim_value)
            
            draw_text_outline(_values_x+32 - _xshift,_values_y,c_black,c_white,_text)
            draw_text_outline(_values_x+32 - _xshift+_width,_values_y,c_black,_color,string(_data)+_endletter[i])
            
            if _anim_value<1
                draw_set_alpha(1)
            
            _values_y += 48
        }
        
        
        
    }
}

play_button = {
    pos:[792,477],
    size:[156,60],
    mouse_on:false,
    text:scr_get_translation("mode_play")
}

mode_select.init()
modifications.init()
milestone_bar.init()

instance_create_depth(4,5,depth-1,obj_exit_button)

function multipliers_update(){
    
    mode_select.point_multiplier_value = mode_select.point_multiplier_base_value
    for (var i = 0; i < modifications.number; i++) {
    	if modifications.selected[i] == true{
            mode_select.point_multiplier_value *= modifications.multipliers[i]
        }
    }
    
}