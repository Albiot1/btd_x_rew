statues = {
    sprite:[spr_towers_statue,spr_agents_statue,spr_play_statue,spr_medals_statue,spr_bounty_statue,spr_info_statue,spr_credits_statue,spr_missions_statue,spr_goodie_statue,spr_challenges_statue],
    text:[scr_get_translation("statue_0_text"),scr_get_translation("statue_1_text"),scr_get_translation("statue_2_text"),scr_get_translation("statue_3_text"),scr_get_translation("statue_4_text"),scr_get_translation("statue_5_text"),scr_get_translation("statue_6_text"),scr_get_translation("statue_7_text"),scr_get_translation("statue_8_text"),scr_get_translation("statue_9_text")],
    px:[352,864,48,576,864,16,160,344,512,864],
    py:[64,48,224,224,208,432,432,368,432,368],
    yplus:[0,0,0,0,0,0,0,0,0,0],
    mouse_on:[false,false,false,false,false,false,false,false,false,false],
    actions:[
        function (){
            room_goto(rm_towers_menu)
        },
        function (){
            room_goto(rm_agent_menu)
        },
        function (){
            room_goto(rm_play_menu)
        },
        function (){
            room_goto(rm_medals_menu)
        },
        function (){
            room_goto(rm_bounties_menu)
        },
        function (){
            instance_create_depth(0,0,depth-100,obj_info_panel)
            global.gui_layer = 1
        },
        function (){
            instance_create_depth(0,0,depth-100,obj_credits_panel)
            global.gui_layer = 1
        },
        function (){
            room_goto(rm_missions_menu)
        },
        function (){
            room_goto(rm_goodies_menu)
        },
        function (){
            room_goto(rm_challenges_menu)
        }
    ],
    num: 10,
    step: function (){
        for (var i = 0; i < num; i++) {
            var _x = px[i]+64
            var _y = py[i]+64
            
            if point_in_rectangle(mouse_x,mouse_y,_x-64,_y-64,_x+64,_y+64) and global.gui_layer == 0 and global.gui_wait == 0{
                mouse_on[i] = true
                yplus[i] = lerp(yplus[i],10,0.1)
                if mouse_check_button_pressed(mb_left) and actions[i]!=-1{
                    actions[i]()
                }
            }
            else {
            	mouse_on[i] = false
                yplus[i] = lerp(yplus[i],0,0.1)
            }
        }
    },
    draw: function (){
        draw_set_font(font_general_16)
        
        for (var i = 0; i < num; i++) {
        	var _spr = sprite[i]
            var _txt = text[i]
            var _x = px[i]+64
            var _y = py[i]+64
            var _mouse_on = mouse_on[i]
            var _yp = yplus[i]
            
            shader_set(sh_replace)
            shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
            
            shader_set_uniform_f( global.shaders.replace[1],_mouse_on )
            
            draw_sprite_ext(_spr,0,_x,_y-20+_yp,1,1,0,c_white,1)
            
            draw_sprite_stretched(spr_statue_text_background,0,_x-64,_y+46-17,128,33)
            shader_reset()
            align_set(fa_center,fa_middle)
            
            draw_text_color(_x,_y+46,_txt,c_black,c_black,c_black,c_black,1)
            
            align_reset()
        }
    }
}

discord_link = {
    pos:[ 64+8,8 ],
    text:scr_get_translation("main_menu_link_name"),
    link:"https://discord.com/invite/hVYHPzA",
    str_w:-1,
    step:function (){
        
        if point_in_rectangle(mouse_x,mouse_y,pos[0],pos[1],pos[0]+str_w,pos[1]+24) and global.gui_layer == 0 and global.gui_wait == 0{
            window_set_cursor(cr_handpoint)
            if mouse_check_button_pressed(mb_left){
                url_open(link)
            }
        }
        else {
        	window_set_cursor(cr_arrow)
        }
        
    },
    draw:function (){
        draw_text_outline(pos[0],pos[1],c_black,c_aqua,text)
        draw_line_width_color(pos[0],pos[1]+28,pos[0]+str_w,pos[1]+28,4,c_aqua,c_aqua)
    }
}

draw_set_font(font_general_16)
discord_link.str_w = string_width(discord_link.text)

moon_temple = {
    pos:[376,252],
    state: 0,
    draw: function (){
        draw_sprite(spr_moon_temple,state,pos[0],pos[1])
    }
}

settings = {
    pos:[4,4],
    mouse_on:false,
    step: function (){
        if global.gui_layer == 0 and global.gui_wait == 0{
            if point_in_rectangle(mouse_x,mouse_y,pos[0],pos[1],pos[0]+64,pos[1]+64){
                mouse_on = true
                
                if mouse_check_button_pressed(mb_left){
                    global.gui_layer = 1
                    global.gui_wait = 10
                    instance_create_depth(0,0,-1,obj_settings_panel)
                }
            }
            else {
            	mouse_on = false
            }
        }
        else {
        	mouse_on = false
        }
    },
    draw: function (){
        
        shader_set(sh_replace)
        shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
        shader_set_uniform_f(global.shaders.replace[1],mouse_on)
        draw_sprite(spr_settings_main_menu,0,pos[0],pos[1])
        shader_reset()
        
    }
}