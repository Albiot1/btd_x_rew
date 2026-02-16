///@desc Searches through given directory and saves all files into an array
///@arg {String} Path
///@arg {Bool} Folders Add folders into the list
///@return {Array[String]}
function file_get_list(path,folders){

var _file_list=[]

var search=fa_none
if folders
search=fa_directory

var _first_file=file_find_first(path+"\\*",search)
if _first_file!=""
	{
var file=0
array_push(_file_list,_first_file)
var mx=0
while file!=_first_file and mx<5 and _first_file!=""
{
file=file_find_next()
if file!=""
	{
array_push(_file_list,file)
	}
else
	{
	mx++
	}
}
	}

return _file_list

}