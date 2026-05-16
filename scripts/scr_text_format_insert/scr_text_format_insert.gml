function scr_text_format_insert(_text,_data){
    
    var _num = string_count("{",_text)
    
    for (var i = 0; i < _num; i++) {
    	_text = string_replace(_text,"{"+$"{i}"+"}",_data[i])
    }
    
    return _text
    
}