mode_select.draw()

milestone_bar.draw()

//modifications bottom bar
draw_sprite_stretched(spr_scroll_bar,0,0,416,1024,160)
//

var _px = play_button.pos[0]
var _py = play_button.pos[1]
var _pw = play_button.size[0]
var _ph = play_button.size[1]

shader_set(sh_replace)
shader_set_uniform_f(global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B)
shader_set_uniform_f(global.shaders.replace[1],play_button.mouse_on)
draw_sprite_stretched(spr_play_button,0,_px,_py,_pw,_ph)
shader_reset()

draw_set_font(font_general_20)
align_set(fa_center,fa_middle)
draw_text_outline(_px+_pw/2,_py+_ph/2,c_black,c_white,play_button.text)
align_reset()

if global.game_mode == -1{
    draw_sprite_stretched_ext(spr_play_button,0,_px,_py,_pw,_ph,c_black,0.5)
}

modifications.draw()

