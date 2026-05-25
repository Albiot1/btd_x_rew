panels = {
    icon:[],
    color:[],
    num:0,
    myid:[],
    selected:-1,
    mouse_on:[],
    unlocked:[],
    shader_colors:{ value:[],number:-1 },
    add:function (_id){
        var _data = global.towers[$ _id]
        array_push(icon,_data.panel_icon)
        array_push(color,_data.panel_color)
        array_push(myid,_id)
        array_push(mouse_on,false)
        array_push(unlocked,_data.unlocked)
        num++
    },
    step: function (){
        var _row = 0
        var _col = 0
        for (var i = 0; i < num; i++) {
            var _x = 104 + 64 * _row
            var _y = 8 + 64 * _col
            
            if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+48,_y+48){
                mouse_on[i] = true
                if mouse_check_button_pressed(mb_left) and selected != i and unlocked[i] == true{
                    selected = i
                    global.selected_tower_id = myid[i]
                    obj_towers.upgrades_update()
                }
            }
            else {
            	mouse_on[i] = false
            }
            
            _row++
            if _row>11{
                _row = 0
                _col++
            }
        }
    },
    draw: function (){
        var _row = 0
        var _col = 0
        for (var i = 0; i < num; i++) {
            var _color = color[i]
            var _icon = icon[i]
            var _x = 104 + 64 * _row
            var _y = 8 + 64 * _col
            var _mouse_on = mouse_on[i]
            
            var _r = HOVER_OUTLINE_R, _g = HOVER_OUTLINE_G, _b = HOVER_OUTLINE_B
            var _outline = false
            if selected == i{
                _outline = true
                if _mouse_on == false{
                    if shader_colors.number != i{
                        shader_colors.number = i
                        shader_colors.value = [color_get_red(_color)/255,color_get_green(_color)/255,color_get_blue(_color)/255]
                    }
                    var _vals = shader_colors.value
                    _r = _vals[0]
                    _g = _vals[1]
                    _b = _vals[2]
                }
            }
            else {
            	if _mouse_on == true{
                    _outline = true
                }
            }
            
            if unlocked[i] == true{
                shader_set(sh_replace)
                shader_set_uniform_f( global.shaders.replace[0],_r,_g,_b )
                shader_set_uniform_f( global.shaders.replace[1],_outline )
                
            	draw_sprite_ext(spr_tower_panel_icon,0,_x,_y,1,1,0,_color,1)
                
                shader_reset()
                
                draw_sprite_ext(_icon,0,_x,_y,1,1,0,c_white,1)
            }
            else {
                shader_set(sh_grayscale)
                
            	draw_sprite_ext(spr_tower_panel_icon,0,_x,_y,1,1,0,_color,1)
                
                draw_sprite_ext(_icon,0,_x,_y,1,1,0,c_white,1)
                
                draw_sprite(spr_tower_panel_lock_icon,0,_x,_y)
                
                shader_reset()
            }

            
            _row++
            if _row>11{
                _row = 0
                _col++
            }
        }
    }
}

enum UPGRADE_STATE {
    SHOW_INIT,
    SHOW,
    LOCKED,
    UNLOCKING
}

global.selected_tower_id = -1

upgrades = {
    locked_text:scr_get_translation("upgrade_locked"),
    rank_text:scr_get_translation("upgrade_rank"),
    sprite:[],
    color:[],
    name:[],
    desc:[],
    price:[],
    rank:[],
    bp_cost:[],
    state:[],
    order_number:[],
    upgrade_id:[],
    prev_upgrade_id: [],
    show_anim_pos: [],
    show_flash: [],
    unlock_hold: [],
    bp_now: [],
    bp_spawned: [],
    mouse_on: [],
    instant_unlocking: global.settings.instant_upgrade_unlocking,
    px: [],
    py: [],
    num:0,
    step: function (){
        for (var i = num-1; i >= 0; i--) {
        	var _x = px[i]
            var _y = py[i]
            var _state = state[i]
            
            switch (_state) {
            	case UPGRADE_STATE.SHOW_INIT:
                    
                    var _order = order_number[i]
                    
                    show_anim_pos[i]+=0.1
                    if show_anim_pos[i] - _order*0.2>=1{
                        state[i] = UPGRADE_STATE.SHOW
                        show_anim_pos[i] = 1
                    }
                    
                break;
                case UPGRADE_STATE.LOCKED:
                    
                    var _order = order_number[i]
                    
                    if show_anim_pos[i] - _order*0.2<1{
                        show_anim_pos[i]+=0.1
                    }
                    
                    var _on = false
                    

                    if point_in_rectangle(mouse_x,mouse_y,_x+38,_y,_x+67+172,_y+81)
                        _on = true
                    
                    if point_in_triangle(mouse_x,mouse_y,_x,_y+3+37,_x+38,_y+3,_x+38,_y+3+75)
                        _on = true
                    
                    if _on == true{
                        mouse_on[i] = true
                        if mouse_check_button(mb_left) and instant_unlocking==false{
                            
                            var _can_unlock = false
                            var _enough_bloonpoints = false
                            var _enough_rank = false
                            
                            if global.bloon_points>=bp_cost[i]{
                                _enough_bloonpoints = true
                            }
                            if global.rank>=rank[i]{
                                _enough_rank = true
                            }
                            
                            if prev_upgrade_id[i]==-1
                                _can_unlock = true
                            else {
                                
                            	if prev_upgrade_id[i].unlocked == true
                                    _can_unlock = true
                            }
                            
                            if (_can_unlock == true and _enough_bloonpoints == true and _enough_rank == true){
                                unlock_hold[i] += unlock_hold[i]*0.1+0.02
                                
                                if unlock_hold[i] > 1{
                                    unlock_hold[i] = 1
                                }
                            }
                        }
                        else {
                            if unlock_hold[i]>0
                                unlock_hold[i] -= 0.05
                        }
                    }
                    else {
                    	mouse_on[i] = false
                        
                        if unlock_hold[i]>0
                            unlock_hold[i] -= 0.05
                    }
                    
                    
                    
                    bp_now[i] = round(bp_cost[i]*unlock_hold[i])
                    
                    var _spawn = bp_now[i] - bp_spawned[i] 
                    
                    if _spawn > 0{
                        repeat (_spawn) {
                        	with instance_create_depth(925+32,500+32,-1,obj_fake_resource){
                                next_x = _x + 67 + 10 + irandom_range(0,162)
                                next_y = _y + 8 + irandom_range(0,73)
                            }
                        }
                    }
                    else {
                    	repeat (abs(_spawn)) {
                            var _spx = _x + 67 + 10 + irandom_range(0,162)
                            var _spy = _y + 8 + irandom_range(0,73)
                        	with instance_create_depth(_spx,_spy,-1,obj_fake_resource){
                                next_x = 925+32
                                next_y = 500+32
                            }
                        }
                    }
                    
                    bp_spawned[i] = bp_now[i]
                    
                    var _unlock = false
                    if _on == true and instant_unlocking == true and mouse_check_button_pressed(mb_left){
                        _unlock = true
                        repeat (bp_cost[i]) {
                        	with instance_create_depth(925+32,500+32,-1,obj_fake_resource){
                                next_x = _x + 67 + 10 + irandom_range(0,162)
                                next_y = _y + 8 + irandom_range(0,73)
                            }
                        }
                    }
                    
                    if unlock_hold[i]>=1 or _unlock == true{
                        unlock_hold[i] = 0
                        bp_spawned[i] = 0
                        bp_now[i] = 0
                        
                        global.upgrades[$ global.selected_tower_id][$ upgrade_id[i]].unlocked = true
                        global.bloon_points-=bp_cost[i]
                        
                        state[i] = UPGRADE_STATE.UNLOCKING
                        
                        var _lock_spr = spr_tower_upgrade_padlock_effect
                        if _order == 4{
                            _lock_spr = spr_tower_upgrade_padlock_gold_effect
                        }
                        with instance_create_depth(_x,_y+3,-1,obj_lock){
                            sprite_index = _lock_spr
                        }
                    }
                    
                break;
                case UPGRADE_STATE.UNLOCKING:
                    
                    show_flash[i]+=0.05
                    if show_flash[i]>=1{
                        show_flash[i] = 0
                        state[i] = UPGRADE_STATE.SHOW_INIT
                        show_anim_pos[i] = 0
                    }
                    
                break;
            }
            
        }
    },
    draw: function (){
        draw_set_color(c_black)
        for (var i = num-1; i >= 0; i--) {
        	var _x = px[i]
            var _y = py[i]
            var _spr = sprite[i]
            var _col = color[i]
            var _name = name[i]
            var _desc = desc[i]
            var _price = price[i]
            var _state = state[i]
            
            switch (_state) {
            	case UPGRADE_STATE.SHOW_INIT:
                    
                    draw_sprite_stretched_ext(spr_upgrade_desc_panel,0,_x+67,_y,172,81,_col,1)
                    draw_sprite_ext(spr_upgrade_icon_panel,0,_x,_y+3,1,1,0,_col,1)
                    
                    var _order = order_number[i]
                    
                    var _show_percent = show_anim_pos[i] - _order*0.2
                    _desc = string_copy( _desc,0,string_length(_desc)*_show_percent )
                    
                    draw_set_font(font_upgrade_name)
                    draw_text_ext(_x+67+4,_y+3,_name,15,164)
                    var _str_h = string_height_ext(_name,15,164)
                    draw_set_font(font_upgrade_desc)
                    draw_text_ext(_x+67+10,_y+_str_h,_desc,12,158)
                    
                    draw_set_halign(fa_right)
                    
                    draw_text(_x+67+172-5,_y+81-8-10,$"${_price}")
                    
                    draw_set_halign(fa_left)
                    
                    draw_sprite_ext(_spr,0,_x,_y+3,1,1,0,c_white,_show_percent)
                    
                break;
                case UPGRADE_STATE.SHOW:
                    
                    draw_sprite_stretched_ext(spr_upgrade_desc_panel,0,_x+67,_y,172,81,_col,1)
                    draw_sprite_ext(spr_upgrade_icon_panel,0,_x,_y+3,1,1,0,_col,1)
                    
                    draw_set_font(font_upgrade_name)
                    draw_text_ext(_x+67+4,_y+3,_name,15,164)
                    var _str_h = string_height_ext(_name,15,164)
                    draw_set_font(font_upgrade_desc)
                    draw_text_ext(_x+67+10,_y+_str_h,_desc,12,158)
                    
                    draw_set_halign(fa_right)
                    
                    draw_text(_x+67+172-5,_y+81-8-10,$"${_price}")
                    
                    draw_set_halign(fa_left)
                    
                    draw_sprite(_spr,0,_x,_y+3)
                    
                break;
                case UPGRADE_STATE.LOCKED:
                    
                    var _mouse_on = mouse_on[i]
                    var _held = clamp(unlock_hold[i],0,1)
                    
                    shader_set(sh_replace)
                    shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
                    shader_set_uniform_f( global.shaders.replace[1],_mouse_on )
                    
                    draw_sprite_stretched_ext(spr_upgrade_desc_panel,0,_x+67,_y,172,81,LOCKED_UPGRADE_COLOR,1)
                    draw_sprite_stretched_ext(spr_upgrade_fill_bar,0,_x+67,_y,172,81,LOCKED_UPGRADE_COLOR,1)
                    draw_sprite_stretched_ext(spr_upgrade_fill_bar,1,_x+67,_y,172*_held,81,c_white,1)
                    
                    
                    draw_sprite_ext(spr_upgrade_icon_panel,0,_x,_y+3,1,1,0,LOCKED_UPGRADE_COLOR,1)
                    
                    shader_reset()
                    
                    var _order = order_number[i]
                    var _lock_spr = spr_tower_upgrade_locked
                    if _order == 4{
                        _lock_spr = spr_tower_upgrade_gold_locked
                    }
                    var _cost = bp_cost[i]
                    var _rank = rank[i]
                    
                    var _show_percent = show_anim_pos[i] - _order*0.2
                    
                    draw_sprite_ext(_lock_spr,0,_x,_y+3,1,1,0,c_white,_show_percent)
                    
                    draw_set_font(font_upgrade_name)
                    
                    draw_text(_x+67+4,_y+6,locked_text)
                    
                    draw_sprite_ext(spr_upgrade_bp_cost,0,_x+67+4,_y+48,1,1,0,c_white,_show_percent)
                    
                    var _bpcost_color = COLOR_BLOONPOINTS
                    if global.bloon_points < bp_cost[i]{
                        _bpcost_color = COLOR_NOT_ENOUGH
                    }
                    
                    draw_text_outline(_x+67+4+26,_y+50,c_black,_bpcost_color,$"x{_cost}")
                    
                    draw_set_halign(fa_right)
                    
                    var _rankcost_color = COLOR_RANK
                    if global.rank < rank[i]{
                        _rankcost_color = COLOR_NOT_ENOUGH
                    }
                    
                    draw_text_outline(_x+67+172-8,_y+6,c_black,_rankcost_color, scr_text_format_insert( rank_text,[_rank] ) )
                    
                    draw_set_halign(fa_left)
                    
                break;
                case UPGRADE_STATE.UNLOCKING:
                    
                    var _multi = show_flash[i]
                    
                    var _hue = color_get_hue(_col)
                    var _sat = color_get_saturation(_col)
                    var _val = color_get_value(_col)
                    
                    var _col = make_color_hsv( _hue*_multi,_sat*_multi,255 )
                    
                    draw_sprite_stretched_ext(spr_upgrade_desc_panel,1,_x+67,_y,172,81,_col,1)
                    draw_sprite_ext(spr_upgrade_icon_panel,1,_x,_y+3,1,1,0,_col,1)
                    
                break;
            }
            
            
            
        }
        draw_set_color(c_white)
    },
    remove: function (_upgr_id){
        var _index = array_get_index(upgrade_id,_upgr_id)
        
        if _index == -1
            exit;
        
        array_delete(sprite,_index,1)
        array_delete(color,_index,1)
        array_delete(name,_index,1)
        array_delete(desc,_index,1)
        array_delete(price,_index,1)
        array_delete(rank,_index,1)
        array_delete(bp_cost,_index,1)
        array_delete(state,_index,1)
        array_delete(order_number,_index,1)
        array_delete(upgrade_id,_index,1)
        array_delete(prev_upgrade_id,_index,1)
        array_delete(show_anim_pos,_index,1)
        array_delete(show_flash,_index,1)
        array_delete(unlock_hold,_index,1)
        array_delete(bp_now,_index,1)
        array_delete(bp_spawned,_index,1)
        array_delete(mouse_on,_index,1)
        array_delete(px,_index,1)
        array_delete(py,_index,1)
        num--
    },
    add: function (_upgr_id){
        var _data = global.upgrades[$ global.selected_tower_id][$ _upgr_id]
        
        array_push(sprite,_data.icon)
        array_push(name,_data.name)
        array_push(desc,_data.desc)
        
        var _upgrade_id = _data.upgr_id
        array_push(upgrade_id,_upgrade_id)
        
        var _special_data = -1
        var _spec_path = -1
        var _spec_colo = c_white
        if string_count("special",_upgrade_id)>0{
            _special_data = global.upgrades[$ global.selected_tower_id].special_path
            _spec_path = _special_data.replaces
            _spec_colo = _special_data.color
        }
        
        var _mx = 0
        var _my = 0
        var _order_num = 0
        var _prev_upgr_id = -1
        var _color = c_white
        
        switch (_spec_path) {
            case PATH_UPGR_TYPE.LEFT:
                _my = 168
            break;
            case PATH_UPGR_TYPE.MIDDLE:
                _my = 296
            break;
            case PATH_UPGR_TYPE.RIGHT:
                _my = 424
            break;
        }
        
        switch (_upgrade_id) {
        	case "main_0":
                _mx = 1
                _my = 232
                _color = UPGRADE_MAIN_COLOR
            break;
            case "main_1":
                _mx = 75
                _my = 360
                _color = UPGRADE_MAIN_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].main_0 
                _order_num = 1
            break;
            case "left_0":
                _mx = 298
                _my = 168
                _color = UPGRADE_LEFT_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].main_1
                _order_num = 2
            break;
            case "left_1":
                _mx = 540
                _my = 168
                _color = UPGRADE_LEFT_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].left_0 
                _order_num = 3
            break;
            case "left_2":
                _mx = 782
                _my = 168
                _color = UPGRADE_LEFT_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].left_1
                _order_num = 4
            break;
            case "middle_0":
                _mx = 298
                _my = 296
                _color = UPGRADE_MIDDLE_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].main_1 
                _order_num = 2
            break;
            case "middle_1":
                _mx = 540
                _my = 296
                _color = UPGRADE_MIDDLE_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].middle_0 
                _order_num = 3
            break;
            case "middle_2":
                _mx = 782
                _my = 296
                _color = UPGRADE_MIDDLE_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].middle_1 
                _order_num = 4
            break;
            case "right_0":
                _mx = 298
                _my = 424
                _color = UPGRADE_RIGHT_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].main_1 
                _order_num = 2
            break;
            case "right_1":
                _mx = 540
                _my = 424
                _color = UPGRADE_RIGHT_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].right_0 
                _order_num = 3
            break;
            case "right_2":
                _mx = 782
                _my = 424
                _color = UPGRADE_RIGHT_COLOR
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].right_1 
                _order_num = 4
            break;
            case "special_0":
                _mx = 298
                
                _color = _spec_colo
                _prev_upgr_id = -1
                _order_num = 2
            break;
            case "special_1":
                _mx = 540
                
                _color = _spec_colo
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].special_0 //"special_0"
                _order_num = 3
            break;
            case "special_2":
                _mx = 782
                
                _color = _spec_colo
                _prev_upgr_id = global.upgrades[$ global.selected_tower_id].special_1 //"special_1"
                _order_num = 4
            break;
        }
        
        array_push(color,_color)
        array_push(px,_mx)
        array_push(py,_my)
        array_push(order_number,_order_num)
        array_push(prev_upgrade_id,_prev_upgr_id)
        
        if _data.unlocked == true
            array_push(state,UPGRADE_STATE.SHOW_INIT)
        else 
            array_push(state,UPGRADE_STATE.LOCKED)
        
        array_push(rank,_data.unlock_rank)
        array_push(bp_cost,_data.unlock_cost)
        
        array_push(price,_data.upgr_cost)
        
        array_push(bp_now,0)
        array_push(bp_spawned,0)
        array_push(unlock_hold,0)
        array_push(show_anim_pos,0)
        array_push(show_flash,0)
        
        num++
    },
    reset: function (){
        sprite = []
        color = []
        name = []
        desc = []
        price = []
        rank = []
        bp_cost = []
        state = []
        order_number = []
        upgrade_id = []
        prev_upgrade_id = []
        show_anim_pos = []
        show_flash = []
        unlock_hold = []
        bp_now = []
        bp_spawned = []
        mouse_on = []
        px = []
        py = []
        num = 0
    }
}

function upgrades_update(){
    if upgrades.num>0
        upgrades.reset()
    
    var _upgrs = [
        "main_0",
        "main_1",
        "left_0",
        "left_1",
        "left_2",
        "middle_0",
        "middle_1",
        "middle_2",
        "right_0",
        "right_1",
        "right_2"
    ]
    
    for (var i = 0; i < array_length(_upgrs); i++) {
    	upgrades.add(_upgrs[i])
    }
}

monkeys = [
	"dart_monkey",
	"tack_shooter",
	"boomerang_thrower",
	"sniper_monkey",
	"ninja_monkey",
	"bomb_tower",
	"sub_monkey",
	"charge_tower",
	"glue_gunner",
	"ice_monkey",
	"buccaneer",
	"engineer",
	"ace_monkey",
	"bloonchipper",
	"alchemist_monkey",
	"apprentice_monkey",
	"monkey_village",
	"banana_farm",
	"mortar_monkey",
	"dartling_gunner",
	"spike_factory",
	"heli_pilot",
	"plasma_monkey",
	"super_monkey",
]
var _monkeys_length = array_length(monkeys)

for (var i = 0; i <_monkeys_length; i++) {
	panels.add(monkeys[i])
}

instance_create_depth(4,5,depth,obj_exit_button)