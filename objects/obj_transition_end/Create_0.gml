if global.settings.instant_start_transition == true{
    instance_destroy()
}
if global.start_transition_ened == false{
    global.start_transition_ened = true
    global.gui_layer = 1
}
else{
    instance_destroy()
}

anim = animcurve_get_channel( animcurve_get(an_transition_clouds_dissapear),"curve1" )
anim_pos = 0
anim_val = 0

depth = -2500
