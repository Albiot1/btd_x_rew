missions = {
    name:[],
    desc:[],
    icon:[],
    color:[],
    mid:[],
    track:[],
    num:0,
    page:0,
    max_page:0,
    mouse_on:[],
    add:function (_name,_description,_icon,_color,_id,_track_id){
        array_push(name,_name)
        var _track_name = global.tracks[$ _track_id].name
        array_push(desc,_track_name+" - "+_description)
        array_push(icon,_icon)
        array_push(color, [ color_get_red(_color)/255,color_get_green(_color)/255,color_get_blue(_color)/255 ] )
        array_push(mid,_id)
        array_push(mouse_on,false)
        num++
    },
    step:function (){
        
        var _row = 0
        var _col = 0
        var _start_i = 0
        var _end_i = clamp(6,0,num)
        if page>0{
            _start_i = 2*page
            _end_i = clamp(6+2*(page),0,num)
        }
        for (var i = _start_i; i < _end_i; i++) {
            var _x = 96 + 448*_row
            var _y = 16 + (184)*_col
            var _id = mid[i]
            var _desc = desc[i]
            var _desc_h = string_height_ext(_desc,16,356)
            
            if global.missions[$ _id].completed == true{
                _desc = "Mission completed!"
                _desc_h = string_height_ext(_desc,16,356)
            }
            
            if point_in_rectangle(mouse_x,mouse_y,_x-24,_y-6,_x+400,_y+72+_desc_h+18){
                mouse_on[i] = true
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
        var _end_i = clamp(6,0,num)
        if page>0{
            _start_i = 2*page
            _end_i = clamp(6+2*(page),0,num)
        }
        for (var i = _start_i; i < _end_i; i++) {
            
            var _x = 96 + 448*_row
            var _y = 16 + (184)*_col
            var _icon = icon[i]
            var _name = name[i]
            var _desc = desc[i]
            var _color = color[i]
            var _id = mid[i]
            var _mouse_on = mouse_on[i]
            var _completed = false
            var _desc_h = string_height_ext(_desc,16,356)
            
            if global.missions[$ _id].completed == true{
                _completed = true
                _desc = "Mission completed!"
                _desc_h = string_height_ext(_desc,16,356)
            }
            
           
            
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
        
    }
}

missions.add(
    "Color Splash",
    "Face off against an assorment of colored bloons.",
    spr_mission_icon_color_splash,
    #68b34e,
    "color_splash",
    "swamp_spirals"
)
missions.add(
    "Non-Stop Assault",
    "Pop all the bloons before the trojan bloons get through. Watch out for bombs!",
    spr_mission_icon_non_stop_assault,
    #008000,
    "non_stop_assault",
    "monkey_fort"
)
missions.add(
    "Flood",
    "Defend agains one really long wave of bloons as water bloons try to negate your defenses.",
    spr_mission_icon_flood,
    #009dff,
    "flood",
    "monkey_town_docks"
)
missions.add(
    "Blimp Brigade",
    "25 waves of Moab Class Bloons",
    spr_mission_icon_blimp_brigade,
    #808080,
    "blimp_brigade",
    "conveyor_belt"
)
missions.add(
    "Necropolis",
    "Darkness covers the track as evil resurrected bloons try to leak through!",
    spr_mission_icon_necropolis,
    #5f5f47,
    "necropolis",
    "the_depths"
)
missions.add(
    "Solar Storm",
    "Sun Stone - Sun Blessed Bloons stun your towers and appear from four directions.",
    spr_mission_icon_solar_storm,
    #ffff75,
    "solar_storm",
    "sun_stone"
)
missions.add(
    "Prison Break I",
    "Beat all the tier 1 bounty bloons trying to escape",
    spr_mission_icon_prison_break1,
    #ea854a,
    "prison_break_1",
    "bloon_bounty_center"
)
missions.add(
    "Prison Break II",
    "Beat all the tier 2 bounty bloons trying to escape",
    spr_mission_icon_prison_break2,
    #ea854a,
    "prison_break_2",
    "bloon_bounty_center"
)
missions.add(
    "Prison Break III",
    "Beat all the tier 3 bounty bloons trying to escape",
    spr_mission_icon_prison_break3,
    #ea854a,
    "prison_break_3",
    "bloon_bounty_center"
)
missions.add(
    "Prison Break IV",
    "Beat all the tier 4 bounty bloons trying to escape",
    spr_mission_icon_prison_break4,
    #ea854a,
    "prison_break_4",
    "bloon_bounty_center"
)
missions.add(
    "Ultra Break Out v1",
    "What have I done",
    spr_mission_icon_ultra_break_out_v1,
    #ee1c24,
    "ultra_break_v1",
    "bloon_bounty_center"
)
missions.add(
    "Ultra Break Out v4",
    "Because why not?",
    spr_mission_icon_ultra_break_out_v4,
    #ee1c24,
    "ultra_break_v4",
    "bloon_bounty_center"
)

missions.max_page = ceil((missions.num-4)/2)-1

instance_create_depth(4,5,depth,obj_exit_button)