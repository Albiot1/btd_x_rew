///@desc Returns the position with set offset based on position and direction
///@arg {Real} X
///@arg {Real} Y
///@arg {Real} x_offset
///@arg {Real} y_offset
///@arg {Real} direction
///@return {Array.real}
function get_offset_relative(pos_x,pos_y,x_find,y_find,dir_){
    var _cos = dcos(dir_);
    var _sin = dsin(dir_);

    var _rx = (x_find * _cos) + (y_find * _sin);
    var _ry = (y_find * _cos) - (x_find * _sin);
    
    return [pos_x + _rx, pos_y + _ry];
}