///@desc Increase a value with diminishing returns
///@arg {Real} inital_var
///@arg {Real} add_amount
///@return {Real}
function sqrt_add(_initial_var,_add_amount){
	return sqrt(max( 0,(_initial_var * _initial_var)+ _add_amount))
}