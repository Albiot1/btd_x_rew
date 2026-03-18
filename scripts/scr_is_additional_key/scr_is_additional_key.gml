function scr_is_additional_key(_key){
    var _check = false
    
    switch (_key) {
        case vk_shift: _check = true break;
        case vk_lcontrol: _check = true break;
        case vk_rcontrol: _check = true break;
        case vk_lshift: _check = true break;
        case vk_rshift: _check = true break;
        case vk_lalt: _check = true break;
        case vk_ralt: _check = true break;
    }
    
    return _check
}