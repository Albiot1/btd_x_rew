if global.settings.show_fps == true{
    draw_set_font(font_general_12)
    draw_set_halign(fa_right)
    var _str = $"FPS: {fps}"
    var _strw = string_width(_str)
    draw_set_alpha(0.4) draw_set_color(c_black)
    draw_rectangle(1024-_strw,0,1024,16,0)
    draw_set_alpha(1) draw_set_color(c_white)
    draw_text(1024,0,_str)
    draw_set_halign(fa_left)
}