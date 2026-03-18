anim = animcurve_get(an_resource_used_fly)
anim_channel_pos = animcurve_get_channel(anim,"curve1")
anim_channel_alpha = animcurve_get_channel(anim,"curve2")
anim_channel_scale = animcurve_get_channel(anim,"curve3")
next_x = 0
next_y = 0
anim_pos = 0
anim_spd = 0.025