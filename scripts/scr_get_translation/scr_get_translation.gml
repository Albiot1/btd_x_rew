function scr_get_translation(_key){
    if variable_struct_exists(global.translation,_key){
        return global.translation[$ _key]
    }
    else {
    	return $"key : \"{_key}\" NOT FOUND !"
    }
}