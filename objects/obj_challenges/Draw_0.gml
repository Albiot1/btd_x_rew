var _row = 0
var _col = 0

draw_set_color(c_black)
for (var i = 4*page; i < clamp(4*(page+1),0,number); i++) {
    
    var _x = 96 + 448*_row
    var _y = 64 + (192+64)*_col
    var _challenge = list[i]
    var _type = _challenge.type
    var _name = _challenge.name
    var _desc = _challenge.desc
    var _creator = _challenge.creator
    var _completed = _challenge.complete
    var _mouse_on = (mouse_on == i)
    
    var _r = HOVER_OUTLINE_R, _g = HOVER_OUTLINE_G, _b = HOVER_OUTLINE_B;
    
    var _outline = false
    
    if _completed == true{
        _outline = true
        
        if _mouse_on == false{
            _r = COMPLETED_OUTLINE_R
            _g = COMPLETED_OUTLINE_G
            _b = COMPLETED_OUTLINE_B
        }
    }
    
    if _mouse_on == true{
        _outline = true
    }
    
    shader_set(sh_replace)
    shader_set_uniform_f( global.shaders.replace[0],_r,_g,_b )
    shader_set_uniform_f( global.shaders.replace[1],_outline )
    draw_sprite_stretched(spr_challenge_bar_bottom,0,_x,_y,376,155)
    draw_sprite_stretched(spr_challenge_bar_top,0,_x-24,_y-24,84,84)
    shader_reset()
    
    draw_sprite(spr_challenges_icons,_type,_x-24,_y-24)
    
    draw_set_font(font_general_16)
    draw_text(_x+60,_y+2,_name)
    draw_set_font(font_general_12)
    draw_text_ext(_x+4,_y+62,_desc,16,372)
    
    if _completed == false{
        draw_text(_x+28,_y+155+8+4,challenge_not_completed_text)
        draw_sprite(spr_challenge_completion_marks,COMPLETION_MARK.NOT_COMPLETED,_x,_y+155+8)
    }
    else {
        if _type == CTYPE.NORMAL{
        draw_text(_x+28,_y+155+8+4,challenge_completed_text[0])
        draw_sprite(spr_challenge_completion_marks,COMPLETION_MARK.COMPLETED,_x,_y+155+8)
        }
        else if _type == CTYPE.TIMED{
            draw_text(_x+28,_y+155+8+4,challenge_completed_text[1]+ string(scr_format_time(_challenge.time)) )
            draw_sprite(spr_challenge_completion_marks,COMPLETION_MARK.COMPLETED_TIME,_x,_y+155+8)
        }
    }
    
    
    if _creator!=-1{
        draw_set_halign(fa_right)
        draw_text(_x+376-6,_y+155-22,challenge_creator_text+_creator)
        draw_set_halign(fa_left)
    }
    
    _row++
    if _row>1{
        _row = 0
        _col++
    }
    
}
draw_set_color(c_white)

draw_sprite_stretched(spr_scroll_bar,0,1024-64,0,64,576)

if page>0
draw_sprite(spr_scroll_up,0,1024-64,16)

draw_sprite_stretched(spr_scroll_bar_thumb,0,1024-56,48+2+416*(page/max_page),SCROLL_THUMB_WIDTH,SCROLL_THUMB_HEIGHT)

if page<max_page
draw_sprite(spr_scroll_down,0,1024-64,576-48)