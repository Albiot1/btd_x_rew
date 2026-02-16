depth = 5

points = {
	px:[896,944,992,1008,1104,1152,1184,1152,1104,992],
	py:[528,432,368,304,256,304,352,464,528,544],
    scan_chance:[25,0,25,0,25,0,0,25,0,25],
    num:10,
    current:1,
    next_x:-1,
    next_y:-1,
    get_next:function (){
        next_x = px[current]+irandom_range(-8,8)
        next_y = py[current]+irandom_range(-8,8)
        current++
        if current>(num-1){
            current = 0
        }
    }
}

points.get_next()
speed = 0.65