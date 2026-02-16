///@desc Loads a json file
///@arg {String} File_path
///@return {Struct}
function load_json(_file){

var _resoult = -1

var _buff=buffer_load(_file)
if _buff!=-1
{
_resoult = json_parse(buffer_read(_buff,buffer_string))
buffer_delete(_buff)
}

return _resoult

}