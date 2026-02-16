///@desc Returns the position with set offset based on position and direction
///@arg {Real} X
///@arg {Real} Y
///@arg {Real} x_offset
///@arg {Real} y_offset
///@arg {Real} direction
///@return {Array.real}
function get_offset_relative(pos_x,pos_y,x_find,y_find,dir_){
var px=x_find
var py=y_find

var c_len = point_distance(0, 0, px, py)
var c_ang = point_direction(0, 0, px, py)

px=pos_x + lengthdir_x(c_len, c_ang+dir_)
py=pos_y + lengthdir_y(c_len, c_ang+dir_)

return [ px,py ]

}