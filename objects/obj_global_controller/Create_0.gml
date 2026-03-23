global.gui_layer = 0
global.gui_wait = 0
global.start_transition_ened = false
//
global.part_system = part_system_create()
part_system_depth(global.part_system,-5)

global.particles = {
    
}

global.show_debug = false


var _part = part_type_create()
part_type_sprite(_part,spr_pop,false,false,false)
part_type_life(_part,4,4)
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
#macro GRAYED_OUT_OUTLINE_R 0.41176
#macro GRAYED_OUT_OUTLINE_G 0.41176
#macro GRAYED_OUT_OUTLINE_B 0.41176

global.bloon_souls = 10
global.bloon_points = 5
global.trophies = 0
global.monkey_money = 2500
global.goodie_points_used = 0
global.goodie_points = floor(global.trophies/10) - global.goodie_points_used

global.rank = 25
global.xp = 0
global.max_xp = 0
global.max_xp = round(global.max_xp * 1.05) + 60 * (global.rank+2)

global.translation = {}

if file_exists("data//translation.json")
    global.translation = load_json("data//translation.json")

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

Mission = function (_name,_desc,_color,_icon) constructor {
    completed = false
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
        // 12 min , 10 min , 8 min, 6,5 min, 4 min
        time:[720,600,480,390,240],
        monkeymoney:[100,150,200,400,600],
        bloonpoints:[2,3,4,6,8],
    }
    //only show 8min, 6,5 min and 4 min in track selected menu
}

Track = function (_name,_difficulty,_icon = -1,_type = TRACK_TYPE.NORMAL) constructor {
    name = _name
    difficulty = _difficulty
    icon = _icon
    type = _type
    my_bounty = -1
    bounty_medal_icon = -1
    
    if type == TRACK_TYPE.NORMAL{
        best_time = 86_400
        
        milestone = {
            normal: 0,
            impoppable: 0,
            nightmare: 0,
            timetrial: 0,
        }
        lastmedal = {
            milestone_normal: 0,
            milestone_impoppable: 0,
            milestone_nightmare: 0,
            milestone_time: 0
        }
        best_wave = {
            normal: 0,
            impoppable: 0,
            nightmare: 0
        }
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
    
    static setBounty = function (_bounty_id,_medal_icon){
        lastmedal.bounty = 0
        bounty_medal_icon = _medal_icon
        my_bounty = _bounty_id
    }
    
}

global.tracks = {}

global.tracks.monkey_meadows = new Track("Monkey Meadows",TRACK_DIFFICULTY.FLOATY,spr_background_monkey_meadows_preview)
global.tracks.bloon_oasis = new Track("Bloon Oasis",TRACK_DIFFICULTY.FLOATY,spr_background_bloon_oasis_preview)
global.tracks.shade_woods = new Track("Shade Woods",TRACK_DIFFICULTY.FLOATY,spr_background_shade_woods_preview)
global.tracks.bloonlight_throwback = new Track("Bloonlight Throwback",TRACK_DIFFICULTY.FLOATY,spr_background_bloon_light_throwback_preview)
global.tracks.bloon_circles_x = new Track("Bloon Circles X",TRACK_DIFFICULTY.FLOATY,spr_background_bloon_circles_preview)
global.tracks.rubber_rug = new Track("Rubber Rug",TRACK_DIFFICULTY.FLOATY,spr_background_rubber_rug_preview)
global.tracks.monkey_fort = new Track("Monkey Fort",TRACK_DIFFICULTY.INFLATE,spr_background_monkey_fort_preview)
global.tracks.swamp_spirals = new Track("Swamp Spirals",TRACK_DIFFICULTY.INFLATE,spr_background_swamp_spirals_preview)
global.tracks.portal_lab = new Track("Portal Lab",TRACK_DIFFICULTY.INFLATE,spr_background_portal_lab_preview)
global.tracks.autumn_acres = new Track("Autumn Acres",TRACK_DIFFICULTY.INFLATE,spr_background_autumn_acres_preview)
global.tracks.minecarts = new Track("Minecarts",TRACK_DIFFICULTY.INFLATE,spr_background_minecarts_preview)
global.tracks.omega_river = new Track("Omega River",TRACK_DIFFICULTY.INFLATE,spr_background_omega_river_preview)
global.tracks.graveyard = new Track("Graveyard",TRACK_DIFFICULTY.INFLATE,spr_background_graveyard_preview)
global.tracks.frozen_lake = new Track("Frozen Lake",TRACK_DIFFICULTY.INFLATE,spr_background_frozen_lake_preview)
global.tracks.sky_battles = new Track("Sky Battles",TRACK_DIFFICULTY.INFLATE,spr_background_sky_battles_preview)
global.tracks.monkey_town_docks = new Track("Monkey Town Docks",TRACK_DIFFICULTY.HARD_TORN,spr_background_monkey_town_docks_preview)
global.tracks.conveyor_belt = new Track("Conveyor Belt",TRACK_DIFFICULTY.HARD_TORN,spr_background_conveyor_belts_preview)
global.tracks.circuit = new Track("Circuit",TRACK_DIFFICULTY.HARD_TORN,spr_background_circuit_preview)
global.tracks.crimson_creek = new Track("Crimson Creek",TRACK_DIFFICULTY.HARD_TORN,spr_background_crimson_creek_preview)
global.tracks.space_portals = new Track("Space Portals",TRACK_DIFFICULTY.HARD_TORN,spr_background_space_portals_preview)
global.tracks.village_defense = new Track("Village Defense",TRACK_DIFFICULTY.HARD_TORN,spr_background_village_defense_preview)
global.tracks.lava_stream = new Track("Lava Stream",TRACK_DIFFICULTY.HARD_TORN,spr_background_lava_stream_preview)
global.tracks.ravine_river = new Track("Ravine River",TRACK_DIFFICULTY.HARD_TORN,spr_background_ravine_river_preview)
global.tracks.sun_stone = new Track("Sun Stone",TRACK_DIFFICULTY.MAD_POP,spr_background_sun_stone_preview)
global.tracks.xtreme_park = new Track("Xtreme Park",TRACK_DIFFICULTY.MAD_POP,spr_background_xtreme_park_preview)
global.tracks.bloonside_river = new Track("Bloonside River",TRACK_DIFFICULTY.MAD_POP,spr_background_bloonside_river_preview)
global.tracks.grand_canyon = new Track("Grand Canyon",TRACK_DIFFICULTY.MAD_POP,spr_background_grandcanyon_preview)
global.tracks.peaceful_bridge = new Track("Peaceful Bridge",TRACK_DIFFICULTY.MAD_POP,spr_background_peaceful_bridge_preview)
global.tracks.the_depths = new Track("The Depths",TRACK_DIFFICULTY.MAD_POP,spr_background_the_depths_preview)
global.tracks.lawless_badlands = new Track("Lawless Badlands",TRACK_DIFFICULTY.MAD_POP,spr_background_lawless_badlands_preview)
global.tracks.lost_pools = new Track("Lost Pools",TRACK_DIFFICULTY.MAD_POP,spr_background_lost_pools_preview)

global.tracks.bloon_bounty_center = new Track("Bloon Bounty Center",TRACK_DIFFICULTY.MAD_POP,spr_background_break_out_preview,TRACK_TYPE.SPECIAL)
global.tracks.lunar_temple = new Track("Lunar Temple",TRACK_DIFFICULTY.MAD_POP,spr_background_lunar_temple_preview,TRACK_TYPE.SPECIAL)

global.tracks_order = ["monkey_meadows","bloon_oasis","shade_woods","bloonlight_throwback","bloon_circles_x","rubber_rug","monkey_fort","swamp_spirals","portal_lab","autumn_acres","minecarts","omega_river","graveyard","frozen_lake","sky_battles","monkey_town_docks","conveyor_belt","circuit","crimson_creek","space_portals","village_defense","lava_stream","ravine_river","sun_stone","xtreme_park","bloonside_river","grand_canyon","peaceful_bridge","the_depths","lawless_badlands","lost_pools"]
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

function Bounty(_id,_max_rank,_location,_medal_icon) constructor {
    rank = 0
    max_rank = _max_rank
    my_id = _id
    location = _location
    
    global.tracks[$ _location].setBounty(_id,_medal_icon)
    
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
        big_bully: new Bounty("big_bully",5,"monkey_meadows",spr_medals_big_bully),
        mighty_moab: new Bounty("mighty_moab",4,"monkey_fort",spr_medals_mighty_moab),
        horror_bloon: new Bounty("horror_bloon",4,"the_depths",spr_medals_horror_bloon),
        ufo_bloon: new Bounty("ufo_bloon",4,"bloon_oasis",spr_medals_ufo_bloon),
        super_bloon: new Bounty("super_bloon",4,"swamp_spirals",spr_medals_super_bloon),
        mother: new Bounty("mother",4,"minecarts",spr_medals_mother),
        annoying_bloon: new Bounty("annoying_bloon",5,"shade_woods",spr_medals_annoying_bloon),
        clown_bloon: new Bounty("clown_bloon",5,"omega_river",spr_medals_clown_bloon),
        blooming_bloon: new Bounty("blooming_bloon",4,"autumn_acres",spr_medals_blooming_bloon),
        track_crawler: new Bounty("track_crawler",4,"bloon_circles_x",spr_medals_track_crawler),
        tdom: new Bounty("tdom",4,"graveyard",spr_medals_tdom),
        flying_bloon: new Bounty("flying_bloon",4,"sky_battles",spr_medals_flying_bloon),
        bloon_knight: new Bounty("bloon_knight",4,"bloonlight_throwback",spr_medals_bloon_knight),
        worm_bloon: new Bounty("worm_bloon",4,"rubber_rug",spr_medals_worm_bloon)
    }
}

global.moon_temple = {
    souls_price:[30,40,50],
    beaten:[false,false,false]
}

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

enum ACHIEVEMENT_STATE {
    LOCKED,
    UNLOCKED_NOTCHECKED,
    CHECKED
}

enum ACHIEVEMENT_MAIN_TYPE {
    MILESTONE,
    TOWER,
    CHALLENGE
}

enum ACHIEVEMENT_EXACT_TYPE {
    MILESTONE_NORMAL_90_WAVE,
    MILESTONE_NORMAL_190_WAVE,
    MILESTONE_IMPOPPABLE_75_WAVE,
    MILESTONE_NIGHTMARE_60_WAVE,
    MILESTONE_2MIL_SCORE,
    MILESTONE_UNDER_240_SECONDS,
    TOWER_ALL_FIFTH_TIER_UPGRADES,
    TOWER_SPECIAL_PATH,
    CHALLENGE_BOUNTY,
    CHALLENGE_MISSIONS,
    CHALLENGE_MOON_TEMPLE
}

enum REWARD_TYPE {
    TROPHY,
    MONKEY_MONEY,
    BLOON_POINT
}

function Achievement(_text,_type,_exact_type,_icon = spr_achievement_unlocked_icon) constructor {
    state = ACHIEVEMENT_STATE.UNLOCKED_NOTCHECKED
    
    if chance(50){
        state = ACHIEVEMENT_STATE.LOCKED
    }
    
    type = _type
    text = _text
    exact_type = _exact_type
    reward = { trophy:1 }
    icon = _icon
    data = {}
    
    static setReward = function(_reward_type,_number){
        switch (_reward_type) {
        	case REWARD_TYPE.MONKEY_MONEY: reward.monkey_money = _number break;
            case REWARD_TYPE.TROPHY: reward.trophy = _number break;
            case REWARD_TYPE.BLOON_POINT: reward.bloon_point = _number break;
        }
        
        return self
    }
    
    static setData = function (_mydata){
        data = _mydata
        
        return self
    }
}

global.achievements = {}
global.achievements_order = {
    milestone:[],
    tower:[],
    challenge:[]
}

var _tracks = variable_struct_get_names(global.tracks)
var _tracks_num = array_length(_tracks)

for (var i = 0; i < _tracks_num; i++) {
    var _track_id = _tracks[i]
	var _mytrack = global.tracks[$ _track_id]
    
    if _mytrack.type != TRACK_TYPE.NORMAL
        continue
    
    var _track_name = _mytrack.name
    
    var _ach_id = "milestone_normal_90_"+_track_id
    global.achievements[$ _ach_id] = new Achievement("Beat 90 waves on "+_track_name+" on Normal difficulty",ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_NORMAL_90_WAVE)
        .setData( { map:_track_id } )
    array_push(global.achievements_order.milestone,_ach_id)
    _ach_id = "milestone_normal_190_"+_track_id
    global.achievements[$ _ach_id] = new Achievement("Beat 190 waves on "+_track_name+" on Normal difficulty",ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_NORMAL_190_WAVE)
        .setData( { map:_track_id } )
    array_push(global.achievements_order.milestone,_ach_id)
    _ach_id = "milestone_impoppable_75_"+_track_id
    global.achievements[$ _ach_id] = new Achievement("Beat 75 waves on "+_track_name+" on Impoppable difficulty",ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_IMPOPPABLE_75_WAVE)
        .setData( { map:_track_id } )
    array_push(global.achievements_order.milestone,_ach_id)
    _ach_id = "milestone_nightmare_60_"+_track_id
    global.achievements[$ _ach_id] = new Achievement("Beat 60 waves on "+_track_name+" on Nightmare difficulty",ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_NIGHTMARE_60_WAVE)
        .setData( { map:_track_id } )
    array_push(global.achievements_order.milestone,_ach_id)
    _ach_id = "milestone_score_2mil_"+_track_id
    global.achievements[$ _ach_id] = new Achievement("Get score 2 Million on "+_track_name,ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_2MIL_SCORE)
        .setData( { map:_track_id } )
    array_push(global.achievements_order.milestone,_ach_id)
    _ach_id = "milestone_time_under_240_"+_track_id
    global.achievements[$ _ach_id] = new Achievement("Beat time trial on "+_track_name+" under 240 seconds",ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_UNDER_240_SECONDS)
        .setData( { map:_track_id } )
    array_push(global.achievements_order.milestone,_ach_id)
}

var _monkeys = variable_struct_get_names(global.towers)
var _monkeys_num = array_length(_monkeys)

for (var i = 0; i < _monkeys_num; i++) {
	var _monkey_id = _monkeys[i]
    var _monkey_name = global.towers[$ _monkey_id].name
    
    var _ach_id = "tower_unlock_fifth_tiers_"+_monkey_id
    global.achievements[$ _ach_id] = new Achievement("Unlock all 5 th tiers for "+_monkey_name,ACHIEVEMENT_MAIN_TYPE.TOWER,ACHIEVEMENT_EXACT_TYPE.TOWER_ALL_FIFTH_TIER_UPGRADES)
        .setData( { tower:_monkey_id } )
    array_push(global.achievements_order.tower,_ach_id)
    var _ach_id = "tower_unlock_special_path_"+_monkey_id
    global.achievements[$ _ach_id] = new Achievement("Unlock Secret path for "+_monkey_name,ACHIEVEMENT_MAIN_TYPE.TOWER,ACHIEVEMENT_EXACT_TYPE.TOWER_SPECIAL_PATH)
        .setData( { tower:_monkey_id } )
    array_push(global.achievements_order.tower,_ach_id)
}

var _missions = variable_struct_get_names(global.missions)
var _missions_num = array_length(_missions)

for (var i = 0; i < _missions_num; i++) {
    var _mission_id = _missions[i]
    var _mission_name = global.translation[$ "mission_"+_mission_id+"_name"]
    
    var _ach_id = "challenge_beat_mission_"+_mission_id
    global.achievements[$ _ach_id] = new Achievement("Beat mission "+_mission_name,ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_MISSIONS)
        .setData( { mission:_mission_id } )
    array_push(global.achievements_order.challenge,_ach_id)
}

var _bounties = variable_struct_get_names(global.bounty.list)
var _bounties_num = array_length(_bounties)

for (var i = 0; i < _bounties_num; i++) {
	var _bounty_id = _bounties[i]
    var _bounty_name = global.translation[$ "bounty_"+_bounty_id+"_name_0"]
    
    var _ach_id = "challenge_beat_bounty_"+_bounty_id
    global.achievements[$ _ach_id] = new Achievement("Beat 4th tier of "+_bounty_name,ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_BOUNTY)
    array_push(global.achievements_order.challenge,_ach_id)
}


var _ach_id = $"challenge_moon_temple_0"
global.achievements[$ _ach_id] = new Achievement("Beat moon temple I",ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_MOON_TEMPLE)
array_push(global.achievements_order.challenge,_ach_id)
var _ach_id = $"challenge_moon_temple_1"
global.achievements[$ _ach_id] = new Achievement("Beat moon temple II",ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_MOON_TEMPLE)
array_push(global.achievements_order.challenge,_ach_id)
var _ach_id = $"challenge_moon_temple_2"
global.achievements[$ _ach_id] = new Achievement("Beat moon temple III",ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_MOON_TEMPLE)
array_push(global.achievements_order.challenge,_ach_id)
