enum BTYPES {
    NORMAL,
    BLOON_POINTS
}

buyables = {
    icon:[spr_buy_squirrel,spr_buy_bloonbury_bush,spr_buy_sprinkler,spr_buy_monkey_nurse,spr_buy_banana_mobile,spr_buy_bloon_points],
    cost:[60,70,100,90,100,400],
    name:["Angry Squirrel","Bloonbury Bush","Sprinkler","Monkey Nurse","Banana-Mobile","4 Bloon Points"],
    info:[
        ["Gets angry when bloons leak","Gets angrier over time","Throws bigger acorns","Gets furious and shoots up a storm"],
        ["Pops bloons that pass by","Regrows thorns as the wave passes by","Shoots throns out at the bloons","Shoots a powerful vine attack",],
        ["Placed on land and water\nStores and shoots water","Gains more water","More Nozzles","Overfills the sprinkler"],
        ["Heals stun & gives lives","Stronger Healing and more lives","Even stronger healing and more lives","Heals + Lives, Can prevent death"],
        ["Drives and sucks up Bananas","Better Fuel Efficiency","Sharp banana Peels","Turbo Jet Engines"],
        [""]
    ],
    agent_id:["squirrel","bloonbury_bush","sprinkler","monkey_nurse","banana_mobile",-1],
    buy_type:[BTYPES.NORMAL,BTYPES.NORMAL,BTYPES.NORMAL,BTYPES.NORMAL,BTYPES.NORMAL,BTYPES.BLOON_POINTS],
    level:[0,0,0,0,0,0],
    mouse_on:[false,false,false,false,false,false],
    num:6,
    step:function (){
        var _row = 0
        var _col = 0
        for (var i = 0; i < num; i++) {
            var _x = 80+480*_row
            var _y = 64+160*_col
            
            _x+=8
            _y+=8
            
            if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+349,_y+94){
                mouse_on[i] = true
                if mouse_check_button_pressed(mb_left) and global.monkey_money>=cost[i]{
                    global.monkey_money-=cost[i]
                    var _id = agent_id[i]
                    var _tp = buy_type[i]
                    switch (_tp) {
                    	case BTYPES.NORMAL:
                            if _id!=-1{
                                global.agents[$ _id]++
                            }
                        break;
                        case BTYPES.BLOON_POINTS:
                            global.bloon_points+=4
                        break;
                    }

                }
            }
            else {
            	mouse_on[i] = false
            }
            
            _row++
            if _row>1{
                _col++
                _row=0
            }
        }
    },
    draw:function (){
        var _row = 0
        var _col = 0
        draw_set_color(c_black)
        draw_set_font(font_general_12)
        for (var i = 0; i < num; i++) {
            level[i]+=0.01111
            var _x = 80+480*_row
            var _y = 64+160*_col
            var _icon = icon[i]
            var _cost = $"x{cost[i]}"
            var _cost_w = string_width(_cost)
            var _name = name[i]
            var _info = info[i]
            var _info_number = array_length(_info)
            var _id = agent_id[i]
            var _mouse_on = mouse_on[i]
            
            draw_sprite(spr_agents_buy_back_panel,0,_x,_y)
            _x+=8
            _y+=8
            
            shader_set(sh_replace)
            shader_set_uniform_f( global.shaders.replace[0],1,1,1 )
            shader_set_uniform_f( global.shaders.replace[1],_mouse_on )
            draw_sprite(spr_agents_buy_panel,0,_x,_y)
            shader_reset()
            
            draw_sprite(_icon,0,_x+47,_y+47)
            
            draw_text(_x+108,_y+12,_name)
            
            if _info_number>0{
                var _lvl = floor(level[i])
                if _lvl>(_info_number-1){
                    _lvl = 0
                    level[i] = 0
                }
                var _txt = ""
                if _lvl>0{
                    _txt = $"Level {_lvl+1}: "
                }
                draw_text_ext(_x+108,_y+12+24,_txt+_info[_lvl],18,236)
            }
            
            draw_set_halign(fa_right)
            draw_text(_x+342,_y+12,_cost)
            draw_set_halign(fa_left)
            draw_sprite(spr_buy_panel_cash,0,_x+342-_cost_w,_y+12)
            
            if _id!=-1{
                var _num = global.agents[$ _id]
                var _txt = $"You have: {_num}"
                var _txt_w = string_width(_txt)
                
                shader_set(sh_replace)
                shader_set_uniform_f( global.shaders.replace[0],1,1,1 )
                shader_set_uniform_f( global.shaders.replace[1],_mouse_on )
                draw_sprite_stretched(spr_buy_amount_panel,0,_x+108,_y+85,_txt_w+8,24)
                shader_reset()
                
                draw_text(_x+112,_y+85,_txt)
            }
            
            _row++
            if _row>1{
                _col++
                _row=0
            }
        }
        draw_set_color(c_white)
    }
}

instance_create_depth(4,5,depth,obj_exit_button)