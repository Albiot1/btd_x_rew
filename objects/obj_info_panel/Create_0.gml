draw_set_font(font_general_15)

info = {
    texts:[
            scr_get_translation("info_panel_main"),
            "",
            scr_get_translation("info_panel_upgrades"),
            scr_get_translation("info_panel_upgrades_1"),
            "",
            scr_get_translation("info_panel_saving"),
            scr_get_translation("info_panel_saving_1"),
            "",
            scr_get_translation("info_panel_hotkeys"),
            "",
            scr_get_translation("info_panel_extra"),
            scr_get_translation("info_panel_extra_1"),
    ],
    alignment:[
        fa_center,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_left
    ],
    start_x:[
        373,
        8,
        8,
        8,
        8,
        8,
        8,
        8,
        8,
        8,
        8,
        8
    ],
    start_y:[
        250,
        250,
        250,
        250,
        250,
        250,
        250,
        250,
        250,
        250,
        250,
        250,
    ],
    number:-1
}

formatted_texts = array_create(array_length(info.texts[0]),undefined)

function text_format(_text,_num){
    var _txts = []
    var _xpos = []
    var _col = []
    
    var _formatters = string_count("[",_text)/2
    var _last_pos = 0
    var _last_xpos = 0
    
    for (var i = 0; i < _formatters; i++) {
    	
        var _format_opener = string_pos_ext("[",_text,_last_pos)
        var _format_closer = string_pos_ext("]",_text,_last_pos)
        var _end_opener = string_pos_ext("[",_text,_format_closer+1)
        var _end_closer = string_pos_ext("]",_text,_format_closer+1)
        
        if _format_opener!=_last_pos{
            
            var _norm_text = string_copy( _text,_last_pos,_format_opener-_last_pos )
            var _str_w = string_width(_norm_text)
            
            array_push(_txts,_norm_text)
            array_push(_xpos,_last_xpos)
            array_push(_col,c_white)
            
            _last_xpos+=_str_w
        }
        
        var _format = string_copy( _text,_format_opener+1,_format_closer-_format_opener-1 )
        var _color = c_white
        switch (_format) {
        	case "YELLOW": _color = COLOR_TROPHIES break;
            case "BP": _color = COLOR_BLOONPOINTS break;
            case "GREEN": _color = c_green break;
        }
        var _text_formatted = string_copy( _text,_format_closer+1,_end_opener-_format_closer-1 )
        
        array_push(_txts,_text_formatted)
        array_push(_xpos,_last_xpos)
        array_push(_col,_color)
        _last_xpos+=string_width(_text_formatted)
        _last_pos = _end_closer+1
        
    }
    
    if _last_pos < string_length(_text){
        var _text_end = string_copy(_text,_last_pos, string_length(_text)-_last_pos+1 )
        array_push(_txts,_text_end)
        array_push(_xpos,_last_xpos)
        array_push(_col,c_white)
    }
    
    formatted_texts[_num] = {
        text: _txts,
        xpos: _xpos,
        color: _col,
        number: array_length(_txts)
    }
}



function draw_text_formatted(_x,_y,_text,_alpha,_num){
    if formatted_texts[_num] == undefined{
        text_format(_text,_num)
    }
    
    var _txts = formatted_texts[_num].text
    var _xpos = formatted_texts[_num].xpos
    var _col = formatted_texts[_num].color
    var _numb = formatted_texts[_num].number
    
    for (var i = 0; i < _numb; i++) {
    	draw_text_color(_x+_xpos[i],_y,_txts[i],_col[i],_col[i],_col[i],_col[i],_alpha)
    }
}

text_shown = 0


var _texts_num = array_length(info.texts)
var _texts_height = _texts_num*32
for (var i = 0; i < _texts_num; i++) {
	info.start_y[i] = info.start_y[i] - _texts_height/2
    text_format(info.texts[i],i)
}
info.number = _texts_num


back_alpha = 0
texts_alpha = array_create(info.number,0)

wait = 10

enum INFO_PANEL_STATE {
    APPEAR,
    SHOW,
    DISSAPEAR
}

state = INFO_PANEL_STATE.APPEAR

//139, 38
x = 139
y = 38+650
anim = [animcurve_get(an_credits_appear),animcurve_get(an_credits_disappear)]
chan = [animcurve_get_channel(anim[0],"curve1"),animcurve_get_channel(anim[1],"curve1")]
anim_pos = 0

exit_button = {
    pos:[8,8],
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