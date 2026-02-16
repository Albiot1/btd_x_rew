///@desc Draws grid in specified place with specified spacing beteween and repeats
///@arg {Real} X
///@arg {Real} Y
///@arg {Real} Spacing
///@arg {Real} Repeats
function draw_grid(_x,_y,_spacing,_repeats){
	var _end = _spacing*_repeats
	
	for(var i=0;i<=_repeats;i++){
		draw_line(_x,_y+_spacing*i,_x+_end,_y+_spacing*i)
	}
	for(var c=0;c<=_repeats;c++){
		draw_line(_x+_spacing*c,_y,_x+_spacing*c,_y+_end)
	}	
}