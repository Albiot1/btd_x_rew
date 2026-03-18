function scr_get_key_name(_key){
    if _key == -1
        return "NOT BINDED"
    
    var _resoult = chr(_key)
    
    switch (_key) {
        case vk_backspace: _resoult = "BACKSPACE" break;
        case vk_space: _resoult = "SPACE" break;
        case vk_enter: _resoult = "ENTER" break;
        case vk_tab: _resoult = "TAB" break;
        case vk_shift: _resoult = "SHIFT" break;
        case vk_lcontrol: _resoult = "L.CTRL" break;
        case vk_rcontrol: _resoult = "R.CTRL" break;
        case vk_lshift: _resoult = "L.SHIFT" break;
        case vk_rshift: _resoult = "R.SHIFT" break;
        case vk_lalt: _resoult = "L.ALT" break;
        case vk_ralt: _resoult = "R.ALT" break;
        case vk_home: _resoult = "HOME" break;
        case vk_end: _resoult = "END" break;
        case vk_delete: _resoult = "DELETE" break;
        case vk_pagedown: _resoult = "PG.DOWN" break;
        case vk_pageup: _resoult = "PG.UP" break;
        case vk_insert: _resoult = "INSERT" break;
        case vk_f1:  _resoult = "F1" break;
        case vk_f2:  _resoult = "F2" break;
        case vk_f3:  _resoult = "F3" break;
        case vk_f4:  _resoult = "F4" break;
        case vk_f5:  _resoult = "F5" break;
        case vk_f6:  _resoult = "F6" break;
        case vk_f7:  _resoult = "F7" break;
        case vk_f8:  _resoult = "F8" break;
        case vk_f9:  _resoult = "F9" break;
        case vk_f10: _resoult = "F10" break;
        case vk_f11: _resoult = "F11" break;
        case vk_f12: _resoult = "F12" break;
        case 186: _resoult = ";" break;
        case 187: _resoult = "=" break;
        case 188: _resoult = "," break;
        case 189: _resoult = "-" break;
        case 190: _resoult = "." break;
        case 191: _resoult = "/" break;
        case 220: _resoult = "\\" break;
        case 222: _resoult = "'" break;
    }
    
    return _resoult
}