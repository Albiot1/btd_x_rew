///@desc Returns random item from an array
///@arg {Array}
///@return {Any}
function array_random(_array){
	var _len = array_length(_array)-1
	return _array[ irandom(_len) ]
}