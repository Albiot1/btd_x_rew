draw_set_font(font_general_15)

info = {
    texts:[
            "Bloons TDX Rewritten Information:",
            "",
            "When starting off you have access to [YELLOW]all tier 3[END] upgrades",
            "   Tier [YELLOW]4[END] and [YELLOW]5[END] can be unlocked in the [YELLOW]\"Towers\"[END] menu",
            "",
            "The game [GREEN]automatically[END] saves when in the main menu",
            "   The game [GREEN]automatically[END] loads when it starts",
            "",
            "The hot keys for upgrading are [YELLOW]Z[END], [YELLOW]X[END], and [YELLOW]C[END]",
            "   Hot keys for towers are [YELLOW]0[END]-[YELLOW]9[END], [YELLOW]Q[END]-[YELLOW]P[END], and [YELLOW]FGHVBN[END]",
            "",
            "You earn extra [BP]Bloon Points[END] by getting a [YELLOW]large score[END]",
            "   You can do this multiple times",
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
        fa_left,
        fa_left
    ],
    start_x:[
        373,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        4
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
    
   // show_message(formatted_texts[_num])
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

state = "appear"

//139, 38
x = 139
y = 38+650
anim = [animcurve_get(an_credits_appear),animcurve_get(an_credits_disappear)]
chan = [animcurve_get_channel(anim[0],"curve1"),animcurve_get_channel(anim[1],"curve1")]
anim_pos = 0