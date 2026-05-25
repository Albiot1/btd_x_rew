
draw_set_halign(fa_middle)
draw_set_valign(fa_center)

draw_text_outline(512,1248+64+4*sin(current_time/1000),c_black,#00C000,title_text)

draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_sprite(spr_better_logo,0,256,1008)

if !surface_exists(deluxe_surface){
    deluxe_surface = surface_create(111,25)
}

surface_set_target(deluxe_surface)

draw_clear_alpha(c_white,0)

var _col = make_color_rgb(234,131+65*abs(power(sin(timer),1)),0)

draw_sprite_ext(spr_deluxe_text,0,0,0,1,1,0,_col,1)

draw_sprite(spr_deluxe_light,0,flash_pos,2)

gpu_set_blendmode(bm_subtract)

draw_sprite(spr_deluxe_subtract,0,0,0)

gpu_set_blendmode(bm_normal)

surface_reset_target()

var _x = 256 + 354
var _y = 1008 + 173

draw_sprite(spr_deluxe_outline,0,_x,_y)

draw_surface(deluxe_surface,_x,_y)

draw_sprite(spr_clouds_left_bottom,0,0,cammaxy-40)
draw_sprite(spr_clouds_right_bottom,0,1064,cammaxy-40)
draw_sprite(spr_clouds_left,0,0,cammaxy-40)
draw_sprite(spr_clouds_right,0,1064,cammaxy-40)