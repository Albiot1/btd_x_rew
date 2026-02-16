if in_port == false{

    speed = lerp(speed,init_speed,0.2)
    if exiting == false{
        var _dir = point_direction(x,y,port_position[0],port_position[1])
        direction += angle_difference( _dir,image_angle )*0.1
        
        if point_in_circle(x,y,port_position[0],port_position[1],4){
            in_port = true
        }
    }
    else{
        var _x = exit_point[0] + exit_random_x
        var _y = exit_point[1] + exit_random_y
        var _dir = point_direction(x,y,exit_point[0],exit_point[1])
        direction += angle_difference( _dir,image_angle )*0.1
        
        if point_in_circle(x,y,exit_point[0],exit_point[1],4){
            exiting = false
        }
    }
    
}
else{
	
    speed = lerp(speed,0,0.2)
    var _dir = 90
    direction += angle_difference( _dir,image_angle )*0.05
    
    if port_wait<port_wait_max{
        port_wait++
    }
    else {
    	port_wait = 0
        in_port = false
        exiting = true
        exit_random_x = irandom(100)
        exit_random_y = irandom(100)
    }
    
}

image_angle = direction