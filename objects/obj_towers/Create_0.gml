xit_button = {
    pos:[4,5],
    mouse_on:false,
    step:function (){
        var _x = pos[0]
        var _y = pos[1]
        if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+64,_y+64){
            mouse_on = true
            if mouse_check_button_pressed(mb_left){
                room_goto(rm_main_menu)
            }
        }
        else {
        	mouse_on = false
        }
    },
    draw:function (){
        shader_set(sh_replace)
        shader_set_uniform_f( global.shaders.replace[0],1,1,1 )
        if mouse_on == false
        shader_set_uniform_f( global.shaders.replace[1],false )
        else 
        shader_set_uniform_f( global.shaders.replace[1],true )
        draw_sprite(spr_agent_menu_exit_button,0,pos[0],pos[1])
        shader_reset()
    }
}