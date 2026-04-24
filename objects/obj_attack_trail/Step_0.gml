
x=mouse_x
y=mouse_y
    
if sptime<=0 and point_distance(prevx,prevy,x,y)>8{
    array_push(trail.px,mouse_x)
    array_push(trail.py,mouse_y)
        
    prevx=mouse_x
    prevy=mouse_y
        
    var _newdir = prevdir + angle_difference(point_direction(xprevious,yprevious,mouse_x,mouse_y),prevdir)*0.4
    
    array_push(trail.pd,_newdir)
    array_push(trail.tm,15)
    
    prevdir = _newdir
    
    trail.num++
    sptime=1
}
    


sptime--

for (var i = trail.num-1; i >= 0; i--) {
    if trail.tm[i]>0{
        trail.tm[i]--
    }
    else {
    	array_delete(trail.tm,i,1)
        array_delete(trail.px,i,1)
        array_delete(trail.py,i,1)
        array_delete(trail.pd,i,1)
        trail.num--
    }
}

