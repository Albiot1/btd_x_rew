page = 0
max_page = 6
info = {
    texts:[
            [
                "Bloons TDX Rewritten Credits:",
                "Bloons TDX Rewritten is made by Peeko Hiko with consultation",
                "from Ramaf",
                "",
                "Its a complete rewrite of Bloons TDX",
                "",
                "Original Bloons TDX Credits:",
                "Bloons TDX is a fangame made by Ramaf Party",
                "ramafparty.com @ramafparty for more cool stuff"
            ],
            [
                "Newer Map Art + New Blimp/Boss Sprites",
                "",
                "* Weirdoverse *",
                "New Map Art",
                "Eruption",
                "",
                "Old and New Blimp Sprites, Sound Effects, and Animations",
                "Kaasblokje",
                "",
                "Balance and Testing - Bob, Salaziel, Nanerbag",
                "Music Bug - FlandreScarlet64"
            ],
            [
                "Crimson Creek - Ludicrousity",
                "Shade Woods - Top Carrot",
                "Omega River - Kalock100",
                "Portal Lab - Sheeper259",
                "Space Portals - Top Carrot",
                "Xtreme Park - Top Carrot & OverThePower",
                "Annoying Bloon + DDT - YouWouldNotBelieveYourEyes & Esprite",
                "Super Bloon 2&3 - YouWouldNotBelieveYourEyes & IHaventCare",
                "Bounty Bloon Medals - YouWouldNotBelieveYourEyes",
                "Heli-Pilot Sprite - Bnewton",
                "Bounty Mission Track - Bnewton",
                "Track Crawler Sprite + Prison Break Icons - YWNBYE",
                "Dart and Sniper Alt Sprites - OverThePower's alt account",
                "Dartling Alt Sprites - YouWouldNotBelieveYourEyes's Second Form",
                "New Final Boss Sprites - Extra",
                
            ],
            [
                "Love Bloon Family Sprites - THEZIGIX",
                "Bloonlight Throwback - TripledYou",
                "Bloon Circles X - Sheeper259 & YWNBYE",
                "Autumn Acres - Timobloonstime",
                "Graveyard - Jay + YWNBYE",
                "Village Defense - Weirdoverse",
                "Circuit - Top Carrot",
                "Grand Canyon - Weaz",
                "Bloonside River - AIDc",
                "Dreadnaut Sprite - Sheeper259",
                "Ghost Ship - Wierdoverse and kaasblokje",
                "Bananamobile Idea - Robert Marcinkowski",
                "New Bounty Medals - One of YouWouldNotBelieveYourEyes Alts",
                "The Destroyer base sprite - One of YWNBYE's Alts",
                "New Sub and Buccaneer Sprites - kaasblokje",
            ],
            [
                "New Dartling Sprites - The Classical (Sheeper)",
                "Goodie Shop Hats - Extra",
                "New Bloon Sprites - Toyatak",
                "Nightmare Medals - The Classical(Shepper)",
                "Frozen Lake - AIDc",
                "Lava Stream - Teal Knight",
                "Peaceful Bridge - Granddoggo",
                "Ravine River - Kaasblokje",
                "Rubber Rug - Timobloonstime + Weirdoverse",
                "Sky Battles - Fallen Alt",
                "Lawless Badlands - OverThePower but like the original account",
                "Lost Ponds - BTD666(but also known as YWNBYE)",
                "Lit Plasma Art - YWNBYE",
                "Math - The Classical (Sheeper)  <>  Balance - Nanerbag ",
                "New Ace Sprites - You Would Not Believe Your Eyes",
            ],
            [
                "New Emoji DDT sprites - You Would Not Believe Your Eyes",
                "Worm Bloon Sprites - You Would Not Believe Your Eyes",
                "A bunch of other misc sprites probably - YWNBYE"
            ],
            [
                "Thanks to Ninja Kiwi for the permission to make this game",
                "Special Thanks to everyone who played and got the word out",
                "",
                "Special Thanks - XModLoader, Weaz, FrostedGH, TripledYou,",
                "Wiki Tay, Garrok, Zakoji(H), and double-pmcl-dot-net"
            ]
    ],
    //halign !
    alignment:[
        fa_center,
        fa_center,
        fa_left,
        fa_left,
        fa_left,
        fa_left,
        fa_center
    ],
    start_x:[
        373,
        373,
        4,
        4,
        4,
        4,
        373
    ],
    start_y:[
        250,
        250,
        250,
        250,
        250,
        250,
        250
    ],
    number:[
        
    ]
}

text_shown = 0

for (var i = 0; i <= max_page; i++) {
    var _texts_num = array_length(info.texts[i])
	var _texts_height = _texts_num*32
    info.start_y[i] = info.start_y[i] - _texts_height/2
    info.number[i] = _texts_num
}

back_alpha = 0
texts_alpha = array_create(info.number[page],0)

wait = 10

state = "appear"

//139, 38
x = 139
y = 38+650
anim = [animcurve_get(an_credits_appear),animcurve_get(an_credits_disappear)]
chan = [animcurve_get_channel(anim[0],"curve1"),animcurve_get_channel(anim[1],"curve1")]
anim_pos = 0

exit_button = {
    pos:[746-64,8],
    mouse_on:false,
    step:function (_xp,_yp){
        var _x = pos[0]
        var _y = pos[1]
        if point_in_rectangle(mouse_x,mouse_y,_x+_xp,_y+_yp,_x+_xp+64,_y+_yp+64){
            mouse_on = true
            if mouse_check_button_pressed(mb_left){
                return true
            }
        }
        else {
        	mouse_on = false
        }
        return false
    },
    draw:function (_x,_y){
        shader_set(sh_replace)
        shader_set_uniform_f( global.shaders.replace[0],HOVER_OUTLINE_R,HOVER_OUTLINE_G,HOVER_OUTLINE_B )
        shader_set_uniform_f( global.shaders.replace[1],mouse_on )
        draw_sprite(spr_exit_button,0,_x+pos[0],_y+pos[1])
        shader_reset()
    }
}