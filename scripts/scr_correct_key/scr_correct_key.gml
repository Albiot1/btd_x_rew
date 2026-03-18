#macro vk_windows_key 91 
#macro vk_screen_lock 145
#macro vk_caps_lock 20
#macro vk_tilde 192
#macro vk_num_star 106 //Numpad *
#macro vk_num_plus 107  //Numpad +
#macro vk_num_minus 109  //Numpad -
#macro vk_num_slash 111  //Numpad /

function scr_correct_key(_key){
    
    var _bad = [
        vk_escape, vk_enter,
        vk_left, vk_right, vk_up, vk_down,
        vk_printscreen, vk_pause,
        vk_numpad0, vk_numpad1, vk_numpad2, vk_numpad3, vk_numpad4, vk_numpad5, vk_numpad6, vk_numpad7, vk_numpad8, vk_numpad9, vk_num_star, vk_num_plus, vk_num_minus, vk_num_slash,
        vk_windows_key, vk_screen_lock, vk_caps_lock, vk_tilde
    ];
    
    if array_contains(_bad, _key) return false
    
    //f1 - f12
    if _key>=112 and _key<=123{
        return true
    }
    //letters
    if _key>=65 and _key<=90{
        return true
    }
    //numbers
    if _key>=48 and _key<=57{
        return true
    }
    //operators
    if (_key>=186 and _key<=191) or (_key==220 or _key==222){
        return true
    }
    
    var _good = [
        vk_space,
        vk_f1,
        vk_f2,
        vk_f3,
        vk_f4,
        vk_f5,
        vk_f6,
        vk_f7,
        vk_f8,
        vk_f9,
        vk_f10,
        vk_f11,
        vk_f12,
        vk_tilde,
        vk_delete,
        vk_end,
        vk_pageup,
        vk_pagedown,
        vk_home,
        vk_insert,
        vk_tab
    ]
    
    if array_contains(_good,_key) return true
    
    return false;
}