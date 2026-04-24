if sprite_index == spr_laughing_bloon_start_menu{
    repeat (irandom_range(5,8)) {
        with instance_create_depth(x,y,depth,obj_start_menu_bloon){
            mouse_on = 5
            image_index = 3
            depth = other.depth
        }
    }
}