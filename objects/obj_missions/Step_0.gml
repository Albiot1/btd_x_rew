mouse_on = -1

var _row = 0
var _col = 0

var _start_i = 2*page
var _end_i = clamp(6+2*(page),0,number)

for (var i = _start_i; i < _end_i; i++) {
    var _x = start_x + spacing_x*_row
    var _y = start_y + spacing_y*_col
    
    var _desc_h = desc_h[i]
    
    if point_in_rectangle(mouse_x,mouse_y,_x-24,_y-6,_x+400,_y+90+_desc_h){
        mouse_on = i
    }
    
    _row++
    if _row>1{
        _row = 0
        _col++
    }
    
}

if page>0{
    var _x = 1024-64
    var _y = 16
    if (point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left)) or mouse_wheel_up(){
        page-=1
    }
}
if page<max_page{
    var _x = 1024-64
    var _y = 576-48
    if (point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left)) or mouse_wheel_down(){
        page+=1
    }
}