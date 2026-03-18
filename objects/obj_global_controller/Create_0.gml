global.gui_layer = 0
global.gui_wait = 0
//
global.part_system = part_system_create()
part_system_depth(global.part_system,-5)

global.particles = {
    
}

var _part = part_type_create()
part_type_sprite(_part,spr_pop,false,false,false)
part_type_life(_part,2,2)
part_type_direction(_part,0,0,0,0)
part_type_speed(_part,0,0,0,0)

global.particles.pop = _part
//

//
alarm[0] = SPLASH_TIME
//

#macro COLOR_TROPHIES #ffff00
#macro COLOR_BLOONSOULS #c40000
#macro COLOR_MONKEYMONEY #00c000
#macro COLOR_BLOONPOINTS #009fff
#macro COLOR_RANK c_aqua 
#macro COLOR_NOT_ENOUGH #c40000

#macro HOVER_OUTLINE_R 1
#macro HOVER_OUTLINE_G 1
#macro HOVER_OUTLINE_B 1
#macro COMPLETED_OUTLINE_R 0
#macro COMPLETED_OUTLINE_G 0.54
#macro COMPLETED_OUTLINE_B 0
#macro DISABLED_OUTLINE_R 0.54
#macro DISABLED_OUTLINE_G 0
#macro DISABLED_OUTLINE_B 0
#macro BOUNTY_CAGE_OUTLINE_R 0.38431
#macro BOUNTY_CAGE_OUTLINE_G 0.18431
#macro BOUNTY_CAGE_OUTLINE_B 0 
#macro HOVER_GOODIE_OUTLINE_ENABLED_R 0 
#macro HOVER_GOODIE_OUTLINE_ENABLED_G 1
#macro HOVER_GOODIE_OUTLINE_ENABLED_B 0
#macro HOVER_GOODIE_OUTLINE_DISABLED_R 1
#macro HOVER_GOODIE_OUTLINE_DISABLED_G 0
#macro HOVER_GOODIE_OUTLINE_DISABLED_B 0

global.bloon_souls = 10
global.bloon_points = 5
global.trophies = 20
global.monkey_money = 2500
global.goodie_points_used = 0
global.goodie_points = floor(global.trophies/10) - global.goodie_points_used

global.rank = 25
global.xp = 0
global.max_xp = 0
global.max_xp = round(global.max_xp * 1.05) + 60 * (global.rank+2)

global.agents = {
    squirrel:0,
    banana_mobile:0,
    bloonbury_bush:0,
    monkey_nurse:0,
    sprinkler:0
}

global.challenges = {
    deflation:{ complete:true },
    anti_anti_shield_swarm:{ complete:false },
    starve_out:{ complete:false },
    necronomicon:{ complete:false },
    monkeys_vs_goliath:{ complete:false },
    red_cross:{ complete:false },
    
    one_tower_race:{ complete:false, time:-1 },
    low_level_race:{ complete:false, time:-1 },
    maximum_power:{ complete:false, time:-1 },
    swarm_support:{ complete:false, time:-1 },
    supra_monkey:{ complete:false, time:-1 },
    lightning_fast:{ complete:false, time:-1 },
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

global.missions = {
    color_splash:{ completed:true },
    non_stop_assault:{ completed:false },
    flood:{ completed:false },
    blimp_brigade:{ completed:false },
    necropolis:{ completed:false },
    solar_storm:{ completed:false },
    prison_break_1:{ completed:false },
    prison_break_2:{ completed:false },
    prison_break_3:{ completed:false },
    prison_break_4:{ completed:false },
    ultra_break_v1:{ completed:false },
    ultra_break_v4:{ completed:false }
}

global.shaders = {
    replace:[shader_get_uniform(sh_replace,"newcolor"),shader_get_uniform(sh_replace,"active")],
    replace_mission:[shader_get_uniform(sh_replace_mission,"newcolor"),shader_get_uniform(sh_replace_mission,"whitereplace"),shader_get_uniform(sh_replace_mission,"active")]
}

//
enum TRACK_DIFFICULTY {
    FLOATY,
    INFLATE,
    HARD_TORN,
    MAD_POP
}

enum TRACK_TYPE {
    NORMAL,
    SPECIAL
}

Track = function (_name,_difficulty,_icon = -1,_type = TRACK_TYPE.SPECIAL) constructor {
    name = _name
    difficulty = _difficulty
    icon = _icon
    type = _type
    
    if type == TRACK_TYPE.NORMAL{
        best_wave = {
            normal: 0,
            impoppable: 0,
            nightmare: 0
        }
        best_time = 60 * 60 * 24
        best_score = {
            normal: 0,
            impoppable: 0,
            nightmare: 0
        }
        winning_wave = {
            normal: 0,
            impoppable: 0,
            nightmare: 0
        }
    }
    
}

global.tracks = {}

global.tracks.monkey_meadows = new Track("Monkey Meadows",TRACK_DIFFICULTY.FLOATY)
global.tracks.bloon_oasis = new Track("Bloon Oasis",TRACK_DIFFICULTY.FLOATY)
global.tracks.shade_woods = new Track("Shade Woods",TRACK_DIFFICULTY.FLOATY)
global.tracks.bloonlight_throwback = new Track("Bloonlight Throwback",TRACK_DIFFICULTY.FLOATY)
global.tracks.bloon_circles_x = new Track("Bloon Circles X",TRACK_DIFFICULTY.FLOATY)
global.tracks.rubber_rug = new Track("Rubber Rug",TRACK_DIFFICULTY.FLOATY)
global.tracks.monkey_fort = new Track("Monkey Fort",TRACK_DIFFICULTY.INFLATE)
global.tracks.swamp_spirals = new Track("Swamp Spirals",TRACK_DIFFICULTY.INFLATE)
global.tracks.portal_lab = new Track("Portal Lab",TRACK_DIFFICULTY.INFLATE)
global.tracks.autumn_acres = new Track("Autumn Acres",TRACK_DIFFICULTY.INFLATE)
global.tracks.minecarts = new Track("Minecarts",TRACK_DIFFICULTY.INFLATE)
global.tracks.omega_river = new Track("Omega River",TRACK_DIFFICULTY.INFLATE)
global.tracks.graveyard = new Track("Graveyard",TRACK_DIFFICULTY.INFLATE)
global.tracks.frozen_lake = new Track("Frozen Lake",TRACK_DIFFICULTY.INFLATE)
global.tracks.sky_battles = new Track("Sky Battles",TRACK_DIFFICULTY.INFLATE)
global.tracks.monkey_town_docks = new Track("Monkey Town Docks",TRACK_DIFFICULTY.HARD_TORN)
global.tracks.conveyor_belt = new Track("Conveyor Belt",TRACK_DIFFICULTY.HARD_TORN)
global.tracks.circuit = new Track("Circuit",TRACK_DIFFICULTY.HARD_TORN)
global.tracks.crimson_creek = new Track("Crimson Creek",TRACK_DIFFICULTY.HARD_TORN)
global.tracks.space_portals = new Track("Space Portals",TRACK_DIFFICULTY.HARD_TORN)
global.tracks.village_defense = new Track("Village Defense",TRACK_DIFFICULTY.HARD_TORN)
global.tracks.lava_stream = new Track("Lava Stream",TRACK_DIFFICULTY.HARD_TORN)
global.tracks.ravine_river = new Track("Ravine River",TRACK_DIFFICULTY.HARD_TORN)
global.tracks.sun_stone = new Track("Sun Stone",TRACK_DIFFICULTY.MAD_POP)
global.tracks.xtreme_park = new Track("Xtreme Park",TRACK_DIFFICULTY.MAD_POP)
global.tracks.bloonside_river = new Track("Bloonside River",TRACK_DIFFICULTY.MAD_POP)
global.tracks.grand_canyon = new Track("Grand Canyon",TRACK_DIFFICULTY.MAD_POP)
global.tracks.peaceful_bridge = new Track("Peaceful Bridge",TRACK_DIFFICULTY.MAD_POP)
global.tracks.the_depths = new Track("The Depths",TRACK_DIFFICULTY.MAD_POP)
global.tracks.lawless_badlands = new Track("Lawless Badlands",TRACK_DIFFICULTY.MAD_POP)
global.tracks.lost_pools = new Track("Lost Pools",TRACK_DIFFICULTY.MAD_POP)

global.tracks.bloon_bounty_center = new Track("Bloon Bounty Center",TRACK_DIFFICULTY.MAD_POP,TRACK_TYPE.SPECIAL)

//

enum BOUNTY_RANK {
    LOW,
    MEDIUM,
    HIGH,
    MODERATELY_HIGH,
    VERY_HIGH,
    IMPOPPABLE,
    MODERATELY_ANNOYING,
    ANNOYING,
    VERY_ANNOYING,
    IMPOPPABLY_ANNOYING,
    ALMIGHTY,
    ANNOINGLY_ALMIGHTY
}

function Bounty(_max_rank,_location) constructor {
    rank = 0
    max_rank = _max_rank
    location = _location
}

global.bounty = {
    dialogue_finished:false,
    rewards:{
        monkey_money:[],
        bloon_points:[],
        xp:[],
        add:function (_type,_cash,_bloonp,_xp){
            monkey_money[_type] = _cash
            bloon_points[_type] = _bloonp
            xp[_type] = _xp
        }
    },
    list:{
        big_bully: new Bounty(5,"monkey_meadows"),
        mighty_moab: new Bounty(4,"monkey_fort"),
        horror_bloon: new Bounty(4,"the_depths"),
        ufo_bloon: new Bounty(4,"bloon_oasis"),
        super_bloon: new Bounty(4,"swamp_spirals"),
        mother: new Bounty(4,"minecarts"),
        annoying_bloon: new Bounty(5,"shade_woods"),
        clown_bloon: new Bounty(5,"omega_river"),
        blooming_bloon: new Bounty(4,"autumn_acres"),
        track_crawler: new Bounty(4,"bloon_circles_x"),
        tdom: new Bounty(4,"graveyard"),
        flying_bloon: new Bounty(4,"sky_battles"),
        bloon_knight: new Bounty(4,"bloonlight_throwback"),
        worm_bloon: new Bounty(4,"rubber_rug")
    }
}

global.bounty.list.big_bully.rank = 3
global.bounty.list.mighty_moab.rank = 4
//global.bounty.list.horror_bloon.rank = 

global.bounty.rewards.add(BOUNTY_RANK.LOW,200,2,100000)
global.bounty.rewards.add(BOUNTY_RANK.MEDIUM,300,3,150000)
global.bounty.rewards.add(BOUNTY_RANK.HIGH,500,5,250000)
global.bounty.rewards.add(BOUNTY_RANK.MODERATELY_HIGH,400,4,200000)
global.bounty.rewards.add(BOUNTY_RANK.VERY_HIGH,600,6,300000)
global.bounty.rewards.add(BOUNTY_RANK.IMPOPPABLE,700,7,350000)
global.bounty.rewards.add(BOUNTY_RANK.MODERATELY_ANNOYING,400,4,200000)
global.bounty.rewards.add(BOUNTY_RANK.ANNOYING,500,5,250000)
global.bounty.rewards.add(BOUNTY_RANK.VERY_ANNOYING,600,6,300000)
global.bounty.rewards.add(BOUNTY_RANK.IMPOPPABLY_ANNOYING,700,7,350000)
global.bounty.rewards.add(BOUNTY_RANK.ALMIGHTY,1000,10,500000)
global.bounty.rewards.add(BOUNTY_RANK.ANNOINGLY_ALMIGHTY,1100,11,550000)

scr_upgrades_initialize()

scr_towers_initialize()

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
    ]
}