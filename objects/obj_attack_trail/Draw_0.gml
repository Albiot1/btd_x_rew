var _sc = 0

if trail.num>0{
    _sc = clamp(trail.num,1,5)/5
}

draw_sprite_ext(sprite,1,x,y,_sc,_sc,prevdir-90,c_white,1)

draw_primitive_begin_texture(pr_trianglestrip,texture);

var _pos = 0
for (var i = 0; i < trail.num; i++) {

    var _px = trail.px[i]
    var _py = trail.py[i]
    var _pd = trail.pd[i]
    
    var _dist = 0
    var _lb = [0,0]
    var _lt = [0,0]
    
    if i < trail.num-1{
        if _pos>3
            _pos=0
        
        _dist = clamp(i,1,5)
        _pd+=90
        draw_vertex_texture_color(_px+lengthdir_x(_dist,_pd),_py+lengthdir_y(_dist,_pd),order[_pos][0],order[_pos][1],c_white,1)    
        _pos++
        if _pos>3
            _pos = 0
        _pd-=180
        draw_vertex_texture_color(_px+lengthdir_x(_dist,_pd),_py+lengthdir_y(_dist,_pd),order[_pos][0],order[_pos][1],c_white,1)
        _pos++
        
        _px = trail.px[i+1]
        _py = trail.py[i+1]
        _pd = trail.pd[i+1]
        
        if _pos>3
            _pos=0
        
        _dist = clamp(i,1,5)
        _pd+=90
        draw_vertex_texture_color(_px+lengthdir_x(_dist,_pd),_py+lengthdir_y(_dist,_pd),order[_pos][0],order[_pos][1],c_white,1)    
        _pos++
        if _pos>3
            _pos = 0
        _pd-=180
        draw_vertex_texture_color(_px+lengthdir_x(_dist,_pd),_py+lengthdir_y(_dist,_pd),order[_pos][0],order[_pos][1],c_white,1)
        _pos++
    }
    else {
        if _pos>3
            _pos=0
        
        _dist = clamp(i,1,5)
        _pd+=90
        draw_vertex_texture_color(_px+lengthdir_x(_dist,_pd),_py+lengthdir_y(_dist,_pd),order[_pos][0],order[_pos][1],c_white,1)    
        _pos++
        
        if _pos>3
            _pos = 0
        
        _pd-=180
        draw_vertex_texture_color(_px+lengthdir_x(_dist,_pd),_py+lengthdir_y(_dist,_pd),order[_pos][0],order[_pos][1],c_white,1)
        _pos++
    }

}

draw_primitive_end()