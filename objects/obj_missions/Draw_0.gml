var _row = 0
var _col = 0
var _start_i = 0
var _end_i = clamp(6,0,number)
if page>0{
    _start_i = 2*page
    _end_i = clamp(6+2*(page),0,number)
}
for (var i = _start_i; i < _end_i; i++) {
    
    var _x = 96 + 448*_row
    var _y = 16 + (184)*_col
    var _mission = list[i]
    var _icon = _mission.icon
    var _name = _mission.name
    var _desc = _mission.desc
    var _color = _mission.color
    var _mouse_on = (mouse_on == i)
    var _completed = _mission.completed
    
    if _completed == true{
        _desc += "\n" + mission_completed_text
    }
    
    var _desc_h = string_height_ext(_desc,16,356)
    
    shader_set(sh_replace_mission)
    
    var _r = HOVER_OUTLINE_R,_g = HOVER_OUTLINE_G,_b = HOVER_OUTLINE_B
    
    if _completed == true{
        if _mouse_on == false{
            _r = COMPLETED_OUTLINE_R
            _g = COMPLETED_OUTLINE_G
            _b = COMPLETED_OUTLINE_B
        }
    }
    
    shader_set_uniform_f( global.shaders.replace_mission[0],_r,_g,_b )
    shader_set_uniform_f( global.shaders.replace_mission[1],_color[0],_color[1],_color[2] )
    
    if _mouse_on == true or _completed == true
    shader_set_uniform_f( global.shaders.replace_mission[2],true )
    else 
    shader_set_uniform_f( global.shaders.replace_mission[2],false)
    
    draw_sprite_stretched(spr_mission_bar_bottom,0,_x,_y+72,363,_desc_h+18)
    draw_sprite_stretched(spr_mission_panel,0,_x,_y,400,72)
    draw_sprite_stretched(spr_mission_panel_top,0,_x-24,_y-6,84,84)
    shader_reset()
    
    draw_sprite(_icon,0,_x-24,_y-6)
    
    draw_set_font(font_general_16)
    draw_set_color(c_black)
    draw_text_outline(_x+64,_y+24,c_black,c_white,_name)
    
    draw_set_font(font_general_12)
    draw_text_ext(_x+3,_y+84,_desc,16,356)
    
    draw_set_color(c_white)
    _row++
    if _row>1{
        _row = 0
        _col++
    }
    
}

draw_sprite_stretched(spr_scroll_bar,0,1024-64,0,64,576)
if page>0
draw_sprite(spr_scroll_up,0,1024-64,16)

draw_sprite_stretched(spr_scroll_bar_thumb,0,1024-56,48+2+416*(page/max_page),SCROLL_THUMB_WIDTH,SCROLL_THUMB_HEIGHT)

if page<max_page
draw_sprite(spr_scroll_down,0,1024-64,576-48)
