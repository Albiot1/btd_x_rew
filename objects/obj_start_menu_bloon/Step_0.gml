if knockback_time>0{
    x+=knockback[0]*(knockback_time/10)
    y+=knockback[1]*(knockback_time/10)
    knockback_time--
}


if mouse_on>0
    mouse_on--


if inside_room == false{
    if point_in_rectangle(x,y,0,0,room_width,room_height){
        inside_room = true
    }
}