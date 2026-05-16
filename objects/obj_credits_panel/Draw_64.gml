draw_set_alpha(0.5*back_alpha)

draw_rectangle_color(0,0,1024,576,c_black,c_black,c_black,c_black,0)

draw_set_alpha(1)

draw_sprite(spr_info_panel,0,x,y)
draw_set_font(font_general_15)
draw_set_halign(info.alignment[page])
for (var i = 0; i < info.number[page]; i++) {
    var _txt = info.texts[page][i]
    var _alpha = texts_alpha[i]
	draw_text_color(x+info.start_x[page],y+info.start_y[page]+32*i,_txt,c_white,c_white,c_white,c_white,_alpha)
}
draw_set_halign(fa_left)

draw_text(x+746-120,y+500-32,page_text+string(page)+"/"+string(max_page))
draw_set_font(font_general_16)

exit_button.draw(x,y)