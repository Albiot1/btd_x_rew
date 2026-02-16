///@desc Draws the text with specificed outline
///@arg {Real} x
///@arg {Real} y
///@arg {Constant.Color} outline_color
///@arg {Constant.Color} string_color
///@arg {String} string
///@arg {Real} sep The distance between lines of code.
///@arg {Real} w The maximum width in pixels of the string before a line break.
function draw_text_outline_ext(_x,_y,_outline_color,_string_color,_string,_sep,_w){
	var _old_color = draw_get_color()

		draw_set_color(_outline_color)
		
		draw_text_ext(_x+1,_y+1,_string,_sep,_w)
		draw_text_ext(_x-1,_y-1,_string,_sep,_w)
		
		draw_text_ext(_x,_y+1,_string,_sep,_w)
		draw_text_ext(_x+1,_y,_string,_sep,_w)
		
		draw_text_ext(_x,_y-1,_string,_sep,_w) 
		draw_text_ext(_x-1,_y,_string,_sep,_w)
		
		draw_text_ext(_x-1,_y+1,_string,_sep,_w)
		draw_text_ext(_x+1,_y-1,_string,_sep,_w)
		
		draw_text_ext(_x,_y+2,_string,_sep,_w)
		draw_text_ext(_x+2,_y,_string,_sep,_w)
		
		draw_text_ext(_x+2,_y+2,_string,_sep,_w)
		draw_text_ext(_x+1,_y+2,_string,_sep,_w)
		
		draw_text_ext(_x+2,_y+1,_string,_sep,_w)
		
		draw_set_color(_string_color)

		draw_text_ext(_x,_y,_string,_sep,_w)

	draw_set_color(_old_color)
}