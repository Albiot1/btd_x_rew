/// @desc get_real_from_string gets only numbers from string and returns the real value
/// @param {string} _string string to get number from
/// @return {real} 
function get_real_from_string(_string){
    var _ret = string( string_digits( _string ) )
    if _ret==""
        _ret = 0
    return _ret
}