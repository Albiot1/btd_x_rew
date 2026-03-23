if anim_pos>=1{
    instance_destroy()
    global.gui_layer = 0
    global.gui_wait = 10
}
anim_pos+=0.025
anim_val = animcurve_channel_evaluate(anim,anim_pos)