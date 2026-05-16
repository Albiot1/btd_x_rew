if page > 0{
    var _x = 1024-64
    var _y = 16
    
    if (point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left)) or mouse_wheel_up(){
        page-=0.5
    }
}

if page<max_page{
    var _x = 1024-64
    var _y = 576-48
    
    if (point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+32) and mouse_check_button_pressed(mb_left)) or mouse_wheel_down(){
        page+=0.5
    }
}

mouse_on = -1

var _row = 0
var _col = 0
for (var i = 4*page; i < clamp(4*(page+1),0,number); i++) {
    
    var _x = 96 + 448*_row
    var _y = 64 + (192+64)*_col
    
    if point_in_rectangle(mouse_x,mouse_y,_x-24,_y-24,_x+376,_y+155){
        mouse_on = i
    }
    
    _row++
    if _row>1{
        _row = 0
        _col++
    }
    
}