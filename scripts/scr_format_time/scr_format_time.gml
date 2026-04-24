function scr_format_time(_time)
{
    var _seconds = _time mod 60
    var _minutes = floor(_time/60) mod 60
    var _hours = floor(_time/3600) mod 60
    
    var result = ""
    
    if (_hours > 0){
        result += string(_hours) + "H "
    }

    if (_minutes > 0){
        result += string(_minutes) + "M "
    }
    
    if (_seconds > 0){
        result += string(_seconds) + "S "
    }
    
    return result;
}