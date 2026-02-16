speed = 0.25 + random(1)
direction = 72 + random(36)

var _type = irandom(4)

image_index = _type

if chance(2.5){
    sprite_index = spr_laughing_bloon_start_menu
    _type = 5
}

type = _type

depth = choose(99,199,299)

inside_room = false
mouse_on = false