tracks = {
    surfaces:[],
    num:array_length(global.tracks_order),
    page:0,
    max_page:0,
    mouse_on:-1,
    display_num:6,
    top_panel_pos:[7,7],
    map_icon_pos:[18,50],
    map_name_pos:[53,4],
    medals_x:[2,36,70,104,138],
    medals_y:164,
    has_bounty:[],
    bounty_icon:[],
    medals_anim:animcurve_get_channel( animcurve_get(an_medal_appear),"curve1" ),
    medal_normal_anim_pos:[],
    medal_normal_play_anim:[],
    medal_normal_rank:[],
    medal_impoppable_anim_pos:[],
    medal_impoppable_play_anim:[],
    medal_impoppable_rank:[],
    medal_impoppable_next_rank:[], 
    medal_nightmare_anim_pos:[],
    medal_nightmare_play_anim:[],
    medal_nightmare_rank:[],
    medal_nightmare_next_rank:[],
    medal_time_anim_pos:[],
    medal_time_play_anim:[],
    medal_time_rank:[],
    medal_time_next_rank:[],
    medal_bounty_anim_pos:[],
    medal_bounty_play_anim:[],
    medal_bounty_rank:[],
    medal_bounty_next_rank:[],
    init:function (){
        surfaces = array_create(display_num,-1)
        has_bounty = array_create(num,false)
        bounty_icon = array_create(num,-1)
        
        var _f = function (){
            return [0,0]
        }
        
        medal_normal_anim_pos = array_create_ext(num,_f)
        medal_normal_play_anim = array_create(num,false)
        medal_normal_rank = array_create(num,0)
        medal_normal_next_rank = array_create(num,0)
        
        medal_impoppable_anim_pos = array_create_ext(num,_f)
        medal_impoppable_play_anim = array_create(num,false)
        medal_impoppable_rank = array_create(num,0)
        medal_impoppable_next_rank = array_create(num,0)
        
        medal_nightmare_anim_pos = array_create_ext(num,_f)
        medal_nightmare_play_anim = array_create(num,false)
        medal_nightmare_rank = array_create(num,0)
        medal_nightmare_next_rank = array_create(num,0)
        
        medal_time_anim_pos = array_create_ext(num,_f)
        medal_time_play_anim = array_create(num,false)
        medal_time_rank = array_create(num,0)
        medal_time_next_rank = array_create(num,0)
        
        medal_bounty_anim_pos = array_create_ext(num,_f)
        medal_bounty_play_anim = array_create(num,false)
        medal_bounty_rank = array_create(num,0)
        medal_bounty_next_rank = array_create(num,0)
        
        for (var i = 0; i < num; i++) {
        	var _track = global.tracks[$ global.tracks_order[i] ]
            var _bounty = _track.my_bounty
            var _lastmedal = _track.lastmedal
            var _milestone = _track.milestone
            
            if (_bounty != -1){
            	has_bounty[i] = true
                bounty_icon[i] = _track.bounty_medal_icon
                
                var _bounty_rank = global.bounty.list[$ _bounty].rank
                
                if _bounty_rank>_lastmedal.bounty{
                    medal_bounty_play_anim[i] = true
                    medal_bounty_next_rank[i] = _bounty_rank
                }
                medal_bounty_rank[i] = _lastmedal.bounty
            }
            if _lastmedal.milestone_normal < clamp(_milestone.normal,0,5){
                medal_normal_play_anim[i] = true
                medal_normal_next_rank[i] = clamp(_milestone.normal,0,5)
            }
            medal_normal_rank[i] = _lastmedal.milestone_normal
            if _lastmedal.milestone_impoppable < clamp(_milestone.impoppable,0,5){
                medal_impoppable_play_anim[i] = true
                medal_impoppable_next_rank[i] = clamp(_milestone.impoppable,0,5)
            }
            medal_impoppable_rank[i] = _lastmedal.milestone_impoppable
            if _lastmedal.milestone_nightmare < clamp(_milestone.nightmare,0,5){
                medal_nightmare_play_anim[i] = true
                medal_nightmare_next_rank[i] = clamp(_milestone.nightmare,0,5)
            }
            medal_nightmare_rank[i] = _lastmedal.milestone_nightmare
            if _lastmedal.milestone_time < clamp(_milestone.timetrial,0,5){
                medal_time_play_anim[i] = true
                medal_time_next_rank[i] = clamp(_milestone.timetrial,0,5)
            }
            medal_time_rank[i] = _lastmedal.milestone_time
        }
        
        max_page = ceil((num-3)/3)-1
    },
    update:function (){
        for (var i = 0; i < display_num; i++) {
        	if surfaces[i]!=-1{
                if surface_exists(surfaces[i])
                    surface_free(surfaces[i])
                surfaces[i] = -1
            }
        }
    },
    step:function (){
        
        if mouse_wheel_down(){
            if page<max_page{
                page++
                update()
            }
            
        }
        if mouse_wheel_up(){
            if page>0{
                page--
                update()
            }
        }
        
        mouse_on = -1
        
        var _row = 0
        var _col = 0
        var _start_i = 3*page
        var _end_i = clamp(6+3*(page),0,num)
        var _num = 0
        var _anim_spd = 0.025
        for (var i = _start_i; i < _end_i; i++) {
            
            var _x = 97 + 288*_row
            var _y = 26 + (272)*_col
            var _anim_ended = false
            
            if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+250,_y+202){
                mouse_on = i
                if mouse_check_button_pressed(mb_left){
                    global.current_map = global.tracks_order[i]
                    room_goto(rm_mode_select)
                }
            }
            
            if medal_normal_play_anim[i] == true{
                var _anim_val = animcurve_channel_evaluate(medals_anim,medal_normal_anim_pos[i][0])
                medal_normal_anim_pos[i][1] = _anim_val
                
                medal_normal_anim_pos[i][0]+=_anim_spd
                
                if medal_normal_anim_pos[i][0]>=1{
                    medal_normal_play_anim[i] = false
                    medal_normal_rank[i] = medal_normal_next_rank[i]
                    _anim_ended = true
                }
            }
            
            
            if medal_impoppable_play_anim[i] == true{
                var _anim_val = animcurve_channel_evaluate(medals_anim,medal_impoppable_anim_pos[i][0])
                medal_impoppable_anim_pos[i][1] = _anim_val
                
                medal_impoppable_anim_pos[i][0]+=_anim_spd
                
                if medal_impoppable_anim_pos[i][0]>=1{
                    medal_impoppable_play_anim[i] = false
                    medal_impoppable_rank[i] = medal_impoppable_next_rank[i]
                    _anim_ended = true
                }
            }
            
            if medal_nightmare_play_anim[i] == true{
                var _anim_val = animcurve_channel_evaluate(medals_anim,medal_nightmare_anim_pos[i][0])
                medal_nightmare_anim_pos[i][1] = _anim_val
                
                medal_nightmare_anim_pos[i][0]+=_anim_spd
                
                if medal_nightmare_anim_pos[i][0]>=1{
                    medal_nightmare_play_anim[i] = false
                    medal_nightmare_rank[i] = medal_nightmare_next_rank[i]
                    _anim_ended = true
                }
            }
            
            if medal_time_play_anim[i] == true{
                var _anim_val = animcurve_channel_evaluate(medals_anim,medal_time_anim_pos[i][0])
                medal_time_anim_pos[i][1] = _anim_val
                
                medal_time_anim_pos[i][0]+=_anim_spd
                
                if medal_time_anim_pos[i][0]>=1{
                    medal_time_play_anim[i] = false
                    medal_time_rank[i] = medal_time_next_rank[i]
                    _anim_ended = true
                }
            }
            
            if medal_bounty_play_anim[i] == true{
                var _anim_val = animcurve_channel_evaluate(medals_anim,medal_bounty_anim_pos[i][0])
                medal_bounty_anim_pos[i][1] = _anim_val
                
                medal_bounty_anim_pos[i][0]+=_anim_spd
                
                if medal_bounty_anim_pos[i][0]>=1{
                    medal_bounty_play_anim[i] = false
                    medal_bounty_rank[i] = medal_bounty_next_rank[i]
                    _anim_ended = true
                }
            }
            
            if _anim_ended == true{
                surface_free(surfaces[_num])
            }
            
            _row++
            _num++
            if _row>2{
                _row = 0
                _col++
            }
            
        }
        
    },
    draw:function (){
        
        var _row = 0
        var _col = 0
        var _start_i = 3*page
        var _end_i = clamp(6+3*(page),0,num)
        var _num = 0
        for (var i = _start_i; i < _end_i; i++) {
            
            var _x = 97 + 288*_row
            var _y = 26 + (272)*_col
            
            if !surface_exists(surfaces[_num]){
                draw_set_font(font_general_16)
                
                surfaces[_num] = surface_create(250,202)
                
                var _track = global.tracks[$ global.tracks_order[i] ]
                var _track_difficulty = _track.difficulty
                var _track_icon = _track.icon
                var _track_name = _track.name
                
                surface_set_target(surfaces[_num])
                
                draw_clear_alpha(c_white,0)
                
                var _px = top_panel_pos[0]
                var _py = top_panel_pos[1]
                var _map_x = map_icon_pos[0]
                var _map_y = map_icon_pos[1]
                var _name_x = map_name_pos[0]
                var _name_y = map_name_pos[1]
                
                draw_sprite_stretched(spr_preview_map_top_panel,0,_px,_py,236,188)
                
                draw_sprite(_track_icon,0,_px+_map_x,_py+_map_y)
                
                draw_text_ext_color(_px+_name_x,_py+_name_y,_track_name,20,182,c_black,c_black,c_black,c_black,1)
                
                draw_sprite(spr_track_difficulties,_track_difficulty,-3,0)
                
                if medal_normal_rank[i] == 0
                    draw_sprite_ext(spr_normal_medals,0,medals_x[0],medals_y,1,1,0,c_black,0.5)
                else
                    draw_sprite_ext(spr_normal_medals,medal_normal_rank[i]-1,medals_x[0],medals_y,1,1,0,c_white,1)
                
                if medal_impoppable_rank[i] == 0
                    draw_sprite_ext(spr_impoppable_medals,0,medals_x[1],medals_y,1,1,0,c_black,0.5)
                else
                    draw_sprite_ext(spr_impoppable_medals,medal_impoppable_rank[i]-1,medals_x[1],medals_y,1,1,0,c_white,1)
                
                if medal_nightmare_rank[i] == 0
                    draw_sprite_ext(spr_nightmare_medals,0,medals_x[2],medals_y,1,1,0,c_black,0.5)
                else
                    draw_sprite_ext(spr_nightmare_medals,medal_nightmare_rank[i]-1,medals_x[2],medals_y,1,1,0,c_white,1)
                
                if medal_time_rank[i] == 0
                    draw_sprite_ext(spr_time_medals,0,medals_x[3],medals_y,1,1,0,c_black,0.5)
                else
                    draw_sprite_ext(spr_time_medals,medal_time_rank[i]-1,medals_x[3],medals_y,1,1,0,c_white,1)
                
                if has_bounty[i]==true{
                    if medal_bounty_rank[i] == 0
                        draw_sprite_ext(bounty_icon[i],0,medals_x[4],medals_y,1,1,0,c_black,0.5)
                    else
                        draw_sprite_ext(bounty_icon[i],medal_bounty_rank[i]-1,medals_x[4],medals_y,1,1,0,c_white,1)
                }
                
                surface_reset_target()
            }
            
            shader_set(sh_replace)
            shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
            shader_set_uniform_f(global.shaders.replace[1],mouse_on == i)
            draw_sprite_stretched(spr_preview_map_back_panel,0,_x,_y,250,202)
            shader_reset()
            
            if surface_exists(surfaces[_num]){
                draw_surface(surfaces[_num],_x,_y)
            }
            
            if medal_normal_play_anim[i] == true{
                var _anim_val = medal_normal_anim_pos[i][1]
                draw_sprite_ext(spr_normal_medals,medal_normal_next_rank[i]-1,_x+medals_x[0],_y+medals_y,_anim_val,_anim_val,-90 + 90 * _anim_val,c_white,1)
            }
            
            if medal_impoppable_play_anim[i] == true{
                var _anim_val = medal_impoppable_anim_pos[i][1]
                draw_sprite_ext(spr_impoppable_medals,medal_impoppable_next_rank[i]-1,_x+medals_x[1],_y+medals_y,_anim_val,_anim_val,-90 + 90 * _anim_val,c_white,1)
            }
            
            if medal_nightmare_play_anim[i] == true{
                var _anim_val = medal_nightmare_anim_pos[i][1]
                draw_sprite_ext(spr_nightmare_medals,medal_nightmare_next_rank[i]-1,_x+medals_x[2],_y+medals_y,_anim_val,_anim_val,-90 + 90 * _anim_val,c_white,1)
            }
            
            if medal_time_play_anim[i] == true{
                var _anim_val = medal_time_anim_pos[i][1]
                draw_sprite_ext(spr_time_medals,medal_time_next_rank[i]-1,_x+medals_x[3],_y+medals_y,_anim_val,_anim_val,-90 + 90 * _anim_val,c_white,1)
            }
            
            if medal_bounty_play_anim[i] == true{
                var _anim_val = medal_bounty_anim_pos[i][1]
                draw_sprite_ext(bounty_icon[i],medal_bounty_next_rank[i]-1,_x+medals_x[4],_y+medals_y,_anim_val,_anim_val,-90 + 90 * _anim_val,c_white,1)
            }
            
            _row++
            if _row>2{
                _row = 0
                _col++
            }
            _num++
            
        }
        
        draw_sprite_stretched(spr_scroll_bar_play_menu,0,1024-64,0,64,576)
        if page>0
        draw_sprite(spr_scroll_up_play_menu,0,1024-64,16)
        
        draw_sprite_stretched(spr_scroll_bar_thumb_play_menu,0,1024-56,48+2+416*(page/max_page),SCROLL_THUMB_WIDTH,SCROLL_THUMB_HEIGHT)
        
        if page<max_page
        draw_sprite(spr_scroll_down_play_menu,0,1024-64,576-48)
        
    },
    clean:function (){
        for (var i = 0; i < array_length(surfaces); i++) {
            if surface_exists(surfaces[i])
        	surface_free(surfaces[i])
        }
    }
}

instance_create_depth(4,5,depth,obj_exit_button)

tracks.init()
global.current_map = -1