draw_set_alpha(0.5*back_alpha)

draw_rectangle_color(0,0,1024,576,c_black,c_black,c_black,c_black,0)

draw_set_alpha(1)

draw_sprite(spr_info_panel,0,x,y)


shader_set(sh_replace)
shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
shader_set_uniform_f( global.shaders.replace[1],back_button_mouse_on )
draw_sprite(back_button_sprite,0,x+back_button_x,y+back_button_y)
shader_reset()


if state != SETTINGS_PANEL_STATE.HOTKEYS{
    main_settings.draw(x,y)
}
else{
    hotkey_settings.draw(x,y)
}

