page_text = scr_get_translation("credits_page_count_text")

page = 0
max_page = 6
info = {
    texts:scr_get_translation("credits_texts"),
    //halign !
    alignment:[
        fa_center,
        fa_center,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_center
    ],
    start_x:[
        373,
        373,
        4,
        4,
        4,
        4,
        373
    ],
    start_y:[
        250,
        250,
        250,
        250,
        250,
        250,
        250
    ],
    number:[
        
    ]
}

text_shown = 0

for (var i = 0; i <= max_page; i++) {
    var _texts_num = array_length(info.texts[i])
	var _texts_height = _texts_num*32
    info.start_y[i] = info.start_y[i] - _texts_height/2
    info.number[i] = _texts_num
}

back_alpha = 0
texts_alpha = array_create(info.number[page],0)

wait = 10

enum CREDITS_STATE {
    APPEAR,
    SHOW,
    DISSAPEAR
}

state = CREDITS_STATE.APPEAR

//139, 38
x = 139
y = 38+650
anim = [animcurve_get(an_credits_appear),animcurve_get(an_credits_disappear)]
chan = [animcurve_get_channel(anim[0],"curve1"),animcurve_get_channel(anim[1],"curve1")]
anim_pos = 0

exit_button = {
    pos:[746-64,8],
    mouse_on:false,
    step:function (_xp,_yp){
        var _x = pos[0]
        var _y = pos[1]
        if point_in_rectangle(mouse_x,mouse_y,_x+_xp,_y+_yp,_x+_xp+64,_y+_yp+64){
            mouse_on = true
            if mouse_check_button_pressed(mb_left){
                return true
            }
        }
        else {
        	mouse_on = false
        }
        return false
    },
    draw:function (_x,_y){
        shader_set(sh_replace)
        shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
        shader_set_uniform_f( global.shaders.replace[1],mouse_on )
        draw_sprite(spr_exit_button,0,_x+pos[0],_y+pos[1])
        shader_reset()
    }
}