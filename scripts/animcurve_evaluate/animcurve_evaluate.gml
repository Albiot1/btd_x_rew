///@desc faster way to use animation curve just pass the animation curve choose the channel and animation position and it will return the value
///@return {Real} Returns specific point in time from a channel struct from animation curve
///@arg {Asset.GMAnimCurve} animation_curve
///@arg {String} animation_curve_channel
///@arg {Real} animation_position
function animcurve_evaluate(_animation_curve,_channel,_animation_posiotion){
var _animation_curve_id=animcurve_get(_animation_curve)
var _animation_curve_channel=animcurve_get_channel(_animation_curve_id,_channel)
return animcurve_channel_evaluate(_animation_curve_channel,_animation_posiotion)
}