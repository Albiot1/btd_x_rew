trail = {
    px:[],
    py:[],
    pd:[],
    num:0,
    tm:[]
}

sptime = 1

prevdir = 0

sprite = spr_trail
texture = sprite_get_texture(sprite,0)

order = [ [0,0],[1,0],[0,1],[1,1] ]

prevx = x
prevy = y