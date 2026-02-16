resources = {
    rank_pos:[864,10],
    goodies_pos:[625,500],
    bloon_points_pos:[700,500],
    monkey_money_pos:[775,500],
    bloon_soul_pos:[850,500],
    trophies_pos:[925,500],
    xshift:0,
    draw_goodie_token:false,
    draw_goodie_exchange:false,
    draw:function (){
        draw_set_font(font_general_16)
        
        draw_set_halign(fa_right)
        
        var _pos = bloon_points_pos
        draw_sprite(spr_bloons_point_icon,0,_pos[0]+xshift,_pos[1])
        draw_text_outline(_pos[0]+60+xshift,_pos[1]+48,c_black,#009fff,global.bloon_points)
        
        _pos = monkey_money_pos
        draw_sprite(spr_monkey_money_icon,0,_pos[0]+xshift,_pos[1])
        draw_text_outline(_pos[0]+60+xshift,_pos[1]+48,c_black,#00c000,global.monkey_money)
        
        _pos = bloon_soul_pos
        draw_sprite(spr_bloon_soul_icon,0,_pos[0]+xshift,_pos[1])
        draw_text_outline(_pos[0]+60+xshift,_pos[1]+48,c_black,#c40000,global.bloon_souls)
        
        _pos = trophies_pos
        draw_sprite(spr_trophy_icon,0,_pos[0]+xshift,_pos[1])
        draw_text_outline(_pos[0]+60+xshift,_pos[1]+48,c_black,#ffff00,global.trophies)
        
        if draw_goodie_exchange == true{
            _pos = [64,500]
            draw_sprite(spr_trophy_icon,0,_pos[0],_pos[1])
            draw_text_outline(_pos[0]+60+18,_pos[1]+24,c_black,c_white,10)
            draw_text_outline(_pos[0]+60+32,_pos[1]+24,c_black,c_white,"=")
            
            _pos = [168,500]
            draw_sprite(spr_goodie_token,0,_pos[0],_pos[1])
            draw_text_outline(_pos[0]+4,_pos[1]+24,c_black,c_white,1)
        }
        
        if draw_goodie_token == true{
            _pos = goodies_pos
            draw_sprite(spr_goodie_token,0,_pos[0]+xshift,_pos[1])
            draw_text_outline(_pos[0]+60+xshift,_pos[1]+48,c_black,#fff200,global.goodie_points)
        }
        
        draw_set_font(font_general_20)
        
        var _rpos = rank_pos
        
        draw_set_halign(fa_left)
        
        draw_text_outline(_rpos[0],_rpos[1],c_black,c_aqua,$"Rank:{global.rank}")
        
    }
}

if room == rm_goodies_menu{
    resources.draw_goodie_token = true
    resources.draw_goodie_exchange = true
    resources.xshift = -32
}
