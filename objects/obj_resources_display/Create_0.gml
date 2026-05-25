global.current_bloon_points = global.bloon_points
global.current_monkey_money = global.monkey_money
global.current_bloon_souls = global.bloon_souls
global.current_trophies = global.trophies
global.current_goodie_points = global.goodie_points

resources = {
    rank_text:"",
    rank_pos:[864,10],
    goodies_pos:0,
    bloon_points_pos:0,
    monkey_money_pos:0,
    bloon_soul_pos:0,
    trophies_pos:0,
    valuables_ypos: 500,
    valuables_xpos: [ 925,850,775,700,625 ],
    xshift:0,
    draw_goodie_token:false,
    draw_goodie_exchange:false,
    draw_trophies:true,
    draw_bloon_souls:true,
    draw_monkey_money:true,
    draw_bloon_points:true,
    draw_rank:true,
    update_positions:function (){
        var _current_xpos = 0
        
        if draw_trophies == true{
            trophies_pos = valuables_xpos[_current_xpos]
            _current_xpos++
        }
        
        if draw_bloon_souls == true{
            bloon_soul_pos = valuables_xpos[_current_xpos]
            _current_xpos++
        }
        
        if draw_monkey_money == true{
            monkey_money_pos = valuables_xpos[_current_xpos]
            _current_xpos++
        }
        
        if draw_bloon_points == true{
            bloon_points_pos = valuables_xpos[_current_xpos]
            _current_xpos++
        }
        
        if draw_goodie_token == true{
            goodies_pos = valuables_xpos[_current_xpos]
        }
        
    },
    draw:function (){
        
        draw_set_font(font_general_16)
        
        draw_set_halign(fa_right)
        
        if draw_trophies == true{
            draw_sprite(spr_trophy_icon,0,trophies_pos+xshift,valuables_ypos)
            draw_text_outline(trophies_pos+60+xshift,valuables_ypos+48,c_black,COLOR_TROPHIES,round(global.current_trophies))
        }
        
        if draw_bloon_souls == true{
            draw_sprite(spr_bloon_soul_icon,0,bloon_soul_pos+xshift,valuables_ypos)
            draw_text_outline(bloon_soul_pos+60+xshift,valuables_ypos+48,c_black,COLOR_BLOONSOULS,round(global.current_bloon_souls))
        }
        
        if draw_monkey_money == true{
            draw_sprite(spr_monkey_money_icon,0,monkey_money_pos+xshift,valuables_ypos)
            
            var _amount = scr_format_number( round(global.current_monkey_money) )
            
            draw_text_outline(monkey_money_pos+60+xshift+8,valuables_ypos+48,c_black,COLOR_MONKEYMONEY,_amount)
        }
        
        if draw_bloon_points == true{
            draw_sprite(spr_bloons_point_icon,0,bloon_points_pos+xshift,valuables_ypos)
            draw_text_outline(bloon_points_pos+60+xshift,valuables_ypos+48,c_black,COLOR_BLOONPOINTS,round(global.current_bloon_points))
        }
        
        if draw_goodie_token == true{
            draw_sprite(spr_goodie_token,0,goodies_pos+xshift,valuables_ypos)
            draw_text_outline(goodies_pos+60+xshift,valuables_ypos+48,c_black,#fff200,round(global.goodie_points))
        }
        
        if draw_goodie_exchange == true{
            var _gpos_pos = [64,500]
            draw_sprite(spr_trophy_icon,0,_gpos_pos[0],_gpos_pos[1])
            draw_text_outline(_gpos_pos[0]+60+18,_gpos_pos[1]+24,c_black,c_white,10)
            draw_text_outline(_gpos_pos[0]+60+32,_gpos_pos[1]+24,c_black,c_white,"=")
            
            _gpos_pos = [168,500]
            draw_sprite(spr_goodie_token,0,_gpos_pos[0],_gpos_pos[1])
            draw_text_outline(_gpos_pos[0]+4,_gpos_pos[1]+24,c_black,c_white,1)
        }
        
        if draw_rank == true{
            draw_set_font(font_general_20)
            
            var _rpos = rank_pos
            
            draw_set_halign(fa_left)
            
            draw_text_outline(_rpos[0]+xshift,_rpos[1],c_black,COLOR_RANK,rank_text)
        }
        
        draw_set_halign(fa_left)
        
    }
}

switch (room) {
	case rm_goodies_menu:
        resources.draw_goodie_token = true
        resources.draw_goodie_exchange = true
        resources.draw_bloon_souls = false
        resources.draw_monkey_money = false
        resources.draw_bloon_points = false
        resources.xshift = -32
    break;
    case rm_medals_menu:
        resources.draw_goodie_token = true
        resources.draw_bloon_souls = false
        resources.xshift = -32
    break;
    case rm_towers_menu:
        resources.draw_bloon_souls = false
        resources.draw_monkey_money = false
        resources.draw_trophies = false
    break;
    case rm_agent_menu:
        resources.draw_bloon_souls = false
        resources.draw_rank = false
        resources.draw_trophies = false
    break;
}

resources.rank_text = scr_text_format_insert( scr_get_translation("resources_rank_text"),[global.rank] )
resources.update_positions()