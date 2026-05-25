draw_set_alpha(0.5*back_alpha)

draw_rectangle_color(0,0,1024,576,c_black,c_black,c_black,c_black,0)

draw_set_alpha(1)

draw_sprite(spr_info_panel,0,x,y)
draw_set_font(font_general_15)

for (var i = 0; i < info.number; i++) {
    draw_set_halign(info.alignment[i])
    var _txt = info.texts[i]
    var _alpha = texts_alpha[i]
    if i==0
	   draw_text_color(x+info.start_x[i],y+info.start_y[i]+32*i,_txt,c_white,c_white,c_white,c_white,_alpha)
    else
        draw_text_formatted(x+info.start_x[i],y+info.start_y[i]+32*i,_txt,_alpha,i)
}
draw_set_halign(fa_left)

exit_button.draw(x,y)