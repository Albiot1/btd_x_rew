enum BTYPES {
    BLOON_POINTS,
    AGENT
}

draw_set_font(font_general_12)

buyables = {
    icon:[],
    cost:[],
    cost_txt:[],
    cost_width:[],
    name:[],
    desc:[],
    type:[],
    mouse_on:-1,
    bought_amount:[],
    amount_width:[],
    affordable:[],
    
    data:[],
    number:0,
    
    start_x:80,
    start_y:64,
    panel_w:349,
    panel_h:94,
    spacing_w:480,
    spacing_h:160,
    
    icon_x:47,
    icon_y:47,
    name_x:108,
    name_y:12,
    desc_x:108,
    desc_y:32,
    cost_x:342,
    cost_y:12,
    amount_x:108,
    amount_y:85,
    amount_h:24,
    amount_padding:8,
    agent_info_x:109,
    agent_info_y:7,
    agent_info_w:238,
    
    level_text:scr_get_translation("buyable_info_0"),
    amount_text:scr_get_translation("buyable_info_1"),
    agent_info_text:scr_get_translation("buyable_agent_info"),
    
    add:function (_icon,_id,_type,_cost,_data = {}){
        switch (_type) {
            case BTYPES.BLOON_POINTS:
                
                array_push(bought_amount,0)
                array_push(amount_width,0)
                
                array_push(name,scr_text_format_insert( scr_get_translation($"buyable_{_id}_name"),[_data.amount] ))
                
            break;
        	case BTYPES.AGENT: 
                
                var _amount = global.agents[$ _data.agent_id]
                array_push(bought_amount,_amount)
                array_push(amount_width,string_width( amount_text + string(_amount) ) + amount_padding)
                _data.info_level = 0
                _data.info = scr_get_translation($"buyable_{_id}_info")
                _data.max_info_level = array_length(_data.info)-1
                
                array_push(name, scr_get_translation($"buyable_{_id}_name") )
                
            break;
        }
        
        array_push(icon,_icon)
        
        array_push(desc, scr_get_translation($"buyable_{_id}_desc") )
        array_push(type,_type)
        array_push(cost,_cost)
        var _ctxt = $"x{_cost}"
        array_push(cost_txt,_ctxt)
        array_push(cost_width,string_width( _ctxt ))
        array_push(affordable,false)
        array_push(data,_data)
        
        number++
    },
    
    update_affordability:function (){
        for (var i = 0; i < number; i++) {
        	if global.monkey_money >= cost[i]{
                affordable[i] = true
            }
            else {
            	affordable[i] = false
            }
        }
    },
    
    step:function (){
        mouse_on = -1
        
        var _row = 0
        var _col = 0
        for (var i = 0; i < number; i++) {
            var _x = (start_x + spacing_w * _row) + 8
            var _y = (start_y + spacing_h * _col) + 8
            
            if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+panel_w,_y+panel_h){
                mouse_on = i
                
                switch (type[i]) {
                    case BTYPES.AGENT: 
                        
                        if mouse_wheel_down() and data[i].info_level<data[i].max_info_level{
                            data[i].info_level++
                        }
                        if mouse_wheel_up() and data[i].info_level>0{
                            data[i].info_level--
                        }
                        
                    break;
                }
                
                if mouse_check_button_pressed(mb_left) and affordable[i] == true{
                    var _data = data[i]
                    
                    switch (type[i]) {
                    	case BTYPES.AGENT: 
                            
                            draw_set_font(font_general_12)
                            
                            global.agents[$ _data.agent_id] += _data.amount
                            bought_amount[i] += _data.amount
                            var _amount = bought_amount[i]
                            
                            amount_width[i] = string_width( amount_text + string(_amount) ) + amount_padding
                            
                        break;
                        case BTYPES.BLOON_POINTS: 
                            
                            global.bloon_points += _data.amount
                            
                            var _cx = _x + icon_x + irandom_range(-32,32)
                            var _cy = _y + icon_y + irandom_range(-32,32)
                            var _nx = obj_resources_display.resources.bloon_points_pos + 32
                            var _ny = obj_resources_display.resources.valuables_ypos + 32
                            
                            repeat ( _data.amount )
                            with instance_create_depth(_cx,_cy,-1,obj_fake_resource){
                                next_x = _nx
                                next_y = _ny
                            }
                            
                        break;
                    }
                    
                    var _cx = obj_resources_display.resources.monkey_money_pos+34
                    var _cy = obj_resources_display.resources.valuables_ypos+34
                    var _nx = _x + cost_x - cost_width[i] + irandom_range(-9,9)
                    var _ny = _y + cost_y + 9 + irandom_range(-4,4)
                    with instance_create_depth(_cx,_cy,-1,obj_fake_resource){
                        sprite_index = spr_monkey_money_icon_fake
                        next_x = _nx
                        next_y = _ny
                    }
                    global.monkey_money-=cost[i]
                    update_affordability()
                }
            }
            
            _row++
            if _row>1{
                _row = 0
                _col++
            }
        }
    },
    
    draw:function (){
        
        draw_set_color(c_black)
        draw_set_font(font_general_12)
        
        var _row = 0
        var _col = 0
        
        var _show_agent_info = -1
        var _agent_info_pos = [ 0,0 ]
        
        for (var i = 0; i < number; i++) {
            var _x = start_x + spacing_w * _row
            var _y = start_y + spacing_h * _col
            
            var _icon = icon[i]
            var _type = type[i]
            var _name = name[i]
            var _desc = desc[i]
            var _mouse_on = (mouse_on == i)
            var _cost = cost[i]
            var _cost_w = cost_width[i]
            var _afforded = affordable[i]
            
            draw_sprite(spr_agents_buy_back_panel,0,_x,_y)
            _x+=8
            _y+=8
            
            shader_set(sh_replace)
            shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
            shader_set_uniform_f( global.shaders.replace[1],_mouse_on)
            draw_sprite(spr_agents_buy_panel,0,_x,_y)
            shader_reset()
            
            //icon
            if !_afforded{
                shader_set(sh_grayscale)
                draw_sprite(_icon,0,_x+icon_x,_y+icon_y)
                shader_reset()
            }
            else {
            	draw_sprite(_icon,0,_x+icon_x,_y+icon_y)
            }
            
            //info
            draw_text(_x+name_x,_y+name_y,_name)
            draw_text_ext(_x+desc_x,_y+desc_y,_desc,18,236)
            //
            
            //price
            var _price_color = c_black
            
            if !_afforded{
                _price_color = c_red
            }
            
            draw_set_halign(fa_right)
            draw_text_color(_x+cost_x,_y+cost_y,_cost,_price_color,_price_color,_price_color,_price_color,1)
            draw_set_halign(fa_left)
            draw_sprite(spr_buy_panel_cash,0,_x+cost_x-_cost_w,_y+cost_y)
            //
            
            switch (_type) {
            	case BTYPES.AGENT:
                    
                    var _num = bought_amount[i]
                    var _txt = amount_text + string(_num)
                    var _txt_w = amount_width[i]
                    
                    shader_set(sh_replace)
                    shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
                    shader_set_uniform_f( global.shaders.replace[1],_mouse_on )
                    draw_sprite_stretched(spr_buy_amount_panel,0,_x+amount_x,_y+amount_y,_txt_w,amount_h)
                    shader_reset()
                    
                    draw_text(_x+amount_x+4,_y+amount_y,_txt)
                    
                    if _mouse_on{
                        _show_agent_info = i
                        _agent_info_pos[0] = _x + agent_info_x
                        _agent_info_pos[1] = _y + agent_info_y
                    }
                    
                break;
            }
            
            _row++
            if _row>1{
                _row = 0
                _col++
            }
        }
        
        if _show_agent_info != -1{
            var _data = data[_show_agent_info]
            var _lvl = _data.info_level
            var _info = agent_info_text + " (" + string(_lvl+1) + "/" + string(_data.max_info_level+1) + ")\n" + _data.info[_lvl]
            
            var _max_str_w = agent_info_w - 12
            var _str_h = string_height_ext(_info,24,_max_str_w) + 8
            
            draw_sprite_stretched(spr_buy_top_info_panel,0,_agent_info_pos[0],_agent_info_pos[1]-_str_h,agent_info_w,_str_h)
            
            draw_text_ext(_agent_info_pos[0]+6,_agent_info_pos[1] - _str_h + 4,_info,24,_max_str_w)
        }
        
        draw_set_color(c_white)
    }
}

buyables.add(spr_buy_squirrel,0,BTYPES.AGENT,60,{ agent_id:"squirrel",amount:1 })
buyables.add(spr_buy_bloonbury_bush,1,BTYPES.AGENT,70,{ agent_id:"bloonbury_bush",amount:1 })
buyables.add(spr_buy_sprinkler,2,BTYPES.AGENT,100,{ agent_id:"sprinkler",amount:1 })
buyables.add(spr_buy_monkey_nurse,3,BTYPES.AGENT,90,{ agent_id:"monkey_nurse",amount:1 })
buyables.add(spr_buy_banana_mobile,4,BTYPES.AGENT,100,{ agent_id:"banana_mobile",amount:1 })
buyables.add(spr_buy_bloon_points,5,BTYPES.BLOON_POINTS,400,{ amount:4 })

buyables.update_affordability()

instance_create_depth(4,5,depth,obj_exit_button)