global.current_bloon_points = global.bloon_points
global.current_monkey_money = global.monkey_money
global.current_bloon_souls = global.bloon_souls
global.current_trophies = global.trophies
global.current_goodie_points = global.goodie_points

resources = {
    rank_pos:[864,10],
    goodies_pos:[625,500],
    bloon_points_pos:[700,500],
    monkey_money_pos:[775,500],
    bloon_soul_pos:[850,500],
    trophies_pos:[925,500],
    valuables_ypos: 500,
    valuables_xpos: [ 925,850,775,700,625 ],
    xshift:0,
    draw_goodie_token:false,
    draw_goodie_exchange:false,
    draw_trophies:true,
    draw_bloon_souls:true,
    draw_monkey_money:true,
    draw_bloon_points:true,
    draw:function (){
        var _current_xpos = 0
        var _pos_x = 0
        
        draw_set_font(font_general_16)
        
        draw_set_halign(fa_right)
        
        if draw_trophies == true{
            _pos_x = valuables_xpos[_current_xpos]
            draw_sprite(spr_trophy_icon,0,_pos_x+xshift,valuables_ypos)
            draw_text_outline(_pos_x+60+xshift,valuables_ypos+48,c_black,COLOR_TROPHIES,round(global.current_trophies))
            _current_xpos++
        }
        
        if draw_bloon_souls == true{
            _pos_x = valuables_xpos[_current_xpos]
            draw_sprite(spr_bloon_soul_icon,0,_pos_x+xshift,valuables_ypos)
            draw_text_outline(_pos_x+60+xshift,valuables_ypos+48,c_black,COLOR_BLOONSOULS,round(global.current_bloon_souls))
            _current_xpos++
        }
        
        if draw_monkey_money == true{
            _pos_x = valuables_xpos[_current_xpos]
            draw_sprite(spr_monkey_money_icon,0,_pos_x+xshift,valuables_ypos)
            
            var _amount = round(global.current_monkey_money)
            
            if _amount>1_000 and _amount<1_000_000{
                _amount = $"{_amount/1_000}K"
            }
            else if _amount>1_000_000{
                _amount = $"{_amount/1_000_000}M"
            }
            
            draw_text_outline(_pos_x+60+xshift,valuables_ypos+48,c_black,COLOR_MONKEYMONEY,_amount)
            _current_xpos++
        }
        
        if draw_bloon_points == true{
            _pos_x = valuables_xpos[_current_xpos]
            draw_sprite(spr_bloons_point_icon,0,_pos_x+xshift,valuables_ypos)
            draw_text_outline(_pos_x+60+xshift,valuables_ypos+48,c_black,COLOR_BLOONPOINTS,round(global.current_bloon_points))
            _current_xpos++
        }
        
        if draw_goodie_token == true{
            _pos_x = valuables_xpos[_current_xpos]
            draw_sprite(spr_goodie_token,0,_pos_x+xshift,valuables_ypos)
            draw_text_outline(_pos_x+60+xshift,valuables_ypos+48,c_black,#fff200,round(global.goodie_points))
            _current_xpos++
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
        
        draw_set_font(font_general_20)
        
        var _rpos = rank_pos
        
        draw_set_halign(fa_left)
        
        draw_text_outline(_rpos[0],_rpos[1],c_black,COLOR_RANK,$"Rank:{global.rank}")
        
    }
}

if room == rm_goodies_menu{
    resources.draw_goodie_token = true
    resources.draw_goodie_exchange = true
    resources.xshift = -32
}
else if room == rm_towers_menu{
    resources.draw_bloon_souls = false
    resources.draw_monkey_money = false
    resources.draw_trophies = false
}