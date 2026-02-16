var _dir = point_direction(x,y,points.next_x,points.next_y)+irandom_range(-15,15)
direction += angle_difference(_dir,direction)*0.04
image_angle = direction

if point_in_circle(x,y,points.next_x,points.next_y,4){
    if chance(points.scan_chance[points.current]){
        instance_create_depth(x,y,depth-1,obj_fake_sub_scan)
    }
    points.get_next()
}