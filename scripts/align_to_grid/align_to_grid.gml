///@desc Return's position aligned to the specified grid size
///@arg {Real} X
///@arg {Real} Y
///@arg {Real} Grid_size
function align_to_grid(_x,_y,_grid_size){

var _grid_fix_pos = _grid_size/2
return [ _grid_fix_pos+floor(_x/_grid_size)*_grid_size,_grid_fix_pos+floor(_y/_grid_size)*_grid_size ]	
	
}