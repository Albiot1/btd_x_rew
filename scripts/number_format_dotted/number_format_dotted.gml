function number_format_dotted(_number){
    var _num = string(floor(_number))
    var _start = ""
    if string_count("-",_num)>0{
        _num = string_replace(_num,"-","")
        _start = "-"
    }
    var _slen = string_length(_num)
    var _offset = 0
    var _pos = _slen-2

    if _slen>=4{
        while _pos-_offset > 1{
            _num = string_insert(".",_num,_pos-_offset)
            _pos-=3
        }
    }
    
    return _start+_num
}