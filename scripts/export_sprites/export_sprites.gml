///@desc Exports all sprites from the project
function export_sprites(){

var _sprites_list = asset_get_ids(asset_sprite)
var _sprites_number = array_length(sprites_list)
for(var i=0;i<sprites_number;i++)
{
var _current_spr = sprites_list[i]
var _frames = sprite_get_number(_current_spr)
var _sprite_name = sprite_get_name(_current_spr)
var _sprite_copy = sprite_duplicate(_current_spr)
var _save_name = working_directory+"SPRITES//"+_sprite_name+".png"

if _frames==1
sprite_save(_sprite_copy,0,_save_name)
else
sprite_save_strip(_sprite_copy,_save_name)

sprite_delete(_sprite_copy)

}

}