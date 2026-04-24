if anim_pos>=1{
    instance_destroy()
}
if anim_pos>=0.4 and set_layer == false{
    global.gui_layer = 0
    global.gui_wait = 10
    set_layer = true
}
anim_pos+=0.025
anim_val = animcurve_channel_evaluate(anim,anim_pos)