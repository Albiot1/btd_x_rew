function scr_get_upgrade_name(_tower_id,_upgrade_id){
    var _search = _tower_id+"_"+_upgrade_id+"_name"
    
    if variable_struct_exists(global.upgrades.translation,_search){
        return global.upgrades.translation[$ _search]
    }
    else {
        show_debug_message($"Upgrade name : {_search} NOT FOUND !!!")
    	return "NOT FOUND!"
    }
}

