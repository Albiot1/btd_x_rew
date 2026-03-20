draw_set_font(font_general_12)

enum BOUNTY_EFFECT_TYPE {
    FLOATY,
    SIDES,
    SHAKY,
    REPEAT,
    PUSH,
    NONE
}

enum BOUNTY_ICON_POSITION {
    MIDDLE,
    LEFT
}

Bounty = function (_id,_description) constructor {
    mid = _id
    max_rank = global.bounty.list[$ _id].max_rank
    desc = global.translation[$ "bounty_"+_id+"_desc"]
    location = global.bounty.list[$ _id].location
    current_rank = global.bounty.list[$ _id].rank
    names = []
    ranks = []
    mouse_on = false
    icon = -1
    cage = {
        icon: -1,
        effect: BOUNTY_EFFECT_TYPE.NONE,
        icon_pos: [0,0],
        surface: undefined
    }
    info_icon = {
        spr: -1,
        pos: -1
    }
    
    for (var i = 0; i < max_rank; i++) {
    	names[i] = global.translation[$ "bounty_"+_id+$"_name_{i}"]
    }
    
    static SetInfoIcon = function (_sprite,_position = BOUNTY_ICON_POSITION.MIDDLE){
        info_icon.spr = _sprite
        info_icon.pos = _position
        
        return self
    }
    static SetRanks = function (_ranks){
        ranks = _ranks
        
        return self
    }
    
    static SetCageIcon = function (_icon){
        cage.icon = _icon

        return self
    }
    static SetCageEffectFloaty = function (_max_y,_speed = 0.14){
        cage.effect = BOUNTY_EFFECT_TYPE.FLOATY
        cage.effect_max_y = _max_y
        cage.effect_time = 0
        cage.effect_time_plus = random(5)
        cage.effect_time_speed = _speed
        
        return self
    }
    static SetCageEffectSides = function (_max_x,_speed = 0.08){
        cage.effect = BOUNTY_EFFECT_TYPE.SIDES
        cage.effect_max_x = _max_x
        cage.effect_time = 0
        cage.effect_time_plus = random(5)
        cage.effect_time_speed = _speed
        
        return self
    }
    static SetCageEffectShaky = function (_shake_x,_shake_y){
        cage.effect = BOUNTY_EFFECT_TYPE.SHAKY
        cage.effect_shake = [_shake_x,_shake_y]
        cage.effect_time = 0
        cage.effect_time_plus = irandom(5)
        
        return self
    }
    static SetCageEffectRepeat = function (_move_speed,_position_reset){
        cage.effect = BOUNTY_EFFECT_TYPE.REPEAT
        cage.effect_speed = _move_speed
        cage.effect_max_pos = _position_reset
        
        return self
    }
    static SetCageEffectPush = function (_anim_speed,_anim_distance,_anim_wait = 30){
        cage.effect = BOUNTY_EFFECT_TYPE.PUSH
        cage.effect_speed = _anim_speed
        cage.effect_pos = 0
        cage.effect_distance = _anim_distance
        cage.effect_wait = 0
        cage.effect_wait_max = _anim_wait
        return self
    }
}

bounties_num = 0
bounties = []
bounty_selected = -1
page = 0
star_colors = [ #ff80ff,#ffff40,#80ff80,#abf8f8,#f26d7d ]

bounty_info = {
    surface: undefined,
    buffer: undefined,
    initialized: false
}

bounties[0] = new Bounty("big_bully")
    .SetInfoIcon(spr_bounty_icon_big_bully_bloon)
    .SetCageIcon(spr_bounty_big_bully_blooon)
    .SetCageEffectFloaty(5)
    .SetRanks([BOUNTY_RANK.LOW,BOUNTY_RANK.MEDIUM,BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.ALMIGHTY])
    
bounties[1] = new Bounty("mighty_moab")
    .SetInfoIcon(spr_bounty_icon_mighty_moab)
    .SetCageIcon(spr_bounty_mighty_moab)
    .SetCageEffectPush(0.02,18)
    .SetRanks([BOUNTY_RANK.MEDIUM,BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH])

bounties[2] = new Bounty("horror_bloon")
    .SetInfoIcon(spr_bounty_icon_horror_bloon)
    .SetCageIcon(spr_bounty_horror_bloon)
    .SetCageEffectShaky(2,2)
    .SetRanks([BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH,BOUNTY_RANK.IMPOPPABLE])

bounties[3] = new Bounty("ufo_bloon")
    .SetInfoIcon(spr_bounty_icon_ufo_bloon)
    .SetCageIcon(spr_bounty_ufo_bloon)
    .SetCageEffectFloaty(3)
    .SetRanks([BOUNTY_RANK.LOW,BOUNTY_RANK.MEDIUM,BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH])

bounties[4] = new Bounty("super_bloon")
    .SetInfoIcon(spr_bounty_icon_super_bloon)
    .SetCageIcon(spr_bounty_super_bloon)
    .SetCageEffectFloaty(5)
    .SetRanks([BOUNTY_RANK.MEDIUM,BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH])

bounties[5] = new Bounty("mother")
    .SetInfoIcon(spr_bounty_icon_the_mother)
    .SetCageIcon(spr_bounty_the_mother)
    .SetCageEffectSides(5,0.02)
    .SetRanks([BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH,BOUNTY_RANK.IMPOPPABLE])

bounties[6] = new Bounty("annoying_bloon")
    .SetInfoIcon(spr_bounty_icon_annoying_bloon)
    .SetCageIcon(spr_bounty_annoying_bloon)
    .SetCageEffectFloaty(5)
    .SetRanks([BOUNTY_RANK.MODERATELY_ANNOYING,BOUNTY_RANK.ANNOYING,BOUNTY_RANK.VERY_ANNOYING,BOUNTY_RANK.IMPOPPABLY_ANNOYING,BOUNTY_RANK.ANNOINGLY_ALMIGHTY])

bounties[7] = new Bounty("clown_bloon")
    .SetInfoIcon(spr_bounty_icon_clown_bloon)
    .SetCageIcon(spr_bounty_clown_bloon)
    .SetCageEffectFloaty(5)
    .SetRanks([BOUNTY_RANK.MEDIUM,BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH,BOUNTY_RANK.ALMIGHTY])

bounties[8] = new Bounty("blooming_bloon")
    .SetInfoIcon(spr_bounty_icon_blooming_bloon)
    .SetCageIcon(spr_bounty_blooming_bloon)
    .SetCageEffectFloaty(5)
    .SetRanks([BOUNTY_RANK.MEDIUM,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH])

bounties[9] = new Bounty("track_crawler")
    .SetInfoIcon(spr_bounty_icon_track_crawler)
    .SetCageIcon(spr_bounty_track_crawler)
    .SetCageEffectSides(4)
    .SetRanks([BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH,BOUNTY_RANK.IMPOPPABLE])

bounties[10] = new Bounty("tdom")
    .SetInfoIcon(spr_bounty_icon_tdom)
    .SetCageIcon(spr_bounty_tdom)
    .SetCageEffectSides(4)
    .SetRanks([BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH,BOUNTY_RANK.IMPOPPABLE])

bounties[11] = new Bounty("flying_bloon")
    .SetInfoIcon(spr_bounty_icon_flying_bloon)
    .SetCageIcon(spr_bounty_flying_bloon)
    .SetCageEffectFloaty(8)
    .SetRanks([BOUNTY_RANK.MEDIUM,BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH])

bounties[12] = new Bounty("bloon_knight")
    .SetInfoIcon(spr_bounty_icon_bloon_knight)
    .SetCageIcon(spr_bounty_knight_bloon)
    .SetCageEffectFloaty(4)
    .SetRanks([BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH,BOUNTY_RANK.IMPOPPABLE])

bounties[13] = new Bounty("worm_bloon")
    .SetInfoIcon(spr_bounty_icon_worm_bloon,BOUNTY_ICON_POSITION.LEFT)
    .SetCageIcon(spr_bounty_worm_bloon)
    .SetCageEffectRepeat(0.3,22)
    .SetRanks([BOUNTY_RANK.MEDIUM,BOUNTY_RANK.MODERATELY_HIGH,BOUNTY_RANK.HIGH,BOUNTY_RANK.VERY_HIGH])

bounties_num = array_length(bounties)
max_page = ceil(bounties_num/8)-1

dialogue = {
    active:false,
    texts: global.translation[$ "bounty_intro"],
    current_text_num:0,
    monkey_pos:[-100,100],
    monkey_angle:0,
    back_alpha:1,
    state:"start", //"start" // "indialogue" // "goaway"
    text:"",
    text_pos:0,
    max_width:232,
    box_size:[21,23],
    step:function (){
        if active == false
            exit;
        
        switch (state) {
        	case "start":
                
                monkey_pos[0] = lerp(monkey_pos[0],320,0.1)
                monkey_pos[1] = lerp(monkey_pos[1],288,0.1)
                
                if monkey_pos[0]>=300{
                    monkey_angle = lerp(monkey_angle,45,0.1)
                    if monkey_angle>=30
                    state = "indialogue"
                }
                
            break;
            case "indialogue":
                var _text = texts[current_text_num]
                var _max_text = string_length(_text)
                
                if text_pos<_max_text
                    text_pos+=0.25
                
                text = string_copy(_text,0,text_pos)
                
                var _str_w = string_width_ext(text,16,max_width)
                var _str_h = string_height_ext(text,16,max_width)
                
                box_size[0] = 21+_str_w
                box_size[1] = 23+_str_h
                
                if mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_escape){
                    if text_pos<_max_text{
                        text_pos = _max_text
                    }
                    else {
                    	current_text_num++
                        text_pos = 0
                        if current_text_num>(array_length(texts)-1){
                            state = "goaway"
                        }
                    }
                }
            break;
            case "goaway":
                
                monkey_angle = lerp(monkey_angle,-180,0.1)
                
                if monkey_angle<=-160{
                    monkey_pos[0] = lerp(monkey_pos[0],-100,0.1)
                    if back_alpha>0
                        back_alpha -= 0.25
                }
                
                if monkey_pos[0]<=-90{
                    global.gui_layer = 0
                    global.gui_wait = 10
                    global.bounty.dialogue_finished = true
                    active = false
                }
                
            break;
        }
        
    },
    draw:function (){
        if active == false
            exit;
        
        draw_set_alpha(0.5*back_alpha)
        
        draw_rectangle_color(0,0,1024,576,c_black,c_black,c_black,c_black,0)
        
        draw_set_alpha(1)
        
        var _monkey_x = monkey_pos[0]
        var _monkey_y = monkey_pos[1]
        
        draw_sprite_ext(spr_bounty_dialogue_monkey,0,_monkey_x,_monkey_y,1,1,monkey_angle,c_white,1)
        
        if state == "indialogue"{
            draw_sprite_stretched(spr_bounty_dialogue_box,0,_monkey_x+40,_monkey_y-box_size[1]-16,box_size[0],box_size[1])
            draw_text_ext_color(_monkey_x+40+8,_monkey_y-box_size[1]-16+8,text,16,max_width,c_black,c_black,c_black,c_black,1)
        }
        
    }
}

if global.bounty.dialogue_finished == false{
    dialogue.active = true
    global.gui_layer = 1
}

onduel = false

instance_create_depth(4,5,depth,obj_exit_button)