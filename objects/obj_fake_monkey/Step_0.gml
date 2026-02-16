if point_distance(x,y,mouse_x,mouse_y)<60{
    angle = point_direction(x,y,mouse_x,mouse_y)
    back_wait = irandom_range(180,460)
}

image_angle += angle_difference(angle,image_angle)*0.1

if back_wait>0{
    back_wait--
    if back_wait<=0{
        angle = start_angle
    }
}