/// @desc get_nearest_bbox gets the nearest position around the object basing on bounding box
/// @param {any} _x my x
/// @param {any} _y my y
/// @param {Asset.GMObject} _obj object to check
/// @returns {array.real} Description
function get_nearest_bbox(_x,_y,_obj){

    var _return = [-1,-1]
    
    var _bl = _obj.bbox_left
    var _br = _obj.bbox_right
    var _bt = _obj.bbox_top
    var _bb = _obj.bbox_bottom
    
    var _xside = XPOS.BETWEEN
    if _x<_bl
        _xside = XPOS.LEFT
    else if _x>_br
        _xside = XPOS.RIGHT
    else if _x >= _bl and _x<= _br
        _xside = XPOS.BETWEEN
    
    var _yside = YPOS.BETWEEN
    if _y<_bt
        _yside = YPOS.OVER
    else if _y>_bb
        _yside = YPOS.UNDER
    else if _y>=_bt and _y<=_bb
        _yside = YPOS.BETWEEN
    
    switch (_xside) {
    	case XPOS.BETWEEN: 
            switch (_yside) {
            	case YPOS.OVER: 
                    _return[0] = clamp(_x+irandom_range(-8,8),_bl,_br)
                    _return[1] = _bt
                break;
                case YPOS.BETWEEN: 
                    _return[0] = _obj.x
                    _return[1] = _y
                break;
                case YPOS.UNDER: 
                    _return[0] = clamp(_x+irandom_range(-8,8),_bl,_br)
                    _return[1] = _bb
                break;
            }
        break;
        case XPOS.LEFT: 
            switch (_yside) {
            	case YPOS.OVER: 
                    _return[0] = _bl
                    _return[1] = _bt+irandom_range(2,4)
                break;
                case YPOS.BETWEEN: 
                    _return[0] = _bl
                    _return[1] = clamp(_y+irandom_range(-8,8),_bt,_bb)
                break;
                case YPOS.UNDER: 
                    _return[0] = _bl
                    _return[1] = _bb-irandom_range(2,4)
                break;
            }
        break;
        case XPOS.RIGHT: 
            switch (_yside) {
            	case YPOS.OVER: 
                    _return[0] = _br
                    _return[1] = _bt+irandom_range(2,4)
                break;
                case YPOS.BETWEEN: 
                    _return[0] = _br
                    _return[1] = clamp(_y+irandom_range(-8,8),_bt,_bb)
                break;
                case YPOS.UNDER: 
                    _return[0] = _br
                    _return[1] = _bb-irandom_range(2,4)
                break;
            }
        break;
    }
    
    return _return
    
}