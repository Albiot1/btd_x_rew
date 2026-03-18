state = "appear"

back_alpha = 0

x = 139
y = 38+650

anim = [animcurve_get(an_credits_appear),animcurve_get(an_credits_disappear)]
chan = [animcurve_get_channel(anim[0],"curve1"),animcurve_get_channel(anim[1],"curve1")]
anim_pos = 0

exit_button = {
    pos:[8,8],
    mouse_on:false,
    step:function (_xp,_yp){
        var _x = pos[0]
        var _y = pos[1]
        if point_in_rectangle(mouse_x,mouse_y,_x+_xp,_y+_yp,_x+_xp+64,_y+_yp+64){
            mouse_on = true
            if mouse_check_button_pressed(mb_left){
                return true
            }
        }
        else {
        	mouse_on = false
        }
        return false
    },
    draw:function (_x,_y){
        shader_set(sh_replace)
        shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
        shader_set_uniform_f( global.shaders.replace[1],mouse_on )
        draw_sprite(spr_exit_button,0,_x+pos[0],_y+pos[1])
        shader_reset()
    }
}

back_button = {
    pos:[8,8],
    mouse_on:false,
    step:function (_xp,_yp){
        var _x = pos[0]
        var _y = pos[1]
        if point_in_rectangle(mouse_x,mouse_y,_x+_xp,_y+_yp,_x+_xp+64,_y+_yp+64){
            mouse_on = true
            if mouse_check_button_pressed(mb_left){
                return true
            }
        }
        else {
        	mouse_on = false
        }
        return false
    },
    draw:function (_x,_y){
        shader_set(sh_replace)
        shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
        shader_set_uniform_f( global.shaders.replace[1],mouse_on )
        draw_sprite(spr_back_button,0,_x+pos[0],_y+pos[1])
        shader_reset()
    }
}

main_settings = {
    music_pos:[8,75],
    sound_pos:[373,75],
    slider_value:[ global.gain.music,global.gain.sound ],
    slider_grabbed: noone,
    buttons:{
        px:[],
        py:[],
        action:[],
        mouse_on:[],
        text:[],
        text_w:[],
        num:0,
        add:function (_x,_y,_text,_action){
            array_push(px,_x)
            array_push(py,_y)
            array_push(text,_text)
            array_push(mouse_on,false)
            array_push(action,_action)
            array_push(text_w,string_width(_text)+16)
            num++
        }
    },
    checkboxes:{
        px:[],
        py:[],
        values:[],
        action:[],
        mouse_on:[],
        text:[],
        text_w:[],
        num:0,
        add:function (_x,_y,_text,_value,_action){
            array_push(px,_x)
            array_push(py,_y)
            array_push(text,_text)
            array_push(mouse_on,false)
            array_push(action,_action)
            array_push(values,_value)
            array_push(text_w,string_width(_text))
            num++
        }
    },
    reset_buttons:{
        px:[],
        py:[],
        cooldown:[],
        text:[],
        action:[],
        mouse_on:[],
        resetted:[],
        num:0,
        max_cooldown:60*5,
        add:function (_x,_y,_text,_action){
            array_push(px,_x)
            array_push(py,_y)
            array_push(text,_text)
            array_push(mouse_on,false)
            array_push(action,_action)
            array_push(cooldown,0)
            array_push(resetted,0)
            num++
        }
    },
    step:function (_x,_y){
        var _music_slider_x = _x + music_pos[0] + 56
        var _music_slider_y = _y + music_pos[1] + 10
        
        var _sound_slider_x = _x + sound_pos[0] + 56
        var _sound_slider_y = _y + sound_pos[1] + 10
        
        if point_in_rectangle(mouse_x,mouse_y,_music_slider_x,_music_slider_y,_music_slider_x+256,_music_slider_y+38) and mouse_check_button_pressed(mb_left){
            slider_grabbed = 0
        }
        if point_in_rectangle(mouse_x,mouse_y,_sound_slider_x,_sound_slider_y,_sound_slider_x+256,_sound_slider_y+38) and mouse_check_button_pressed(mb_left){
            slider_grabbed = 1
        }
        
        if slider_grabbed != noone{
            var _start_x = [ _music_slider_x,_sound_slider_x ]
            var _max_x = 256
            
            var _curr_x = clamp(mouse_x-_start_x[slider_grabbed],0,_max_x)
            
            var _perc = _curr_x/_max_x
            
            slider_value[slider_grabbed] = _perc
            
            if slider_grabbed == 0{
                global.gain.setMusic(_perc)
            }
            else {
            	global.gain.setSound(_perc)
            }
            
            if !mouse_check_button(mb_left){
                slider_grabbed = noone
            }
        }
        
        for (var i = 0; i < buttons.num; i++) {
        	var _bx = _x+buttons.px[i]
            var _by = _y+buttons.py[i]
            var _bwid = buttons.text_w[i]
            
            if point_in_rectangle(mouse_x,mouse_y,_bx,_by,_bx+_bwid,_by+32){
                buttons.mouse_on[i] = true
                if mouse_check_button_pressed(mb_left) and buttons.action[i]!=-1{
                    buttons.action[i]()
                }
            }
            else {
            	buttons.mouse_on[i] = false
            }
            
        }
        
        for (var i = 0; i < checkboxes.num; i++) {
        	var _cx = _x+checkboxes.px[i]
            var _cy = _y+checkboxes.py[i]
            var _cwid = checkboxes.text_w[i]
            var _mouse_on = checkboxes.mouse_on[i]
            var _value = checkboxes.values[i]
            
            if point_in_rectangle(mouse_x,mouse_y,_cx,_cy-4,_cx+_cwid+32+8,_cy+26){
                checkboxes.mouse_on[i] = true
                if mouse_check_button_pressed(mb_left){
                    var _change = false
                    
                    if checkboxes.action[i]!=-1{
                        _change = checkboxes.action[i]()
                    }
                    
                    
                    if _change == true{
                        checkboxes.values[i] = !checkboxes.values[i]
                    }
                }
            }
            else {
            	checkboxes.mouse_on[i] = false
            }
            
        }
        
        var _max_cooldown = reset_buttons.max_cooldown

        for (var i = 0; i < reset_buttons.num; i++) {
        	var _rx = _x+reset_buttons.px[i]
            var _ry = _y+reset_buttons.py[i]
            
            if reset_buttons.resetted[i]>0
                reset_buttons.resetted[i]--
            
            if point_in_rectangle(mouse_x,mouse_y,_rx,_ry,_rx+256,_ry+48) and reset_buttons.resetted[i]==0{
                reset_buttons.mouse_on[i] = true
                if mouse_check_button(mb_left){
                    reset_buttons.cooldown[i]++
                    if reset_buttons.cooldown[i] >= _max_cooldown{
                        reset_buttons.cooldown[i] = 0
                        reset_buttons.resetted[i] = 40
                        reset_buttons.action[i]()
                    }
                }
                else {
                	reset_buttons.cooldown[i]=0
                }
            }
            else {
            	reset_buttons.mouse_on[i] = false
                reset_buttons.cooldown[i] = 0
            }
        }
    },
    draw:function (_x,_y){
        draw_set_font(font_general_15)
        
        draw_sprite(spr_music_icon,0,_x+music_pos[0],_y+music_pos[1])
        draw_sprite(spr_sound_icon,0,_x+sound_pos[0],_y+sound_pos[1])
        
        var _music_slider_x = _x + music_pos[0] + 56
        var _music_slider_y = _y + music_pos[1] + 10
        
        draw_sprite_stretched(spr_slider,0,_music_slider_x,_music_slider_y,256,38)
        draw_sprite_stretched(spr_slider,1,_music_slider_x,_music_slider_y,256 * slider_value[0],38)
        draw_sprite(spr_slider_thumb,0,_music_slider_x-7+256*slider_value[0],_music_slider_y-5)
        
        var _sound_slider_x = _x + sound_pos[0] + 56
        var _sound_slider_y = _y + sound_pos[1] + 10
        
        draw_sprite_stretched(spr_slider,0,_sound_slider_x,_sound_slider_y,256,38)
        draw_sprite_stretched(spr_slider,1,_sound_slider_x,_sound_slider_y,256 * slider_value[1],38)
        draw_sprite(spr_slider_thumb,0,_sound_slider_x-7+256*slider_value[1],_sound_slider_y-5)
        
        for (var i = 0; i < buttons.num; i++) {
        	var _bx = _x+buttons.px[i]
            var _by = _y+buttons.py[i]
            var _btxt = buttons.text[i]
            var _bwid = buttons.text_w[i]
            var _mouse_on = buttons.mouse_on[i]
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],_mouse_on)
            draw_sprite_stretched(spr_button_settings,0,_bx,_by,_bwid,32)
            shader_reset()
            
            draw_text(_bx+8,_by+2,_btxt)
        }
        
        for (var i = 0; i < checkboxes.num; i++) {
        	var _cx = _x+checkboxes.px[i]
            var _cy = _y+checkboxes.py[i]
            var _ctxt = checkboxes.text[i]
            var _cwid = checkboxes.text_w[i]
            var _mouse_on = checkboxes.mouse_on[i]
            var _value = checkboxes.values[i]
            
            if _mouse_on{
                draw_text_outline(_cx,_cy,c_black,c_white,_ctxt)
            }
            else {
            	draw_text(_cx,_cy,_ctxt)
            }
            
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],_mouse_on)
            draw_sprite_stretched(spr_button_settings,0,_cx+8+_cwid,_cy-4,32,32)
            shader_reset()
            
            draw_sprite(spr_checbox_marks,_value,_cx+8+_cwid,_cy-4)
        }
        
        var _max_cooldown = reset_buttons.max_cooldown
        draw_set_halign(fa_middle)
        for (var i = 0; i < reset_buttons.num; i++) {
        	var _rx = _x+reset_buttons.px[i]
            var _ry = _y+reset_buttons.py[i]
            var _txt = reset_buttons.text[i]
            var _cdwn = reset_buttons.cooldown[i]
            var _mouse_on = reset_buttons.mouse_on[i]
            
            if reset_buttons.resetted[i]>0{
                draw_sprite_stretched(spr_button_reset_settings,2,_rx,_ry,256,48)
            }
            else {
                shader_set(sh_replace)
                shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
                shader_set_uniform_f(global.shaders.replace[1],_mouse_on)
                draw_sprite_stretched(spr_button_reset_settings,0,_rx,_ry,256,48)
                shader_reset()
                
                draw_text_outline(_rx+128,_ry+12,c_red,c_black,_txt)
                
                draw_sprite_stretched(spr_button_reset_settings,1,_rx,_ry,256*(_cdwn/_max_cooldown),48)
            }
        }
        draw_set_halign(fa_left)
    }
}

draw_set_font(font_general_15)

main_settings.buttons.add(8,133,"Hotkeys",
    function (){
        main_settings.slider_grabbed = noone
        global.gui_wait = 10
        state = "hotkeys"
        for (var i = 0; i < buttons.num; i++) {
        	buttons.mouse_on[i] = false
        }
    }
)

main_settings.checkboxes.add(373+8,143,"Instant upgrade unlocking",global.settings.instant_upgrade_unlocking,
    function (){
        global.settings.instant_upgrade_unlocking = !global.settings.instant_upgrade_unlocking
        
        return true
    }
)
main_settings.checkboxes.add(373+8,143+48,"Instant start transition",global.settings.instant_start_transition,
    function (){
        global.settings.instant_start_transition = !global.settings.instant_start_transition
        
        return true
    }
)
main_settings.checkboxes.add(373+8,143+48+48,"Show FPS",global.settings.show_fps,
    function (){
        global.settings.show_fps = !global.settings.show_fps
        
        return true
    }
)
main_settings.checkboxes.add(373+8,143+48+48+48,"Fullscreen",global.settings.fullscreen,
    function (){
        
        if global.settings.fullscreen == true{
            var _win_w = window_get_width()
            var _win_h = window_get_height()
            var _max_w = display_get_width()
            var _max_h = display_get_height()
            
            if _win_h == _max_h and _win_w == _max_w{
                window_set_fullscreen(false)
                global.settings.fullscreen = false
                return true
            }
        }
        else if window_get_fullscreen() == false and global.settings.fullscreen == false{
            var _win_w = window_get_width()
            var _win_h = window_get_height()

            if _win_w == 1024 and _win_h == 576{
                window_set_fullscreen(true)
                global.settings.fullscreen = true
                return true
            }
        }
        
        return false
    }
)

main_settings.reset_buttons.add(8,500-48-8,"RESET BOUNTIES",
    function (){
        var _names = variable_struct_get_names(global.bounty.list)
        for (var i = 0; i < array_length(_names); i++) {
        	global.bounty.list[$ _names[i]].rank = 0
        }
    }
)

main_settings.reset_buttons.add(746-256-8,500-48-8,"DELETE SAVE",
    function (){
        //TODO delete save when saving is added
        game_restart()
    }
)

hotkey_settings = {
    page: 0,
    max_page: 0,
    text: [
        "Sell tower",
        "Start wave / speed up",
        "Upgrade Left",
        "Upgrade Middle",
        "Upgrade Right",
        global.towers.dart_monkey.name,
        global.towers.tack_shooter.name,
        global.towers.boomerang_thrower.name,
        global.towers.sniper_monkey.name,
        global.towers.ninja_monkey.name,
        global.towers.bomb_tower.name,
        global.towers.sub_monkey.name,
        global.towers.charge_tower.name,
        global.towers.glue_gunner.name,
        global.towers.ice_monkey.name,
        global.towers.buccaneer.name,
        global.towers.engineer.name,
        global.towers.ace_monkey.name,
        global.towers.bloonchipper.name,
        global.towers.alchemist_monkey.name,
        global.towers.apprentice_monkey.name,
        global.towers.monkey_village.name,
        global.towers.banana_farm.name,
        global.towers.mortar_monkey.name,
        global.towers.dartling_gunner.name,
        global.towers.spike_factory.name,
        global.towers.heli_pilot.name,
        global.towers.plasma_monkey.name,
        global.towers.super_monkey.name,
        global.towers.road_spikes.name,
        global.towers.grilled_pineapple.name
    ],
    keys: variable_clone(global.settings.hotkeys),
    num: 0,
    replacing: -1,
    warning: noone, //noone,"replacing other"
    warning_time: 0,
    warning_bind_number: -1,
    new_key: -1,
    new_additional_key: -1,
    on_done_button: false,
    on_clear_button: false,
    on_cancel_button: false,
    mouse_on: -1,
    step:function (_x,_y){
        
        if warning_time>0
            warning_time--
        
        if replacing != -1{
            
            if keyboard_check_pressed(vk_anykey){
                var _changed = false
                if scr_is_additional_key(keyboard_lastkey){
                    if new_additional_key == keyboard_lastkey{
                        new_additional_key = -1
                        _changed = true
                    }
                    else{
                        new_additional_key = keyboard_lastkey
                        _changed = true
                    }
                }
                else {
                    if scr_correct_key(keyboard_lastkey){
                        new_key = keyboard_lastkey
                        _changed = true
                    }
                }
                
                if _changed == true{
                    warning = noone
                    warning_bind_number = -1
                    warning_time = 0
                }
            }
            
            var _cancel_pos = [room_width/2-200+16,room_height/2+32]
            
            if point_in_rectangle(mouse_x,mouse_y,_cancel_pos[0],_cancel_pos[1],_cancel_pos[0]+96,_cancel_pos[1]+32){
                on_cancel_button = true
                if mouse_check_button_pressed(mb_left){
                    global.gui_wait = 10
                    replacing = -1
                }
            }
            else {
            	on_cancel_button = false
            }
            
            var _reset_pos = [_cancel_pos[0]+96+37,_cancel_pos[1]]
            
            if point_in_rectangle(mouse_x,mouse_y,_reset_pos[0],_reset_pos[1],_reset_pos[0]+96,_reset_pos[1]+32){
                on_clear_button = true
                if mouse_check_button_pressed(mb_left){
                    new_additional_key = -1
                    new_key = -1
                }
            }
            else {
            	on_clear_button = false
            }
            
            var _done_pos = [_reset_pos[0]+96+37,_reset_pos[1]]
            
            if point_in_rectangle(mouse_x,mouse_y,_done_pos[0],_done_pos[1],_done_pos[0]+96,_done_pos[1]+32){
                on_done_button = true
                if mouse_check_button_pressed(mb_left){
                    var _found_same = false
                    var _found_number = -1
                    
                    for (var c = 0; c < num; c++) {
                        if c == replacing
                            continue
                        
                        var _key = keys[c]
                        
                        if is_array(_key){
                            if (_key[0] == new_additional_key and _key[1] == new_key){
                                _found_same = true
                                _found_number = c
                            }
                        }
                        else {
                        	if (_key == new_key and new_additional_key == -1){
                                _found_same = true
                                _found_number = c
                            }
                        }
                        
                    }
                    
                    
                    if _found_same == false{
                        var _mykey = new_key
                        
                        if new_additional_key != -1{
                            _mykey = [new_additional_key,new_key]
                        }
                        
                        keys[replacing] = _mykey
                        
                        replacing = -1
                    }
                    else {
                    	if warning == noone{
                            warning = 1
                            warning_time = 360
                            warning_bind_number = _found_number
                        }
                        else if warning == 1 and warning_time <= 340{
                            keys[_found_number] = -1
                            
                            var _mykey = new_key
                            
                            if new_additional_key != -1{
                                _mykey = [new_additional_key,new_key]
                            }
                            
                            keys[replacing] = _mykey
                            replacing = -1
                        }
                    }
                }
            }
            else {
            	on_done_button = false
            }
            
        }
        else {
            
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
            
            mouse_on = -1
            
            var _px = _x + 8
            var _py = _y + 75
            var _col = 0
            for (var i = 9*page; i < clamp( 9*(page+1),0,num ); i++) {
                var _hx = _px
                var _hy = _py+48*_col
                var _txt = text[i]
                var _key = keys[i]
                
                if point_in_rectangle(mouse_x,mouse_y,_hx,_hy,_hx+256,_hy+32){
                    mouse_on = _col
                    if mouse_check_button_pressed(mb_left){
                        replacing = i
                        warning = noone
                        warning_bind_number = -1
                        warning_time = 0
                        new_additional_key = -1
                        new_key = -1
                        mouse_on = -1
                        
                        if is_array(keys[i]){
                            new_additional_key = keys[i][0]
                            new_key = keys[i][1]
                        }
                        else {
                        	new_key = keys[i]
                        }
                        
                    }
                }
                
                _col++
            }
            
        }
    },
    draw:function (_x,_y){
        var _px = _x + 8
        var _py = _y + 75
        var _col = 0
        for (var i = 9*page; i < clamp( 9*(page+1),0,num ); i++) {
            var _hx = _px
            var _hy = _py+48*_col
            var _txt = text[i]
            var _key = keys[i]
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],mouse_on == _col)
        	draw_sprite_stretched(spr_button_settings,0,_hx,_hy,256,32)
            shader_reset()
            
            draw_set_halign(fa_middle) draw_set_font(font_general_12)
            
            if is_array(_key){
                var _htxt = ""
                
                for (var c = 0; c < array_length(_key); c++) {
                    _htxt += "\""+scr_get_key_name( _key[c] )+"\""
                    if c < array_length(_key)-1{
                        _htxt+="+"
                    }
                }
                
                draw_text(_hx+128,_hy+5, _htxt )
            }
            else {
                var _htxt = "NOT SET"
                
                if _key!=-1{
                    _htxt = "\""+scr_get_key_name( _key )+"\"" 
                }
                
                draw_text(_hx+128,_hy+5, _htxt)
            }
            
            draw_set_halign(fa_left) draw_set_font(font_general_15)
            
            draw_text(_hx + 256 + 16,_hy,_txt)
            
            _col++
        }
        
        if replacing != -1{
            draw_set_alpha(0.5)
            draw_rectangle_color(0,0,1024,576,c_black,c_black,c_black,c_black,false)
            draw_set_alpha(1)
            
            draw_sprite_stretched(spr_info_panel,0,room_width/2-200,room_height/2-100,400,200)
            
            draw_set_halign(fa_middle) draw_set_font(font_general_12)
            
            var _cancel_pos = [room_width/2-200+16,room_height/2+32]
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],on_cancel_button)
            draw_sprite_stretched(spr_button_settings,0,_cancel_pos[0],_cancel_pos[1],96,32)
            shader_reset()
            draw_text(_cancel_pos[0]+48,_cancel_pos[1]+5,"CANCEL")
            
            var _reset_pos = [_cancel_pos[0]+96+37,_cancel_pos[1]]
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],on_clear_button)
            draw_sprite_stretched(spr_button_settings,0,_reset_pos[0],_reset_pos[1],96,32)
            shader_reset()
            draw_text(_reset_pos[0]+48,_reset_pos[1]+5,"CLEAR")
            
            var _done_pos = [_reset_pos[0]+96+37,_reset_pos[1]]
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],on_done_button)
            draw_sprite_stretched(spr_button_settings,0,_done_pos[0],_done_pos[1],96,32)
            shader_reset()
            
            draw_text(_done_pos[0]+48,_done_pos[1]+5,"DONE")
            
            var _px = room_width/2-128
            var _py = room_height/2-16
            
            draw_text(_px+128,_py-48,"Changing key bind\n\""+text[replacing]+"\"")
            
            draw_sprite_stretched(spr_button_settings,0,_px,_py,256,32)
            
            if new_key == -1 and new_additional_key == -1{
                draw_text(_px+128,_py+5, "PRESS ANY KEY" )
            }
            else {
                var _htxt = ""
                
                if new_additional_key!=-1{
                    _htxt+="\""+scr_get_key_name(new_additional_key)+"\""+" + "
                }
                if new_key!=-1{
                    _htxt+="\""+scr_get_key_name(new_key)+"\""
                }
                
                draw_text(_px+128,_py+5, _htxt )
            }
            
            if warning!=noone and warning_time>0{
                if warning_time<=120{
                    var _alpha = warning_time/120
                    draw_set_alpha(_alpha)
                }
                
                var _warn_text = $"SAME KEY BIND FOUND FOR\n\"{text[warning_bind_number]}\"\nPRESSING DONE AGAIN WILL CLEAR IT"
                var _str_h = string_height(_warn_text)
                _px = room_width/2
                _py = room_height/2+32+96
                
                draw_sprite_stretched(spr_info_panel,0,_px-200,_py,400,_str_h+4)
            
                draw_text(_px,_py+2,_warn_text)
                
                draw_set_alpha(1)
            }
            
            draw_set_halign(fa_left) draw_set_font(font_general_15)
        }
        
        if page>0
            draw_sprite(spr_scroll_up,0,_x+746-64,_y+2)
        
        draw_sprite_stretched(spr_scroll_bar_thumb,0,_x+746-64+8,_y+2+32 + 372 * (page/max_page),SCROLL_THUMB_WIDTH,SCROLL_THUMB_HEIGHT)
        
        if page<max_page
            draw_sprite(spr_scroll_down,0,_x+746-64,_y+500-34)
        
    }
}



hotkey_settings.num = array_length(hotkey_settings.text)
hotkey_settings.max_page = ceil( hotkey_settings.num/9 )-1