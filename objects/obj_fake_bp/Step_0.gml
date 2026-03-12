anim_pos+=0.025

if anim_pos<1{
    var _pos_multi = animcurve_channel_evaluate(anim_channel_pos,anim_pos)
    var _alpha = clamp(animcurve_channel_evaluate(anim_channel_alpha,anim_pos),0,1)
    var _scale = clamp(animcurve_channel_evaluate(anim_channel_scale,anim_pos),0,2)
    
    x = lerp( x,next_x,_pos_multi )
    y = lerp( y,next_y,_pos_multi)
    // xstart - next_x*_pos_multi
    //y = ystart - next_y*_pos_multi
    image_alpha = _alpha
    image_xscale = _scale
    image_yscale = _scale
    
}
else {
	instance_destroy()
}