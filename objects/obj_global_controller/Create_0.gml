randomize()

global.gui_layer = 0
global.gui_wait = 0
global.start_transition_ended = false

global.show_debug = false

global.translation = {}


if os_type == os_android{
    
	if file_exists("data/translation.json")
        global.translation = load_json("data/translation.json")
}
else {
	if file_exists("data//translation.json")
        global.translation = load_json("data//translation.json")
}


global.shaders = {
    replace:[shader_get_uniform(sh_replace,"newcolor"),shader_get_uniform(sh_replace,"active")],
    replace_mission:[shader_get_uniform(sh_replace_mission,"newcolor"),shader_get_uniform(sh_replace_mission,"whitereplace"),shader_get_uniform(sh_replace_mission,"active")]
}



//
global.part_system = part_system_create()
part_system_depth(global.part_system,-5)

global.particles = {
    
}

var _part = part_type_create()
part_type_sprite(_part,spr_pop,false,false,false)
part_type_life(_part,4,4)
part_type_direction(_part,0,0,0,0)
part_type_speed(_part,0,0,0,0)

global.particles.pop = _part
//

global.bloon_souls = 10
global.bloon_points = 5
global.trophies = 0
global.monkey_money = 2500
global.goodie_points_used = 0
global.goodie_points = floor(global.trophies/10) - global.goodie_points_used

global.rank = 45
global.xp = 0

global.max_xp = 0
global.max_xp = round(global.max_xp * 1.05) + 60 * (global.rank+2)

for (var i = 0; i < global.rank; i++) {
	global.max_xp = round(global.max_xp * 1.05) + 60 * (i+2)
}

global.agents = {
    squirrel:0,
    banana_mobile:0,
    bloonbury_bush:0,
    monkey_nurse:0,
    sprinkler:0
}

global.goodies = {
    monkey_cap:{ unlocked:false, active:false },
    bloon_mean:{ unlocked:false, active:false },
    monkey_beanie:{ unlocked:false, active:false },
    bloon_emoji:{ unlocked:false, active:false },
    monkey_party_hat:{ unlocked:false, active:false },
    bloon_scary:{ unlocked:false, active:false },
    monkey_super_cape:{ unlocked:false, active:false },
    bloon_silly:{ unlocked:false, active:false },
    monkey_ram:{ unlocked:false, active:false },
    bloon_computery:{ unlocked:false, active:false },
    love:{ unlocked:false, active:false },
    bad_blimp:{ unlocked:false, active:false },
    lit_moab:{ unlocked:false, active:false },
    super_storm:{ unlocked:false, active:false },
    ulo:{ unlocked:false, active:false }
}



global.milestone_rewards = {
    normal:{
        wave:[40,60,75,90,140,190],
        monkeymoney:[90,120,150,180,180,180],
        bloonpoints:[3,4,5,6,6,6],
    },
    impoppable:{
        wave:[35,50,65,75,125,175],
        monkeymoney:[120,150,180,210,210,210],
        bloonpoints:[4,5,6,7,7,7],
    },
    nightmare:{
        wave:[30,40,50,60,110,160],
        monkeymoney:[150,180,210,240,240,240],
        bloonpoints:[5,6,7,8,8,8],
    },
    timetrial:{
        // 12 min , 10 min , 8 min, 6.5 min, 4 min
        time:[720,600,480,390,240],
        monkeymoney:[100,150,200,400,600],
        bloonpoints:[2,3,4,6,8],
    },
    score:{
        value:[50_000,250_000,500_000,1_000_000,2_000_000],
        monkeymoney:[100,200,300,400,500],
        bloonpoints:[2,4,6,8,10]
    }
}

global.moon_temple = {
    souls_price:[30,40,50],
    beaten:[false,false,false]
}


scr_upgrades_initialize()
scr_tower_panels_initialize()

scr_tracks_initialize()
scr_missions_initialize()
scr_bounties_initialize()
scr_challenges_initialize()
scr_achievements_initialize()

enum HOTKEY {
    SELL,
    START_WAVE,
    LEFT_UPGRADE,
    MIDDLE_UPGRADE,
    RIGHT_UPGRADE,
    TOWER_DARTM,
    TOWER_TACKS,
    TOWER_BOMRM,
    TOWER_SNIPM,
    TOWER_NINJM,
    TOWER_BOMBS,
    TOWER_SUBMM,
    TOWER_CHARG,
    TOWER_GLUEG,
    TOWER_ICEMO,
    TOWER_BUCCM,
    TOWER_ENGIM,
    TOWER_ACEMO,
    TOWER_BLONC,
    TOWER_ALCHE,
    TOWER_APPRE,
    TOWER_VILLA,
    TOWER_BANAN,
    TOWER_MORTA,
    TOWER_DARTG,
    TOWER_SPIKE,
    TOWER_HELIP,
    TOWER_PLASM,
    TOWER_SUPER,
    ROAD_SPIKES,
    GRIL_PINEAP
}

global.settings = {
    instant_upgrade_unlocking: false,
    instant_start_transition: false,
    show_fps: false,
    fullscreen: false,
    high_scaling: false,
    hotkeys:[
        vk_backspace,
        vk_space,
        ord("Z"),
        ord("X"),
        ord("C"),
        ord("1"),
        ord("Q"),
        ord("2"),
        ord("W"),
        ord("3"),
        ord("E"),
        ord("4"),
        ord("R"),
        ord("5"),
        ord("T"),
        ord("6"),
        ord("Y"),
        ord("7"),
        ord("U"),
        ord("8"),
        ord("I"),
        ord("9"),
        ord("O"),
        ord("0"),
        ord("P"),
        ord("F"),
        ord("V"),
        ord("G"),
        ord("B"),
        ord("H"),
        ord("N")
    ],
    default_hotkeys:[
        vk_backspace,
        vk_space,
        ord("Z"),
        ord("X"),
        ord("C"),
        ord("1"),
        ord("Q"),
        ord("2"),
        ord("W"),
        ord("3"),
        ord("E"),
        ord("4"),
        ord("R"),
        ord("5"),
        ord("T"),
        ord("6"),
        ord("Y"),
        ord("7"),
        ord("U"),
        ord("8"),
        ord("I"),
        ord("9"),
        ord("O"),
        ord("0"),
        ord("P"),
        ord("F"),
        ord("V"),
        ord("G"),
        ord("B"),
        ord("H"),
        ord("N")
    ]
}


enum GAME_MODES {
    NORMAL,
    IMPOPPABLE,
    NIGHTMARE,
    TIME_TRIAL,
    SANDBOX,
    SPECIAL
}

global.game_modes_info = {
    starting_lives:[],
    starting_cash:[],
    points_multiplier:[],
    bloon_power:[],
    bloon_speed:[],
    cash_flow:[],
    unlock_rank:[],
    add:function (_lives,_cash,_points_multiplier,_bloon_power,_bloon_speed,_cash_flow,_unlock_rank){
        array_push(starting_lives,_lives)
        array_push(starting_cash,_cash)
        array_push(points_multiplier,_points_multiplier)
        array_push(bloon_power,_bloon_power)
        array_push(bloon_speed,_bloon_speed)
        array_push(cash_flow,_cash_flow)
        array_push(unlock_rank,_unlock_rank)
        
    }
}

global.game_modes_info.add(200,750,1,1,1.16,1,0) //normal
global.game_modes_info.add(200,900,1.5,1.1,1.33,0.75,30) //impoppable
global.game_modes_info.add(200,1200,2,1.2,1.33,0.7,40) //nightmare
global.game_modes_info.add(200,900,1,1,1,1,20) //time trial