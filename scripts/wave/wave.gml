///@desc Returns a value that is sinusoid based on time and is specified by from/to values
///@arg {Real} From
///@arg {Real} To
///@arg {Real} Duration
///@arg {Real} Offset
///@arg {Real} Time
///@retrun {Real}
function wave(_from,_to,_duration,_offset,_time = current_time * 0.001){
	var _a4 = (_to - _from) * 0.5;
	return _from + _a4 + sin( ( ( ( _time ) + _duration + _offset) / _duration ) * ( pi * 2 ) ) * _a4
}