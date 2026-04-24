repeat (irandom_range(5,9)) {
	with instance_create_depth(x,y,depth,obj_start_menu_bloon){
        mouse_on = 5
        depth = other.depth
        
        //we dont want an emoji bloon inside
        var _type = irandom(4)
        image_index = _type
    }
}