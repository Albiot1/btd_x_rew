draw_set_alpha(0.5*back_alpha)

draw_rectangle_color(0,0,1024,576,c_black,c_black,c_black,c_black,0)

draw_set_alpha(1)

draw_sprite(spr_info_panel,0,x,y)

if state != "hotkeys"{
    exit_button.draw(x,y)
    main_settings.draw(x,y)
}
else{
    back_button.draw(x,y)
    hotkey_settings.draw(x,y)
}

