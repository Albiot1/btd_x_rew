enum CTYPE {
    NORMAL,
    TIMED
}

challenges = {
    name:[],
    desc:[],
    creator:[],
    type:[],
    mid:[],
    num:0,
    page:0,
    max_page:0,
    mouse_on:[],
    add:function (_name,_description,_creator,_type,_id){
        array_push(name,_name)
        array_push(desc,_description)
        array_push(creator,_creator)
        array_push(type,_type)
        array_push(mid,_id)
        array_push(mouse_on,false)
        num++
    },
    step:function (){
        
        if page>0{
            var _x = 1024-64
            var _y = 16
            if (point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left)) or mouse_wheel_up(){
                page-=0.5
            }
        }
        if page<max_page{
            var _x = 1024-64
            var _y = 576-48
            if (point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left)) or mouse_wheel_down(){
                page+=0.5
            }
        }
        
        var _row = 0
        var _col = 0
        for (var i = 4*page; i < clamp(4*(page+1),0,num); i++) {
            
            var _x = 96 + 448*_row
            var _y = 64 + (192+64)*_col
            
            if point_in_rectangle(mouse_x,mouse_y,_x-24,_y-24,_x+376,_y+155){
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

    },
    draw:function (){
        
        var _row = 0
        var _col = 0
        for (var i = 4*page; i < clamp(4*(page+1),0,num); i++) {
            
            var _x = 96 + 448*_row
            var _y = 64 + (192+64)*_col
            var _type = type[i]
            var _name = name[i]
            var _desc = desc[i]
            var _creator = creator[i]
            var _id = mid[i]
            var _mouse_on = mouse_on[i]
            
            shader_set(sh_replace)
            shader_set_uniform_f( global.shaders.replace[0],1,1,1 )
            if _mouse_on == false
            shader_set_uniform_f( global.shaders.replace[1],false )
            else 
            shader_set_uniform_f( global.shaders.replace[1],true)
            draw_sprite_stretched(spr_challenge_bar_bottom,0,_x,_y,376,155)
            draw_sprite_stretched(spr_challenge_bar_top,0,_x-24,_y-24,84,84)
            shader_reset()
            
            draw_sprite(spr_challenges_icons,_type,_x-24,_y-24)
            
            draw_set_font(font_general_16)
            draw_set_color(c_black)
            draw_text(_x+60,_y+2,_name)
            draw_set_font(font_general_12)
            draw_text_ext(_x+4,_y+62,_desc,16,372)
            
            if _id!=-1{
                if global.challenges[$ _id].complete == false{
                    draw_text(_x+28,_y+155+8+4,"Not completed")
                    draw_sprite(spr_challenge_completion_marks,0,_x,_y+155+8)
                }
                else {
                    if _type == CTYPE.NORMAL{
                	   draw_text(_x+28,_y+155+8+4,"Completed !")
                       draw_sprite(spr_challenge_completion_marks,1,_x,_y+155+8)
                    }
                    else if _type == CTYPE.TIMED{
                        draw_text(_x+28,_y+155+8+4,$"Best time:{global.challenges[$ _id].time}")
                        draw_sprite(spr_challenge_completion_marks,2,_x,_y+155+8)
                    }
                }
            }
            
            
            if _creator!=-1{
                draw_set_halign(fa_right)
                draw_text(_x+376-6,_y+155-22,"By:"+_creator)
                draw_set_halign(fa_left)
            }
            
            draw_set_color(c_white)
            _row++
            if _row>1{
                _row = 0
                _col++
            }
            
        }
        
        draw_sprite_stretched(spr_scroll_bar,0,1024-64,0,64,576)
        if page>0
        draw_sprite(spr_challenges_scroll_up,0,1024-64,16)
        if page<max_page
        draw_sprite(spr_challenges_scroll_down,0,1024-64,576-48)
        
    }
}

challenges.add(
    "Deflation",
    "Monkey Meadows - Beat waves 30-90 using only a limited amount of money.",
    -1,
    CTYPE.NORMAL,
    "deflation"
)
challenges.add(
    "Anti-Anti Shield Swarm",
    "Bloon Oasis - Beat every round with shields in them.\nAnti Shield Towers banned.",
    -1,
    CTYPE.NORMAL,
    "anti_anti_shield_swarm"
)
challenges.add(
    "Starve Out",
    "Monkey Town Docks - with several blockades in place, beat this challenge with 1/2 cash.",
    -1,
    CTYPE.NORMAL,
    "starve_out"
)
challenges.add(
    "Necronomicon",
    "Graveyard - Beat Impoppable waves 15-75 with help from a stronger necromancer wizard.",
    -1,
    CTYPE.NORMAL,
    "necronomicon"
)
challenges.add(
    "Monkeys vs Goliath",
    "Monkey Fort - Beath the mighty moab with towers that can't be upgraded.",
    "Weirdoverse()",
    CTYPE.NORMAL,
    "monkeys_vs_goliath"
)
challenges.add(
    "Red Cross",
    "Swamp Spirals - Beat several super bloons with the help of a support chinook.",
    "Sheeper",
    CTYPE.NORMAL,
    "red_cross"
)

challenges.add(
    "One Tower Race",
    "Minecarts - Beat 90 waves in under 6 minutes using only 1 tower type.",
    -1,
    CTYPE.TIMED,
    "one_tower_race"
)
challenges.add(
    "Low Level Race",
    "Monkey Fort - Beat 80 waves in under 7 minutes without more than $5000 at a time.",
    -1,
    CTYPE.TIMED,
    "low_level_race"
)
challenges.add(
    "Maximum Power",
    "Conveyor Belts - Beat 90 waves in 3 minutes with these preplaced towers.",
    -1,
    CTYPE.TIMED,
    "maximum_power"
)
challenges.add(
    "Swarm Support",
    "Village Defense - Beat 80 Waves in 5 minutes with towers that spawn other towers.",
    -1,
    CTYPE.TIMED,
    "swarm_support"
)
challenges.add(
    "Supra Mankey",
    "Crimson Creek - Beat 90 Waves of stronger bloons in 6.5 minutes with help of this monkey.",
    "YWNBYA & OTP I think",
    CTYPE.TIMED,
    "supra_monkey"
)
challenges.add(
    "Lightning Fast",
    "Bloonlight Throwback - Beat 90 Waves in 4.5 minutes with x3 speed bloons.",
    -1,
    CTYPE.TIMED,
    "lightning_fast"
)

challenges.max_page = ceil(challenges.num/4)-1

exit_button = {
    pos:[4,5],
    mouse_on:false,
    step:function (){
        var _x = pos[0]
        var _y = pos[1]
        if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+64){
            mouse_on = true
            if mouse_check_button_pressed(mb_left){
                room_goto(rm_main_menu)
            }
        }
        else {
        	mouse_on = false
        }
    },
    draw:function (){
        shader_set(sh_replace)
        shader_set_uniform_f( global.shaders.replace[0],1,1,1 )
        if mouse_on == false
        shader_set_uniform_f( global.shaders.replace[1],false )
        else 
        shader_set_uniform_f( global.shaders.replace[1],true )
        draw_sprite(spr_agent_menu_exit_button,0,pos[0],pos[1])
        shader_reset()
    }
}