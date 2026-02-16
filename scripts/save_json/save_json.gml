///@desc Save's a struct as a json file to specified location
///@arg {Struct} Struct
///@arg {String} Name
///@arg {String} Path
function save_json(_struct,_name,_path){

var _buff=buffer_create(1024,buffer_grow,1)
var _val=json_stringify(_struct,1)
buffer_write(_buff,buffer_text,_val)
buffer_save(_buff,_path+_name+".json")
buffer_delete(_buff)

}