var _row = 0
var _col = 0
for (var i = 8*page; i < clamp(8*(page+1),0,bounties_num); i++) {
    
    var _x = 116 + 216*_row
    var _y = 48 + (192)*_col
    var _bounty = bounties[i]
    var _mouse_on = _bounty.mouse_on
    var _cage = _bounty.cage
    var _max_rank = _bounty.max_rank
    var _rank = _bounty.current_rank
    
    if !surface_exists(_cage.surface){
        _cage.surface = surface_create(109,106)
    }
    
    surface_set_target(_cage.surface)
    
    draw_sprite(spr_bounty_cage_background,0,0,0)
    draw_sprite(_cage.icon,0,_cage.icon_pos[0],_cage.icon_pos[1])
    gpu_set_blendmode(bm_subtract)
    draw_sprite(spr_cage_subtract_zone,0,0,0)
    gpu_set_blendmode(bm_normal)
    
    surface_reset_target()
    
    draw_surface(_cage.surface,_x,_y)
    
    var _r = HOVER_OUTLINE_R var _g = HOVER_OUTLINE_G var _b = HOVER_OUTLINE_B
    
    if bounty_selected == i{
        if _mouse_on == false{
            _r = BOUNTY_CAGE_OUTLINE_R
            _g = BOUNTY_CAGE_OUTLINE_G
            _b = BOUNTY_CAGE_OUTLINE_B
        }
    }
    
    shader_set(sh_replace)
    shader_set_uniform_f( global.shaders.replace[0],_r,_g,_b )
    if _mouse_on == true or bounty_selected == i
        shader_set_uniform_f( global.shaders.replace[1],true )
    else 
        shader_set_uniform_f( global.shaders.replace[1],false)
    draw_sprite(spr_bounty_cage,0,_x,_y)
    shader_reset()
    
    var _bars_index = 2
    
    if _rank>=_max_rank*0.5{
        _bars_index = 1
    }
    if _rank==_max_rank{
        _bars_index = 0
    }
    
    draw_sprite(spr_bounty_cage_bars,_bars_index,_x,_y)
    
    var _ymax = 31 * _max_rank
    
    for (var c = 0; c < _max_rank; c++) {
        var _color = c_white
        
        if _rank>c
            _color = star_colors[c]
        
        
    	draw_sprite_ext(spr_bounty_star,0,_x-32,_y - 31*c - 15 + 53 + _ymax/2 - 16,1,1,0,_color,1)
    }
    
    
    
    _row++
    if _row>3{
        _row = 0
        _col++
    }
    
}

draw_sprite_stretched(spr_scroll_bar,0,1024-64,0,64,384)
if page>0
draw_sprite(spr_scroll_up,0,1024-64,16)

draw_sprite_stretched(spr_scroll_bar_thumb,0,1024-56,48+2+226*(page/max_page),SCROLL_THUMB_WIDTH,SCROLL_THUMB_HEIGHT)

if page<max_page
draw_sprite(spr_scroll_down,0,1024-64,336)

draw_sprite_stretched(spr_bounty_backpanel,0,0,384,1024,192)

if bounty_info.initialized == false and bounty_selected != -1{
    
    var _bounty_data = bounties[bounty_selected]
    var _info_data = _bounty_data.info_icon
    var _icon = _info_data.spr
    var _pos = _info_data.pos
    var _spr_w = sprite_get_width(_icon)
    var _spr_h = sprite_get_height(_icon)
    var _icon_panel_size = [167,163]
    
    bounty_info.surface = surface_create(1024,163)
    
    surface_set_target(bounty_info.surface)
    
    draw_clear_alpha(c_white,0)
    
    draw_sprite_stretched(spr_bounty_info_icon_panel,0,0,0,_icon_panel_size[0],_icon_panel_size[1])
    
    draw_set_font(font_general_20)
    
    var _col = #400000
    draw_text_color(21,0,"WANTED",_col,_col,_col,_col,1)
    draw_line_color(21,8+21,21+string_width("WANTED"),8+21,_col,_col)
    
    var _x = 0
    var _y = 0
    
    switch (_pos) {
    	case BOUNTY_ICON_POSITION.LEFT: 
            
            _x = 3
            _y = _icon_panel_size[1]/2-_spr_h/2
            
        break;
        case BOUNTY_ICON_POSITION.MIDDLE: 
            
            _x = _icon_panel_size[0]/2-_spr_w/2
            _y = _icon_panel_size[1]/2-_spr_h/2
            
        break;
    }
    
    draw_sprite(_icon,0,_x,_y)
    
    draw_set_font(font_general_12)
    
    var _max_rank = _bounty_data.max_rank
    var _rank = clamp(_bounty_data.current_rank,0,_max_rank-1)
    var _number_panel_size = [19,33]
    var _numbers_max_size = 30*_max_rank
    
    draw_set_halign(fa_middle)
    for (var i = 0; i < _max_rank; i++) {
    	var _ny = _icon_panel_size[1]/2-_numbers_max_size/2+30*i
        var _nx = _icon_panel_size[0]
        var _col = c_black
        
        if _rank==i{
            _col = c_white
        }
        
        draw_sprite(spr_bounty_info_number_panel,0,round(_nx),round(_ny))
        
        draw_text_color(_nx+6,_ny+6,i+1,_col,_col,_col,_col,1)
    }
    draw_set_halign(fa_left)
    
    var _info_panel_size = [532,163]
    var _info_panel_x = _icon_panel_size[0]+50
    
    draw_sprite_stretched(spr_bounty_description_panel,0,_info_panel_x,0,_info_panel_size[0],_info_panel_size[1])
    
    draw_set_font(font_general_12)
    
    draw_set_color(c_black)
    
    var _name = _bounty_data.names[_rank]
    var _rank_type = _bounty_data.ranks[_rank]
    var _location_type = _bounty_data.location
    var _location_text = global.tracks[$ _location_type].name
    var _desc = _bounty_data.desc
    var _rank_text= ""
    switch (_rank_type) {
    	case BOUNTY_RANK.ALMIGHTY: _rank_text = "Almighty" break;
        case BOUNTY_RANK.ANNOINGLY_ALMIGHTY: _rank_text = "Annoyingly Almighty" break;
        case BOUNTY_RANK.ANNOYING: _rank_text = "Annoying" break;
        case BOUNTY_RANK.HIGH: _rank_text = "Hihg" break;
        case BOUNTY_RANK.IMPOPPABLE: _rank_text = "Impoppable" break;
        case BOUNTY_RANK.IMPOPPABLY_ANNOYING: _rank_text = "Impoppably Annoying" break;
        case BOUNTY_RANK.LOW: _rank_text = "Low" break;
        case BOUNTY_RANK.MEDIUM: _rank_text = "Medium" break;
        case BOUNTY_RANK.MODERATELY_ANNOYING: _rank_text = "Moderately Annoying" break;
        case BOUNTY_RANK.MODERATELY_HIGH: _rank_text = "Moderately High" break;
        case BOUNTY_RANK.VERY_ANNOYING: _rank_text = "Very Annoying" break;
        case BOUNTY_RANK.VERY_HIGH: _rank_text = "Very High" break;
    }
    var _monkey_money = global.bounty.rewards.monkey_money[_rank_type]
    var _bloon_points = global.bounty.rewards.bloon_points[_rank_type]
    var _xp = global.bounty.rewards.xp[_rank_type]
    
    var _txt_x = _info_panel_x+9
    var _name_y = 8
    draw_text(_txt_x,_name_y,$"Name: {_name}")
    var _ranking_y = 8+24
    draw_text(_txt_x,_ranking_y,$"Ranking: {_rank_text}")
    var _location_y = 8+48
    draw_text(_txt_x,_location_y,$"Location: {_location_text}")
    var _description_y = 8+72
    draw_text(_txt_x,_description_y,"Description:")
    
    draw_line(_txt_x,_description_y+22,_txt_x+string_width("Description:"),_description_y+22)
    
    draw_text_ext(_info_panel_x+9,8+72+24+6,_desc,18,523)
    
    _txt_x = _info_panel_x+253
    draw_text(_txt_x,8,"Reward:")
    
    var _reward_x = _info_panel_x+348
    var _reward_y = 16
    _txt_x = _reward_x+40
    
    draw_set_valign(fa_center)
    
    draw_sprite(spr_bounty_reward_cash,0,_reward_x,_reward_y)
    draw_text_outline(_txt_x,_reward_y,c_black,#00c000,$"x{_monkey_money}")
    
    _reward_y+=32
    draw_sprite(spr_bounty_reward_bloonpoint,0,_reward_x,_reward_y)
    draw_text_outline(_txt_x,_reward_y,c_black,#009fff,$"x{_bloon_points}")
    
    _reward_y+=32
    draw_sprite(spr_bounty_reward_xp,0,_reward_x,_reward_y)
    draw_text_outline(_txt_x,_reward_y,c_black,c_white,$"x{number_format_dotted(_xp)}")
    
    draw_set_valign(fa_top)
    
    var _x = _info_panel_x+_info_panel_size[0]+32
    var _y = 0
    draw_sprite(spr_bounty_duel_button,0,_x-46+167/2,_y-45+163/2)
    var _col = #400000
    draw_set_halign(fa_middle) draw_set_font(font_general_16)
    draw_text_color(_x+167/2,_y+163-28,"START DUEL!",_col,_col,_col,_col,1)
    draw_set_halign(fa_left)  draw_set_font(font_general_12)
    
    draw_set_color(c_white)
    
    surface_reset_target()
    
    bounty_info.buffer = surface_to_buffer(bounty_info.surface)
    bounty_info.initialized = true
    
    surface_save(bounty_info.surface,working_directory+"surf//test.png")
}

if bounty_info.initialized == true and bounty_selected != -1{
    if surface_exists(bounty_info.surface){
        
        shader_set(sh_replace)
        shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
        shader_set_uniform_f( global.shaders.replace[1],onduel )
        draw_sprite_stretched(spr_bounty_info_icon_panel,0,815,398,167,163)
        shader_reset()
        
        draw_surface(bounty_info.surface,35,398)
    }
}

dialogue.draw()