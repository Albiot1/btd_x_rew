enum GTYPE {
    BLOON,
    MONKEY,
    SPECIAL
}

goodies = {
    desc:[],
    icon:[],
    scale:[],
    mid:[],
    type:[],
    num:0,
    page:0,
    max_page:0,
    mouse_on:[],
    default_text:"Spend 1 Goodie Token to Unlock",
    add:function (_description,_icon,_icon_scale,_id,_type){
        array_push(desc,_description)
        array_push(icon,_icon)
        array_push(scale,_icon_scale)
        array_push(mid,_id)
        array_push(type,_type)
        array_push(mouse_on,false)
        num++
    },
    step:function (){
        
        var _row = 0
        var _col = 0
        var _start_i = 0
        var _end_i = clamp(8,0,num)
        if page>0{
            _start_i = 2*page
            _end_i = clamp(8+2*(page),0,num)
        }
        for (var i = _start_i; i < _end_i; i++) {
            
            var _x = 32 + 478*_row
            var _y = 96 + (96)*_col
            var _type = type[i]
            var _id = mid[i]
            
            var _unlocked = false
            var _active = false
            
            if _id!=-1{
                if global.goodies[$ _id].unlocked == true
                    _unlocked = true
                if global.goodies[$ _id].active == true
                    _active = true
            }
            
            if point_in_rectangle(mouse_x,mouse_y,_x-18,_y-6,_x+435,_y+78){
                mouse_on[i] = true
                if mouse_check_button_pressed(mb_left){
                    if global.goodies[$ _id].unlocked == false{
                        global.goodies[$ _id].unlocked = true
                    }
                    else if global.goodies[$ _id].unlocked == true{
                        if global.goodies[$ _id].active == false{
                            
                            global.goodies[$ _id].active = true
                            
                            if _type != GTYPE.SPECIAL{
                                for (var c = 0; c < num; c++) {
                                    var _ch_id = mid[c]
                                    var _ch_tp = type[c]
                                    
                                    if c==i or _ch_tp!=_type continue
                                    
                                    if global.goodies[$ _ch_id].unlocked == false
                                        continue
                                    else{
                                        if global.goodies[$ _ch_id].active == true{
                                            global.goodies[$ _ch_id].active = false
                                        }
                                    }
                                    
                                }
                            }
                            
                        }
                        else {
                        	global.goodies[$ _id].active = false
                        }
                    }
                }
            }
            else {
            	mouse_on[i] = false
            }
            
            _row++
            if _row>1{
                _row = 0
                _col++
            }
            
        }
        
        if page>0{
            var _x = 1024-64
            var _y = 16
            if (point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left)) or mouse_wheel_up(){
                page-=1
            }
        }
        if page<max_page{
            var _x = 1024-64
            var _y = 576-48
            if (point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left)) or mouse_wheel_down(){
                page+=1
            }
        }

    },
    draw:function (){
        
        var _row = 0
        var _col = 0
        var _start_i = 0
        var _end_i = clamp(8,0,num)
        if page>0{
            _start_i = 2*page
            _end_i = clamp(8+2*(page),0,num)
        }
        for (var i = _start_i; i < _end_i; i++) {
            
            var _x = 32 + 478*_row
            var _y = 96 + (96)*_col
            var _type = type[i]
            var _desc = desc[i]
            var _icon = icon[i]
            var _icon_scale = scale[i]
            var _id = mid[i]
            var _mouse_on = mouse_on[i]
            
            var _unlocked = false
            var _active = false
            
            if _id!=-1{
                if global.goodies[$ _id].unlocked == true
                    _unlocked = true
                if global.goodies[$ _id].active == true
                    _active = true
            }
            
            shader_set(sh_replace)
            
            var _r = 1
            var _g = 1
            var _b = 1
            
            if _unlocked == true{
                if _active == true{
                    if _mouse_on == true{
                        _r = 0.47 _g = 1 _b = 0.47
                    }
                    else {
                    	_r = 0 _g = 0.54 _b = 0
                    }
                }
                else {
                	if _mouse_on == true{
                        _r = 1 _g = 0.47 _b = 0.47
                    }
                    else {
                        _r = 0.54 _g = 0 _b = 0
                    }
                }
            }

            shader_set_uniform_f( global.shaders.replace[0],_r,_g,_b )
            
            if (_mouse_on == true or _unlocked == true)
            shader_set_uniform_f( global.shaders.replace[1],true )
            else 
            shader_set_uniform_f( global.shaders.replace[1],false )
            draw_sprite_stretched(spr_goodie_panel,0,_x-8,_y,445,72)
            draw_sprite_stretched(spr_goodie_panel_top,0,_x-18,_y-6,84,84)
            shader_reset()
            
            if _unlocked == true{
                draw_sprite_ext(_icon,_type,_x+24,_y+32,_icon_scale,_icon_scale,0,c_white,1)
            }
            else {
            	draw_sprite_ext(spr_goodie_token,_type,_x-8,_y+4,1,1,0,c_white,1)
            }
            
            draw_set_color(c_black)
            draw_set_font(font_general_12)
            
            if _unlocked == true{
                draw_text_ext(_x+68,_y+4,_desc,16,370)
            }
            else {
            	draw_text(_x+68,_y+4,default_text)
            }
            
            
            draw_set_color(c_white)
            _row++
            if _row>1{
                _row = 0
                _col++
            }
            
        }
        
        draw_sprite_stretched(spr_scroll_bar,0,1024-64,0,64,576)
        if page>0
        draw_sprite(spr_goodies_scroll_up,0,1024-64,16)
        if page<max_page
        draw_sprite(spr_goodies_scroll_down,0,1024-64,576-48)
        
    }
}

goodies.add(
    "Monkeys Wear a Cap",
    spr_cap_goodie,
    1,
    "monkey_cap",
    GTYPE.MONKEY
)
goodies.add(
    "Bloons look Mean",
    spr_mean_bloons_goodie,
    1,
    "bloon_mean",
    GTYPE.BLOON
)
goodies.add(
    "Monkeys Wear a Beanie",
    spr_beanie_goodie,
    1,
    "monkey_beanie",
    GTYPE.MONKEY
)
goodies.add(
    "Bloons look Emoji",
    spr_emoji_bloon_goodie,
    1,
    "bloon_emoji",
    GTYPE.BLOON
)
goodies.add(
    "Monkeys Wear a Party Hat",
    spr_party_hat_goodie,
    1,
    "monkey_party_hat",
    GTYPE.MONKEY
)
goodies.add(
    "Bloons look Scary",
    spr_scary_bloons_goodie,
    1,
    "bloon_scary",
    GTYPE.BLOON
)
goodies.add(
    "Monkeys Wear a Cape",
    spr_super_cape_goodie,
    1,
    "monkey_super_cape",
    GTYPE.MONKEY
)
goodies.add(
    "Bloons look Silly",
    spr_silly_bloons_goodie,
    1,
    "bloon_silly",
    GTYPE.BLOON
)
goodies.add(
    "Monkeys Look like Rams",
    spr_ram_goodie,
    1,
    "monkey_ram",
    GTYPE.MONKEY
)
goodies.add(
    "Bloons look Computery",
    spr_computery_bloons_goodie,
    1,
    "bloon_computery",
    GTYPE.BLOON
)
goodies.add(
    "Loving Family Gives Extra Vitality\nShows up at 50K+ Score",
    spr_love_goodie,
    1,
    "love",
    GTYPE.SPECIAL
)
goodies.add(
    "This Blimp is pretty Bad",
    spr_bad_goodie,
    0.4,
    "bad_blimp",
    GTYPE.SPECIAL
)
goodies.add(
    "Lit Moab gives money when hit\nShows up at 75K+ Score",
    spr_lit_moab_goodie,
    0.4,
    "lit_moab",
    GTYPE.SPECIAL
)
goodies.add(
    "Super Storm?\nShows up atk 100K+ Score",
    spr_super_storm_goodie,
    1,
    "super_storm",
    GTYPE.SPECIAL
)
goodies.add(
    "Unidentified Laughing Object\nGives Extra Cash at start",
    spr_ulo_goodie,
    1,
    "ulo",
    GTYPE.SPECIAL
)

//goodies.max_page = ceil(goodies.num/8)-1
goodies.max_page = ceil((goodies.num-6)/2)-1

exit_button = {
    pos:[4,5],
    mouse_on:false,
    step:function (){
        var _x = pos[0]
        var _y = pos[1]
        if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+64){
            mouse_on = true
            if mouse_check_button_pressed(mb_left){
                room_goto(rm_main_menu)
            }
        }
        else {
        	mouse_on = false
        }
    },
    draw:function (){
        shader_set(sh_replace)
        shader_set_uniform_f( global.shaders.replace[0],1,1,1 )
        if mouse_on == false
        shader_set_uniform_f( global.shaders.replace[1],false )
        else 
        shader_set_uniform_f( global.shaders.replace[1],true )
        draw_sprite(spr_agent_menu_exit_button,0,pos[0],pos[1])
        shader_reset()
    }
}