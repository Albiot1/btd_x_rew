//i was using it for geting waves from btd x too...

/*

#macro PUSH array_push 
enum BLOON_TYPE {
    RED = 1,
    ORANGE = 2,
    BLUE = 3,
    CYAN = 4,
    GREEN = 5,
    LIME = 6,
    YELLOW = 7,
    AMBER = 8,
    PINK = 9,
    PURPLE = 10,
    BLACK = 11,
    WHITE = 12,
    ZEBRA = 13,
    RAINBOW = 14,
    PRISMATIC = 15,
    CERAMIC = 16,
    BRICK = 17,
    
    STUFFED_ORANGE = 18,
    STUFFED_CYAN = 19,
    STUFFED_LIME = 20,
    STUFFED_AMBER = 21,
    STUFFED_PURPLE = 22,
    
    NINJA_RED = 23,
    NINJA_BLUE = 24,
    NINJA_GREEN = 25,
    NINJA_YELLOW = 26,
    NINJA_PINK = 27,
    NINJA_RAINBOW = 28,
    
    ROBO_RED = 29,
    ROBO_BLUE = 30,
    ROBO_GREEN = 31,
    ROBO_YELLOW = 32,
    ROBO_PINK = 33,
    ROBO_RAINBOW = 34,
    
    PATROL = 35,
    
    BARRIER_GREEN = 36,
    BARRIER_PINK = 37,
    
    PLANETARIUM = 38,
    PLANETARIUM_2 = 39,
    
    SPECTRUM = 40,
    
    MINI_MOAB = 200,
    MOAB = 201,
    BFB = 202,
    DDT = 203,
    ZOMG = 204,
    HTA = 205,
    LPZ = 206,
    BRC = 207,
    PRIMSATIC_HTA = 208,
    MEGA_BRC = 209,
    ROCKET_BLIMP = 210,
    STORM_LPZ = 211,
    DEADLY_DDT = 212,
    PARTY_BLIMP = 213,
}

enum BLOON_PROPERTIES {
    NONE,
    TATTERED,
    SHIELDED,
    SUPER_SHIELDED,
    STATIC,
    CAMO,
    LEAD,
    REGROW
}

getIconName = function (_bloon,_property){
    var _start = ""
    var _name = ""
    var _link_main_type = "Regular_Bloons"
    var _real_name = ""
    var _name_replacement = ""
    var _filetype = ".png"
    
    switch (_bloon)
    {
        case BLOON_TYPE.RED: _name = "Red Bloon" _link_main_type = "Red" break
        case BLOON_TYPE.ORANGE: _name = "Orange Bloon" _link_main_type = "Splitting_Bloons" break
        case BLOON_TYPE.BLUE: _name = "Blue Bloon" _link_main_type = "Blue" break
        case BLOON_TYPE.CYAN: _name = "Cyan Bloon" _link_main_type = "Splitting_Bloons" break
        case BLOON_TYPE.GREEN: _name = "Green Bloon" _link_main_type = "Green" break
        case BLOON_TYPE.LIME: _name = "Lime Bloon" _link_main_type = "Splitting_Bloons" break
        case BLOON_TYPE.YELLOW: _name = "Yellow Bloon" _link_main_type = "Yellow" break
        case BLOON_TYPE.AMBER: _name = "Amber Bloon" _link_main_type = "Splitting_Bloons"  break
        case BLOON_TYPE.PINK: _name = "Pink Bloon" _link_main_type = "Pink" break
        case BLOON_TYPE.PURPLE: _name = "Purple Bloon" _link_main_type = "Splitting_Bloons"  break
        case BLOON_TYPE.BLACK: _name = "Black Bloon" _link_main_type = "Black" break
        case BLOON_TYPE.WHITE: _name = "White Bloon" _link_main_type = "White" break
        case BLOON_TYPE.ZEBRA: _name = "Zebra Bloon" _link_main_type = "Zebra" break
        case BLOON_TYPE.RAINBOW: _name = "Rainbow Bloon" _link_main_type = "Rainbow" break
        case BLOON_TYPE.PRISMATIC: _name = "Prismatic Bloon" _link_main_type = "Splitting_Bloons"  break
        case BLOON_TYPE.CERAMIC: _name = "Ceramic Bloon" _link_main_type = "Ceramic" break
        case BLOON_TYPE.BRICK: _name = "Brick Bloon" _link_main_type = "Brick" break
        
        case BLOON_TYPE.STUFFED_ORANGE: _name = "Orange Stuffed Bloon" _link_main_type = "Stuffed_Bloons" break;
        case BLOON_TYPE.STUFFED_CYAN: _name = "Cyan Stuffed Bloon" _link_main_type = "Stuffed_Bloons" break;
        case BLOON_TYPE.STUFFED_LIME: _name = "Lime Stuffed Bloon" _link_main_type = "Stuffed_Bloons" break;
        case BLOON_TYPE.STUFFED_AMBER: _name = "Amber Stuffed Bloon" _link_main_type = "Stuffed_Bloons" break;
        case BLOON_TYPE.STUFFED_PURPLE: _name = "Purple Stuffed Bloon" _link_main_type = "Stuffed_Bloons" break;
        
        case BLOON_TYPE.NINJA_RED: _name = "Red Ninja Bloon" _link_main_type = "Ninja_Bloons" break;
        case BLOON_TYPE.NINJA_BLUE: _name = "Blue Ninja Bloon" _link_main_type = "Ninja_Bloons" break;
        case BLOON_TYPE.NINJA_GREEN: _name = "Green Ninja Bloon" _link_main_type = "Ninja_Bloons" break;
        case BLOON_TYPE.NINJA_YELLOW: _name = "Yellow Ninja Bloon" _link_main_type = "Ninja_Bloons" break;
        case BLOON_TYPE.NINJA_PINK: _name = "Pink Ninja Bloon" _link_main_type = "Ninja_Bloons" break;
        case BLOON_TYPE.NINJA_RAINBOW: _name = "Rainbow Ninja Bloon" _link_main_type = "Ninja_Bloons" break;
        
        case BLOON_TYPE.ROBO_RED: _name = "Red Robo Bloon" _link_main_type = "Robo_Bloons" break;
        case BLOON_TYPE.ROBO_BLUE: _name = "Blue Robo Bloon" _link_main_type = "Robo_Bloons" break;
        case BLOON_TYPE.ROBO_GREEN: _name = "Green Robo Bloon" _link_main_type = "Robo_Bloons" break;
        case BLOON_TYPE.ROBO_YELLOW: _name = "Yellow Robo Bloon" _link_main_type = "Robo_Bloons" break;
        case BLOON_TYPE.ROBO_PINK: _name = "Pink Robo Bloon" _link_main_type = "Robo_Bloons" break;
        case BLOON_TYPE.ROBO_RAINBOW: _name = "Rainbow Robo Bloon" _link_main_type = "Robo_Bloons" break;
        
        case BLOON_TYPE.PATROL: _name = "Patrol Bloon" _link_main_type = "Patrol_Bloons" break;
        
        case BLOON_TYPE.BARRIER_GREEN: _name = "Barrier Bloon new" _name_replacement = "Barrier Bloon Green" _link_main_type = "Barrier_Bloons" break;
        case BLOON_TYPE.BARRIER_PINK: _name = "Barrier Bloon 2" _name_replacement = "Barrier Bloon Pink" _link_main_type = "Barrier_Bloons" break;
        
        case BLOON_TYPE.PLANETARIUM: _name = "Planetarium Bloon New" _name_replacement = "Planetarium Bloon" _link_main_type = "Planetarium_Bloons" break;
        case BLOON_TYPE.PLANETARIUM_2: _name = "Planetarium Bloon 2" _name_replacement = "Planetarium Bloon" _link_main_type = "Planetarium_Bloons" break;
        
        case BLOON_TYPE.SPECTRUM: _name = "Spectrum Bloon" _link_main_type = "Spectrum_Bloons" _filetype = ".gif" break;
        
        case BLOON_TYPE.PRIMSATIC_HTA: _name = "Prismatic HTA New" _name_replacement = "Prismatic HTA" _link_main_type = "Prismatic_Hard_Titanium_Aircraft_(P.H.T.A.)" break;
        case BLOON_TYPE.MEGA_BRC: _name = "Mbrc" _name_replacement = "Mega BRC" _link_main_type = "Mega_Big_Rubbery_Carrier_(M.B.R.C.)" break;
        case BLOON_TYPE.ROCKET_BLIMP: _name = "Rb" _name_replacement = "Rocket Blimp" _link_main_type = "Rocket_Blimp_(R.B.)" break;
        case BLOON_TYPE.STORM_LPZ: _name = "Storm LPZ" _link_main_type = "Storm_Lightning_Powered_Zeppelin_(S.L.P.Z.)" break;
        case BLOON_TYPE.DEADLY_DDT: _name = "Dddt" _name_replacement = "Deadly DDT" _link_main_type = "Deadly_Dark_Dirigible_Titan_(D.D.D.T.)" break;
        case BLOON_TYPE.PARTY_BLIMP: _name = "Pb" _name_replacement = "Party Blimp" _link_main_type = "Party Blimp (P.B.)" break;
        
        case BLOON_TYPE.HTA: _name = "HTA" _link_main_type = "Hard_Titanium_Aircraft_(H.T.A.)" break
        case BLOON_TYPE.MINI_MOAB: _name = "Mini MOAB" _link_main_type = "Miniature_Massive_Ornery_Air_Blimp_(Mini_M.O.A.B.)" break
        case BLOON_TYPE.LPZ: _name = "LPZ" _link_main_type = "Lightning_Powered_Zeppelin_(L.P.Z.)" break
        case BLOON_TYPE.MOAB: _name = "MOAB" _link_main_type = "Massive_Ornery_Air_Blimp_(M.O.A.B.)" break
        case BLOON_TYPE.DDT: _name = "DDT" _link_main_type = "Dark_Dirigible_Titan_(D.D.T.)" break
        case BLOON_TYPE.BRC: _name = "BRC" _link_main_type = "Big_Rubbery_Carrier_(B.R.C.)" break
        case BLOON_TYPE.BFB: _name = "BFB" _link_main_type = "Brutal_Floating_Behemoth_(B.F.B.)" break
        case BLOON_TYPE.ZOMG: _name = "ZOMG" _link_main_type = "Zeppelin_of_Mighty_Gargantuaness_(Z.O.M.G.)" break
    }
    

    
    if array_contains(_property,BLOON_PROPERTIES.CAMO){
        _start += "Camo "
        _link_main_type = "Camo_Bloons"
    }
    
    if array_contains(_property,BLOON_PROPERTIES.LEAD){
        _start += "Lead "
        _link_main_type = "Lead_Bloons"
    }
    
    if array_contains(_property,BLOON_PROPERTIES.SHIELDED){
        _start += "Shielded "
        _link_main_type = "Shielded_Bloons"
    }
    
    if array_contains(_property,BLOON_PROPERTIES.SUPER_SHIELDED){
        _start += "Super Shielded "
        _link_main_type = "Super_Shield_Bloons"
    }
    
    if array_contains(_property,BLOON_PROPERTIES.REGROW){
        _start += "Regen "
        _link_main_type = "Regen_Bloons"
    }
    
    if array_contains(_property,BLOON_PROPERTIES.TATTERED){
        _start += "Tattered "
        _link_main_type = "Tattered_Bloons"
    }
    
    if array_contains(_property,BLOON_PROPERTIES.STATIC){
        _start += "Static "
        _link_main_type = "Static_Bloons"
    }
    
    if _name_replacement != ""
        _real_name = _name_replacement
    else {
    	_real_name = _name
    }
    
    
    return ["[[File:"+_start + _name+$"{_filetype}|link=Bloons#{_link_main_type}"+"]]",_start+_real_name]
}

Spawn = function (_number,_interval,_start_interval,_type,_properties = [BLOON_PROPERTIES.NONE]) constructor {
    bloons = _type
    properties = _properties
    interval = _interval
    start_interval = _start_interval
    number = _number
}

Wave = function (_cash_reward,_cash_flow = undefined) constructor {
    reward = _cash_reward
    
    if _cash_flow != undefined
        cash_flow = _cash_flow
    
    list = []
}

global.waves = [
    
]

#region NORMAL MODE WAVES
//
global.waves[0] = new Wave(20)
var _v = global.waves[0].list

PUSH(_v,new Spawn(20,32,0,BLOON_TYPE.RED))
//
global.waves[1] = new Wave(30)
_v = global.waves[1].list

PUSH(_v,new Spawn(24,32,0,BLOON_TYPE.RED))
//
global.waves[2] = new Wave(36)
_v = global.waves[2].list

PUSH(_v,new Spawn(1,0,0,BLOON_TYPE.RED))
PUSH(_v,new Spawn(1,0,27,BLOON_TYPE.BLUE))

repeat (11) {
    PUSH(_v,new Spawn(1,0,27,BLOON_TYPE.RED))
	PUSH(_v,new Spawn(1,0,27,BLOON_TYPE.BLUE))
}
//
global.waves[3] = new Wave(64)
_v = global.waves[3].list

PUSH(_v,new Spawn(20,12,0,BLOON_TYPE.RED))
PUSH(_v,new Spawn(12,36,96,BLOON_TYPE.BLUE))
PUSH(_v,new Spawn(20,10,16,BLOON_TYPE.RED))
//
global.waves[4] = new Wave(80)
_v = global.waves[4].list

PUSH(_v,new Spawn(3,9,0,BLOON_TYPE.RED))
PUSH(_v,new Spawn(5,9,10,BLOON_TYPE.RED))
PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.RED))
PUSH(_v,new Spawn(10,48,117,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(20,28,88,BLOON_TYPE.BLUE))
//
global.waves[5] = new Wave(92)
_v = global.waves[5].list

PUSH(_v,new Spawn(16,8,0,BLOON_TYPE.RED))
PUSH(_v,new Spawn(4,27,80,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,25,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(3,27,28,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(16,24,68,BLOON_TYPE.BLUE))
PUSH(_v,new Spawn(2,29,29,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(2,29,28,BLOON_TYPE.GREEN))
//
global.waves[6] = new Wave(72)
_v = global.waves[6].list

PUSH(_v,new Spawn(2,32,0,BLOON_TYPE.GREEN))

repeat (5) {
    PUSH(_v,new Spawn(1,0,31,BLOON_TYPE.GREEN))
    PUSH(_v,new Spawn(1,0,32,BLOON_TYPE.GREEN))
    PUSH(_v,new Spawn(1,0,32,BLOON_TYPE.GREEN))
    PUSH(_v,new Spawn(1,0,31,BLOON_TYPE.GREEN))
}

PUSH(_v,new Spawn(2,31,31,BLOON_TYPE.GREEN))
//
global.waves[7] = new Wave(104)
_v = global.waves[7].list

PUSH(_v,new Spawn(40,10,0,BLOON_TYPE.RED,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(16,27,27,BLOON_TYPE.ORANGE))
//
global.waves[8] = new Wave(132)
_v = global.waves[8].list

PUSH(_v,new Spawn(40,16,0,BLOON_TYPE.BLUE))
PUSH(_v,new Spawn(12,24,50,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(4,48,50,BLOON_TYPE.YELLOW))
//
global.waves[9] = new Wave(134)
_v = global.waves[9].list

PUSH(_v,new Spawn(60,12,12,BLOON_TYPE.BLUE))
PUSH(_v,new Spawn(2,36,36,BLOON_TYPE.CYAN))
//
global.waves[10] = new Wave(136,1.1)
_v = global.waves[10].list

PUSH(_v,new Spawn(1,0,0,BLOON_TYPE.ORANGE))

repeat (6) {
    PUSH(_v,new Spawn(1,0,4,BLOON_TYPE.ORANGE))
    PUSH(_v,new Spawn(1,0,28,BLOON_TYPE.ORANGE))
}

PUSH(_v,new Spawn(1,0,4,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(16,20,104,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(8,32,64,BLOON_TYPE.YELLOW))
//
global.waves[11] = new Wave(112)
_v = global.waves[11].list

PUSH(_v,new Spawn(12,30,0,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(12,30,220,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(8,45,60,BLOON_TYPE.PINK))
//
global.waves[12] = new Wave(192)
_v = global.waves[12].list

PUSH(_v,new Spawn(12,24,0,BLOON_TYPE.ORANGE,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(12,27,39,BLOON_TYPE.CYAN))
PUSH(_v,new Spawn(6,40,56,BLOON_TYPE.LIME))
//
global.waves[13] = new Wave(187)
_v = global.waves[13].list

PUSH(_v,new Spawn(28,25,25,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(15,35,85,BLOON_TYPE.PINK))
//
global.waves[14] = new Wave(130)
_v = global.waves[14].list

PUSH(_v,new Spawn(30,36,18,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(10,24,84,BLOON_TYPE.ORANGE,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[15] = new Wave(240)
_v = global.waves[15].list

PUSH(_v,new Spawn(50,8,8,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(30,15,65,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.REGROW]))
//
global.waves[16] = new Wave(104)
_v = global.waves[16].list

repeat (6) {
    PUSH(_v,new Spawn(1,0,44,BLOON_TYPE.PINK))
    PUSH(_v,new Spawn(1,0,4,BLOON_TYPE.PINK))
}

PUSH(_v,new Spawn(4,45,57,BLOON_TYPE.BLACK))
//
global.waves[17] = new Wave(168)
_v = global.waves[17].list

PUSH(_v,new Spawn(12,18,18,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(12,24,58,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(12,30,122,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(6,50,80,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[18] = new Wave(174)
_v = global.waves[18].list

PUSH(_v,new Spawn(5,40,40,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(5,40,40,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(32,10,30,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[19] = new Wave(233)
_v = global.waves[19].list

PUSH(_v,new Spawn(5,15,15,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(16,15,90,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(10,12,22,BLOON_TYPE.LIME))
PUSH(_v,new Spawn(4,20,100,BLOON_TYPE.AMBER))
//
global.waves[20] = new Wave(326)
_v = global.waves[20].list

PUSH(_v,new Spawn(1,0,0,BLOON_TYPE.RED))
PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.BLUE))
PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.YELLOW))

repeat (14) {
    PUSH(_v,new Spawn(1,0,37,BLOON_TYPE.RED))
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.BLUE))
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.GREEN))
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.YELLOW))
}

PUSH(_v,new Spawn(1,0,188,BLOON_TYPE.BLACK))

repeat (7) {
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.WHITE))
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.BLACK))
}

PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.WHITE))

//
global.waves[21] = new Wave(288)
_v = global.waves[21].list

PUSH(_v,new Spawn(2,26,0,BLOON_TYPE.BLACK))

PUSH(_v,new Spawn(2,26,27,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(2,26,27,BLOON_TYPE.BLACK))

PUSH(_v,new Spawn(3,26,62,BLOON_TYPE.WHITE))

PUSH(_v,new Spawn(2,26,27,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(1,0,27,BLOON_TYPE.WHITE))

PUSH(_v,new Spawn(4,60,74,BLOON_TYPE.ZEBRA))

PUSH(_v,new Spawn(2,11,71,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.SHIELDED]))

repeat (6) {
    PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(4,11,11,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.SHIELDED]))
}
//
global.waves[22] = new Wave(371)
_v = global.waves[22].list

PUSH(_v,new Spawn(20,5,0,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(24,5,85,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(12,10,110,BLOON_TYPE.LIME))
PUSH(_v,new Spawn(8,10,110,BLOON_TYPE.AMBER))
PUSH(_v,new Spawn(5,15,20,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.LEAD]))
//
global.waves[23] = new Wave(280)
_v = global.waves[23].list

PUSH(_v,new Spawn(20,24,0,BLOON_TYPE.CYAN,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(12,35,156,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(12,24,152,BLOON_TYPE.PINK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(4,25,37,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(4,25,75,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.LEAD]))
//
global.waves[24] = new Wave(385)
_v = global.waves[24].list

PUSH(_v,new Spawn(50,16,0,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.TATTERED]))

repeat (5) {
    PUSH(_v,new Spawn(1,0,20,BLOON_TYPE.BLACK))
    PUSH(_v,new Spawn(1,0,20,BLOON_TYPE.WHITE))
}

PUSH(_v,new Spawn(5,45,45,BLOON_TYPE.ZEBRA))
//
global.waves[25] = new Wave(304)
_v = global.waves[25].list

PUSH(_v,new Spawn(2,36,0,BLOON_TYPE.ZEBRA))
PUSH(_v,new Spawn(4,36,32,BLOON_TYPE.ZEBRA))
PUSH(_v,new Spawn(2,36,32,BLOON_TYPE.ZEBRA))
PUSH(_v,new Spawn(2,2,152,BLOON_TYPE.PINK,[BLOON_PROPERTIES.REGROW]))

repeat (7) {
	PUSH(_v,new Spawn(1,0,30,BLOON_TYPE.PINK,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.PINK,[BLOON_PROPERTIES.REGROW]))
}

PUSH(_v,new Spawn(8,42,57,BLOON_TYPE.PINK,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[26] = new Wave(817)
_v = global.waves[26].list

PUSH(_v,new Spawn(2,9,0,BLOON_TYPE.PINK))
PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.PINK))
PUSH(_v,new Spawn(2,10,10,BLOON_TYPE.PINK))

repeat (4) {
	PUSH(_v,new Spawn(2,10,9,BLOON_TYPE.PINK))
    PUSH(_v,new Spawn(3,10,9,BLOON_TYPE.PINK))
}

PUSH(_v,new Spawn(2,10,9,BLOON_TYPE.PINK))
PUSH(_v,new Spawn(2,10,9,BLOON_TYPE.PINK))

PUSH(_v,new Spawn(16,25,102,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(10,18,18,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(10,18,38,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(3,75,95,BLOON_TYPE.RAINBOW))
//
global.waves[27] = new Wave(332)
_v = global.waves[27].list

PUSH(_v,new Spawn(2,29,0,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(2,29,25,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(8,24,108,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.SHIELDED]))

PUSH(_v,new Spawn(2,24,66,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,23,23,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,24,24,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,23,22,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,24,24,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,23,23,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,24,24,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,22,23,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,24,24,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[28] = new Wave(448)
_v = global.waves[28].list

PUSH(_v,new Spawn(4,27,0,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(8,24,82,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(12,20,152,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(7,24,24,BLOON_TYPE.ZEBRA))
//
global.waves[29] = new Wave(666)
_v = global.waves[29].list

PUSH(_v,new Spawn(32,6,0,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(32,12,12,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(20,11,40,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(3,28,171,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,27,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(4,55,220,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(6,44,165,BLOON_TYPE.RAINBOW))
//
global.waves[30] = new Wave(700,0.99)
_v = global.waves[30].list

PUSH(_v,new Spawn(2,15,0,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(2,15,14,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(2,14,14,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(2,14,15,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(2,14,15,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(20,6,6,BLOON_TYPE.LIME))
PUSH(_v,new Spawn(12,16,66,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(16,16,166,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[31] = new Wave(1036)
_v = global.waves[31].list

PUSH(_v,new Spawn(9,35,0,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(15,18,18,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(44,3,178,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(3,75,78,BLOON_TYPE.CERAMIC))
//
global.waves[32] = new Wave(660)
_v = global.waves[32].list

PUSH(_v,new Spawn(2,11,0,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))

repeat (3) {
    PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(4,11,11,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))
}

PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(2,11,11,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))

PUSH(_v,new Spawn(6,8,93,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(9,8,9,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(11,8,9,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(9,8,9,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(5,8,9,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))

PUSH(_v,new Spawn(5,9,48,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(11,9,10,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(4,9,10,BLOON_TYPE.PURPLE))
//
global.waves[33] = new Wave(954)
_v = global.waves[33].list

PUSH(_v,new Spawn(30,9,9,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(12,24,90,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(4,30,116,BLOON_TYPE.PRISMATIC))
//
global.waves[34] = new Wave(704)
_v = global.waves[34].list

PUSH(_v,new Spawn(3,17,0,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.STATIC]))

repeat (2) {
    PUSH(_v,new Spawn(3,17,18,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(5,17,18,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.STATIC]))
}

PUSH(_v,new Spawn(3,0,18,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.STATIC]))

PUSH(_v,new Spawn(5,23,23,BLOON_TYPE.PINK,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(6,55,247,BLOON_TYPE.CERAMIC))
//
global.waves[35] = new Wave(789)
_v = global.waves[35].list

PUSH(_v,new Spawn(8,20,20,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(16,24,60,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(12,16,136,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.REGROW]))
//
global.waves[36] = new Wave(1520)
_v = global.waves[36].list

PUSH(_v,new Spawn(8,45,0,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(2,6,183,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.TATTERED]))

repeat (2) {
    PUSH(_v,new Spawn(2,7,7,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.TATTERED]))
    PUSH(_v,new Spawn(2,6,6,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.TATTERED]))
}

PUSH(_v,new Spawn(2,7,7,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(2,7,98,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.TATTERED]))

repeat (2) {
    PUSH(_v,new Spawn(2,6,6,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.TATTERED]))
    PUSH(_v,new Spawn(2,7,7,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.TATTERED]))
}

PUSH(_v,new Spawn(2,6,6,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(2,100,66,BLOON_TYPE.BRICK))
//
global.waves[37] = new Wave(677)
_v = global.waves[37].list

PUSH(_v,new Spawn(4,40,0,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(4,40,120,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(4,24,80,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(5,30,93,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[38] = new Wave(1016)
_v = global.waves[38].list

PUSH(_v,new Spawn(40,8,8,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(6,20,160,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.REGROW]))
//
global.waves[39] = new Wave(2851)
_v = global.waves[39].list

PUSH(_v,new Spawn(16,16,16,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(4,30,44,BLOON_TYPE.PRISMATIC))
PUSH(_v,new Spawn(10,35,145,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(1,0,250,BLOON_TYPE.MINI_MOAB))
//
global.waves[40] = new Wave(1892,0.85)
_v = global.waves[40].list

PUSH(_v,new Spawn(20,13,13,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(4,72,140,BLOON_TYPE.BRICK))
//
global.waves[41] = new Wave(884)
_v = global.waves[41].list

PUSH(_v,new Spawn(12,23,23,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,17,144,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(5,17,18,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,17,144,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(5,17,18,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,17,144,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,17,0,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[42] = new Wave(2578)
_v = global.waves[42].list

PUSH(_v,new Spawn(20,6,6,BLOON_TYPE.ZEBRA))
PUSH(_v,new Spawn(8,20,100,BLOON_TYPE.PRISMATIC))
PUSH(_v,new Spawn(2,90,90,BLOON_TYPE.MINI_MOAB))
//
global.waves[43] = new Wave(1494)
_v = global.waves[43].list

PUSH(_v,new Spawn(5,2,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(5,2,52,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(5,2,52,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(7,2,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(20,12,48,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.CAMO]))
//
global.waves[44] = new Wave(1624)
_v = global.waves[44].list

PUSH(_v,new Spawn(2,21,22,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(2,21,22,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(2,22,22,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(2,22,21,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(12,20,147,BLOON_TYPE.CERAMIC))
//
global.waves[45] = new Wave(3169)
_v = global.waves[45].list

PUSH(_v,new Spawn(2,30,0,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(2,30,60,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(80,4,104,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(3,60,30,BLOON_TYPE.MINI_MOAB))
//
global.waves[46] = new Wave(2504)
_v = global.waves[46].list

PUSH(_v,new Spawn(8,30,0,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(40,5,165,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(20,10,110,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.CAMO,BLOON_PROPERTIES.LEAD]))
//
global.waves[47] = new Wave(1640)
_v = global.waves[47].list

PUSH(_v,new Spawn(6,16,14,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(9,16,17,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(5,16,17,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(16,12,92,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(16,60,118,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.REGROW]))
//
global.waves[48] = new Wave(2260)
_v = global.waves[48].list

PUSH(_v,new Spawn(6,5,5,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(2,34,100,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
repeat (2) {
    PUSH(_v,new Spawn(2,35,35,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(2,34,34,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
}
//
global.waves[49] = new Wave(4730)
_v = global.waves[49].list

PUSH(_v,new Spawn(2,95,0,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(24,15,145,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(1,0,190,BLOON_TYPE.MOAB))
//
global.waves[50] = new Wave(2704,0.425)
_v = global.waves[50].list

PUSH(_v,new Spawn(16,20,4,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(10,20,216,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[51] = new Wave(4108)
_v = global.waves[51].list

PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(12,35,134,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(4,55,55,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[52] = new Wave(5808)
_v = global.waves[52].list

PUSH(_v,new Spawn(40,8,8,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(4,50,80,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(4,50,150,BLOON_TYPE.MINI_MOAB))
//
global.waves[53] = new Wave(3444)
_v = global.waves[53].list

PUSH(_v,new Spawn(2,50,150,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(20,12,212,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.CAMO]))
//
global.waves[54] = new Wave(3965)
_v = global.waves[54].list

PUSH(_v,new Spawn(3,86,0,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,86,87,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,13,158,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(4,14,14,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(5,14,13,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(5,14,13,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(4,14,14,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(10,15,225,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))
//
global.waves[55] = new Wave(6312)
_v = global.waves[55].list

PUSH(_v,new Spawn(14,28,28,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(2,28,68,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(2,75,87,BLOON_TYPE.MOAB))
//
global.waves[56] = new Wave(3220)
_v = global.waves[56].list

PUSH(_v,new Spawn(3,25,26,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.REGROW]))

repeat (3) {
    PUSH(_v,new Spawn(2,26,26,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(2,25,25,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.REGROW]))
}

PUSH(_v,new Spawn(1,0,26,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(3,9,92,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(5,9,10,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(5,9,10,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(5,9,10,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))

PUSH(_v,new Spawn(1,0,177,BLOON_TYPE.HTA))
//
global.waves[57] = new Wave(7076)
_v = global.waves[57].list

PUSH(_v,new Spawn(72,5,5,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(16,15,155,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(3,125,160,BLOON_TYPE.MOAB))
//
global.waves[58] = new Wave(8588)
_v = global.waves[58].list

PUSH(_v,new Spawn(20,8,8,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(20,8,80,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(1,0,150,BLOON_TYPE.BRC))
//
global.waves[59] = new Wave(8455)
_v = global.waves[59].list

repeat (11) {
	PUSH(_v,new Spawn(9,8,8,BLOON_TYPE.PINK,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(1,0,8,[BLOON_TYPE.MINI_MOAB,BLOON_TYPE.PINK],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.STATIC] ]))
}

PUSH(_v,new Spawn(2,150,170,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[60] = new Wave(7435,0.17)
_v = global.waves[60].list

PUSH(_v,new Spawn(20,25,25,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(10,18,118,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(2,100,120,BLOON_TYPE.HTA))
//
global.waves[61] = new Wave(10188)
_v = global.waves[61].list

PUSH(_v,new Spawn(5,100,0,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(8,55,205,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[62] = new Wave(11976)
_v = global.waves[62].list

PUSH(_v,new Spawn(13,12,16,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(24,1,341,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(6,2,2,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(2,225,139,BLOON_TYPE.BRC))
//
global.waves[63] = new Wave(14476)
_v = global.waves[63].list

PUSH(_v,new Spawn(3,38,0,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(3,38,39,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(5,38,39,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(3,38,39,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(5,38,39,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(1,0,39,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(1,0,248,BLOON_TYPE.BFB))
//
global.waves[64] = new Wave(8320)
_v = global.waves[64].list

PUSH(_v,new Spawn(20,23,23,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(20,9,179,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.TATTERED]))

repeat (2) {
	PUSH(_v,new Spawn(20,9,79,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.TATTERED]))
}
//
global.waves[65] = new Wave(14176)
_v = global.waves[65].list

PUSH(_v,new Spawn(8,85,0,BLOON_TYPE.MOAB))

PUSH(_v,new Spawn(6,12,131,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(9,12,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(11,12,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(9,12,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(5,12,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[66] = new Wave(8212)
_v = global.waves[66].list

PUSH(_v,new Spawn(20,19,19,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(4,60,180,BLOON_TYPE.HTA))
PUSH(_v,new Spawn(20,9,169,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.CAMO,BLOON_PROPERTIES.LEAD]))
//
global.waves[67] = new Wave(20424)
_v = global.waves[67].list

PUSH(_v,new Spawn(3,200,0,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(30,15,215,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW]))
//
global.waves[68] = new Wave(24042)
_v = global.waves[68].list

PUSH(_v,new Spawn(3,33,33,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(3,41,41,BLOON_TYPE.MINI_MOAB))

repeat (3) {
	PUSH(_v,new Spawn(3,41,42,BLOON_TYPE.MINI_MOAB))
    PUSH(_v,new Spawn(5,41,42,BLOON_TYPE.MINI_MOAB))
}

PUSH(_v,new Spawn(2,250,188,BLOON_TYPE.BFB))
//
global.waves[69] = new Wave(10252)
_v = global.waves[69].list

PUSH(_v,new Spawn(2,9,9,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))

repeat (5) {
	PUSH(_v,new Spawn(5,9,10,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
}

PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))

PUSH(_v,new Spawn(1,0,10,[BLOON_TYPE.BFB,BLOON_TYPE.RAINBOW],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.STATIC] ]))
PUSH(_v,new Spawn(4,9,9,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(5,9,10,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(3,9,10,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,270,BLOON_TYPE.LPZ))
//
global.waves[70] = new Wave(15160,0.12)
_v = global.waves[70].list

PUSH(_v,new Spawn(2,7,8,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(2,7,8,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))

PUSH(_v,new Spawn(2,8,8,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(2,8,7,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))

repeat (18) {
	PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(2,8,8,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(2,8,7,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))
}

PUSH(_v,new Spawn(2,8,7,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))

PUSH(_v,new Spawn(2,18,111,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))

PUSH(_v,new Spawn(7,18,17,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,18,17,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,18,17,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(4,18,17,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,17,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[71] = new Wave(23300)
_v = global.waves[71].list

PUSH(_v,new Spawn(8,100,0,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,125,300,BLOON_TYPE.BRC))
//
global.waves[72] = new Wave(18992)
_v = global.waves[72].list

PUSH(_v,new Spawn(4,66,0,BLOON_TYPE.HTA))
PUSH(_v,new Spawn(4,66,54,BLOON_TYPE.HTA))
PUSH(_v,new Spawn(3,200,264,BLOON_TYPE.BFB))
//
global.waves[73] = new Wave(25040)
_v = global.waves[73].list

PUSH(_v,new Spawn(20,52,0,BLOON_TYPE.MOAB))
//
global.waves[74] = new Wave(8796)
_v = global.waves[74].list

var _nums = [5,7,2,5,2,2,3,2,2,2,2,2,2,2,5,2,7,9,2,5,2,2,3,2,2,2,2,2,2,2,3,2,2,2]
var _frmes = [13,13,13,13,13,13,14,13,13,14,12,14,12,13,13,13,13,13,13,13,13,12,13,13,12,14,12,14,13,13,13,13,13,13]
var _start = [210,14,12,15,12,14,12,12,14,12,13,14,13,14,12,15,12,14,12,15,12,14,15,12,14,13,13,14,12,14,12,14,14,12]
var _num = array_length(_nums)

PUSH(_v,new Spawn(1,0,0,BLOON_TYPE.LPZ))

for (var i = 0; i < _num; i++) {
	PUSH(_v,new Spawn(_nums[i],_frmes[i],_start[i],BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
}

PUSH(_v,new Spawn(1,0,153,BLOON_TYPE.LPZ))
//
global.waves[75] = new Wave(16060)
_v = global.waves[75].list

PUSH(_v,new Spawn(40,9,9,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO,BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(50,9,144,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(10,1,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW]))
//
global.waves[76] = new Wave(23280)
_v = global.waves[76].list

PUSH(_v,new Spawn(4,160,0,BLOON_TYPE.BFB))
PUSH(_v,new Spawn(1,0,210,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[77] = new Wave(20892)
_v = global.waves[77].list

PUSH(_v,new Spawn(3,20,18,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))

repeat (5) {
	PUSH(_v,new Spawn(5,20,19,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
}

PUSH(_v,new Spawn(2,20,19,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,50,58,BLOON_TYPE.DDT))
//
global.waves[78] = new Wave(22266)
_v = global.waves[78].list

PUSH(_v,new Spawn(60,6,6,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(12,40,180,BLOON_TYPE.HTA))
//
global.waves[79] = new Wave(24368)
_v = global.waves[79].list

PUSH(_v,new Spawn(3,230,0,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SHIELDED]))

var _nums = [4,2,5,2,2,3,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,5,2,6,7,2,2,2,2,2,2,2,2,2,2,2,2,3,2,1]
var _frmes = [13,13,13,12,14,13,12,13,15,14,13,14,12,14,12,13,14,12,14,12,13,13,13,13,13,12,12,15,14,13,13,13,12,12,14,12,13,14,12,14]
var _start = [251,15,12,14,13,13,14,13,12,13,12,12,13,14,13,14,12,13,14,13,14,12,15,12,14,14,13,13,13,12,12,14,15,13,13,13,14,12,13,12]
var _num = array_length(_nums)

for (var i = 0; i < _num; i++) {
	PUSH(_v,new Spawn(_nums[i],_frmes[i],_start[i],BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
}
//
global.waves[80] = new Wave(35424,0.1)
_v = global.waves[80].list

PUSH(_v,new Spawn(8,90,0,BLOON_TYPE.BRC))
//
global.waves[81] = new Wave(24812)
_v = global.waves[81].list

PUSH(_v,new Spawn(256,2,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(3,5,19,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))

repeat (10) {
	PUSH(_v,new Spawn(3,5,6,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(5,5,6,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
}

PUSH(_v,new Spawn(3,5,6,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,5,5,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[82] = new Wave(17968)
_v = global.waves[82].list

PUSH(_v,new Spawn(1,0,0,BLOON_TYPE.ZOMG))
//
global.waves[83] = new Wave(22644)
_v = global.waves[83].list

PUSH(_v,new Spawn(3,40,0,BLOON_TYPE.DDT))
PUSH(_v,new Spawn(15,30,210,BLOON_TYPE.HTA))
PUSH(_v,new Spawn(3,40,0,BLOON_TYPE.DDT))
//
global.waves[84] = new Wave(37840)
_v = global.waves[84].list

PUSH(_v,new Spawn(2,172,0,BLOON_TYPE.LPZ))
PUSH(_v,new Spawn(1,0,173,BLOON_TYPE.LPZ))
PUSH(_v,new Spawn(8,100,230,BLOON_TYPE.BFB))
//
global.waves[85] = new Wave(37560)
_v = global.waves[85].list

PUSH(_v,new Spawn(2,57,0,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(4,57,56,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,57,56,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,57,56,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,57,56,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(4,57,56,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,10,56,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,47,[BLOON_TYPE.MOAB,BLOON_TYPE.MOAB],[ [BLOON_PROPERTIES.SHIELDED],[BLOON_PROPERTIES.SHIELDED] ]))
PUSH(_v,new Spawn(2,10,47,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(2,19,37,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,47,29,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[86] = new Wave(48496)
_v = global.waves[86].list

PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(2,27,395,BLOON_TYPE.HTA))

repeat (9) {
	PUSH(_v,new Spawn(2,27,28,BLOON_TYPE.HTA))
}

PUSH(_v,new Spawn(1,0,380,BLOON_TYPE.ZOMG))
//
global.waves[87] = new Wave(34888)
_v = global.waves[87].list

PUSH(_v,new Spawn(3,40,0,BLOON_TYPE.DDT))

repeat (2) {
	PUSH(_v,new Spawn(3,40,200,BLOON_TYPE.DDT))
}


PUSH(_v,new Spawn(2,10,229,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
repeat (3) {
	PUSH(_v,new Spawn(2,10,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
}

PUSH(_v,new Spawn(2,9,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
repeat (4) {
	PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
}

PUSH(_v,new Spawn(3,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
repeat (4) {
	PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
}

repeat (2) {
	PUSH(_v,new Spawn(3,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
    repeat (3) {
    	PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
    }
}

repeat (2) {
	PUSH(_v,new Spawn(3,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
    repeat (4) {
    	PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
    }
}

PUSH(_v,new Spawn(3,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
repeat (3) {
    PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
}

PUSH(_v,new Spawn(3,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
repeat (5) {
    PUSH(_v,new Spawn(2,9,10,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
}
//
global.waves[88] = new Wave(53048)
_v = global.waves[88].list

PUSH(_v,new Spawn(7,81,0,BLOON_TYPE.BFB))
PUSH(_v,new Spawn(1,0,144,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(100,6,270,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[89] = new Wave(53904)
_v = global.waves[89].list

PUSH(_v,new Spawn(2,593,1,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(1,0,803,BLOON_TYPE.ZOMG))
//
#endregion

#region IMPOPPABLE WAVES
global.waves = []

//
global.waves[0] = new Wave(24,0.75)
_v = global.waves[0].list

PUSH(_v,new Spawn(2,5,6,BLOON_TYPE.RED))

repeat (11) {
    PUSH(_v,new Spawn(2,5,35,BLOON_TYPE.RED))
}
//
global.waves[1] = new Wave(39)
_v = global.waves[1].list

PUSH(_v,new Spawn(3,4,5,BLOON_TYPE.RED))

repeat (11) {
	PUSH(_v,new Spawn(3,4,30,BLOON_TYPE.RED))
}

PUSH(_v,new Spawn(2,4,30,BLOON_TYPE.RED))
//
global.waves[2] = new Wave(50)
_v = global.waves[2].list

PUSH(_v,new Spawn(25,19,2,BLOON_TYPE.BLUE))
//
global.waves[3] = new Wave(60)
_v = global.waves[3].list

PUSH(_v,new Spawn(4,4,5,BLOON_TYPE.RED))

repeat (9) {
	PUSH(_v,new Spawn(4,4,27,BLOON_TYPE.RED))
}

PUSH(_v,new Spawn(20,10,53,BLOON_TYPE.RED))
//
global.waves[4] = new Wave(108)
_v = global.waves[4].list

PUSH(_v,new Spawn(20,24,2,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(2,3,67,BLOON_TYPE.BLUE))

repeat (11) {
	PUSH(_v,new Spawn(2,3,26,BLOON_TYPE.BLUE))
}
//
global.waves[5] = new Wave(130)
_v = global.waves[5].list

PUSH(_v,new Spawn(20,22,2,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(50,5,81,BLOON_TYPE.RED))
//
global.waves[6] = new Wave(116)
_v = global.waves[6].list

PUSH(_v,new Spawn(5,4,5,BLOON_TYPE.BLUE))

repeat (7) {
	PUSH(_v,new Spawn(5,4,38,BLOON_TYPE.BLUE))
}

PUSH(_v,new Spawn(6,4,82,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(6,4,50,BLOON_TYPE.GREEN))
//
global.waves[7] = new Wave(108)
_v = global.waves[7].list

PUSH(_v,new Spawn(5,15,2,BLOON_TYPE.RED))

repeat (20) {
	PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.RED,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.RED))
}

PUSH(_v,new Spawn(3,15,9,BLOON_TYPE.RED,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(15,27,60,BLOON_TYPE.ORANGE,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[8] = new Wave(140)
_v = global.waves[8].list

PUSH(_v,new Spawn(20,28,2,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(30,9,47,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[9] = new Wave(256)
_v = global.waves[9].list

PUSH(_v,new Spawn(8,3,4,BLOON_TYPE.BLUE))

repeat (8) {
	PUSH(_v,new Spawn(8,3,34,BLOON_TYPE.BLUE))
}

PUSH(_v,new Spawn(16,17,86,BLOON_TYPE.CYAN))
//
global.waves[10] = new Wave(206)
_v = global.waves[10].list

PUSH(_v,new Spawn(5,4,5,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(5,4,59,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(5,4,59,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(4,4,59,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(2,4,62,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(2,19,42,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(2,4,10,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(4,19,5,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(2,4,9,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(4,19,6,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(2,4,8,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(4,19,7,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(2,4,7,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(10,19,8,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(10,29,13,BLOON_TYPE.PINK))
//
global.waves[11] = new Wave(222)
_v = global.waves[11].list

PUSH(_v,new Spawn(30,9,2,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(11,4,158,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(11,4,60,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(11,4,60,BLOON_TYPE.YELLOW))
//
global.waves[12] = new Wave(270)
_v = global.waves[12].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.REGROW]))

repeat (44) {
	PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.GREEN))
    PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.REGROW]))
}

PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.GREEN))
//
global.waves[13] = new Wave(418)
_v = global.waves[13].list

PUSH(_v,new Spawn(32,10,2,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(20,19,189,BLOON_TYPE.CYAN))
PUSH(_v,new Spawn(15,27,139,BLOON_TYPE.LIME))
//
global.waves[14] = new Wave(288)
_v = global.waves[14].list

PUSH(_v,new Spawn(8,33,2,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(40,18,68,BLOON_TYPE.PINK))
//
global.waves[15] = new Wave(230)
_v = global.waves[15].list

PUSH(_v,new Spawn(30,11,2,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(20,17,100,BLOON_TYPE.CYAN,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[16] = new Wave(394)
_v = global.waves[16].list

PUSH(_v,new Spawn(12,21,2,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(12,21,68,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(15,4,219,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(15,4,64,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[17] = new Wave(460)
_v = global.waves[17].list

PUSH(_v,new Spawn(20,15,2,BLOON_TYPE.AMBER))
PUSH(_v,new Spawn(20,12,114,BLOON_TYPE.LIME))
//
global.waves[18] = new Wave(330)
_v = global.waves[18].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.LEAD]))

repeat (19) {
    PUSH(_v,new Spawn(1,0,39,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,39,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.LEAD]))
}

PUSH(_v,new Spawn(40,6,109,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
//
global.waves[19] = new Wave(650)
_v = global.waves[19].list

PUSH(_v,new Spawn(13,33,2,BLOON_TYPE.ZEBRA))
PUSH(_v,new Spawn(20,12,103,BLOON_TYPE.RED,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(10,27,172,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,20,[BLOON_TYPE.PURPLE,BLOON_TYPE.BLUE],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.STATIC] ]))
PUSH(_v,new Spawn(1,0,20,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(1,0,19,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(8,20,12,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.STATIC]))
//
global.waves[20] = new Wave(390)
_v = global.waves[20].list

PUSH(_v,new Spawn(45,8,2,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(20,12,97,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(10,27,122,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[21] = new Wave(620)
_v = global.waves[21].list

PUSH(_v,new Spawn(20,15,2,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(40,23,114,BLOON_TYPE.LIME,[BLOON_PROPERTIES.LEAD]))
//
global.waves[22] = new Wave(620)
_v = global.waves[22].list

PUSH(_v,new Spawn(20,14,2,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(80,5,133,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))
//
global.waves[23] = new Wave(520)
_v = global.waves[23].list

PUSH(_v,new Spawn(20,24,2,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(20,20,43,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.STATIC]))
//
global.waves[24] = new Wave(864)
_v = global.waves[24].list

PUSH(_v,new Spawn(12,27,2,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(60,6,202,BLOON_TYPE.PINK,[BLOON_PROPERTIES.REGROW]))
//
global.waves[25] = new Wave(1030)
_v = global.waves[25].list

PUSH(_v,new Spawn(30,8,2,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(10,3,127,BLOON_TYPE.PURPLE))

repeat (3) {
	PUSH(_v,new Spawn(10,3,63,BLOON_TYPE.PURPLE))
}
//
global.waves[26] = new Wave(675)
_v = global.waves[26].list

PUSH(_v,new Spawn(50,12,2,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(25,20,111,BLOON_TYPE.PINK,[BLOON_PROPERTIES.STATIC]))
//
global.waves[27] = new Wave(2072)
_v = global.waves[27].list

PUSH(_v,new Spawn(8,4,2,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(8,4,121,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(8,4,122,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(8,4,122,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(4,10,172,BLOON_TYPE.PRISMATIC))
//
global.waves[28] = new Wave(1000)
_v = global.waves[28].list

PUSH(_v,new Spawn(100,4,2,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(100,4,103,BLOON_TYPE.PINK,[BLOON_PROPERTIES.REGROW]))
//
global.waves[29] = new Wave(1540)
_v = global.waves[29].list

PUSH(_v,new Spawn(10,26,2,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(50,10,185,BLOON_TYPE.PINK,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[30] = new Wave(1560,0.5)
_v = global.waves[30].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.PINK,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.RAINBOW))

repeat (29) {
	PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.PINK,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.RAINBOW))
}
//
global.waves[31] = new Wave(1170)
_v = global.waves[31].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(1,0,16,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))

repeat (29) {
	PUSH(_v,new Spawn(1,0,16,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(1,0,16,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.SHIELDED]))
}
//
global.waves[32] = new Wave(2600)
_v = global.waves[32].list

PUSH(_v,new Spawn(20,19,2,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(5,60,389,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))
//
global.waves[33] = new Wave(2022)
_v = global.waves[33].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.TATTERED]))

repeat (79) {
    PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.TATTERED]))
}

PUSH(_v,new Spawn(20,15,27,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.REGROW]))
//
global.waves[34] = new Wave(2824)
_v = global.waves[34].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(4,17,16,BLOON_TYPE.ZEBRA))

repeat (7) {
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.BRICK))
	PUSH(_v,new Spawn(4,17,16,BLOON_TYPE.ZEBRA))
}

PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(12,17,17,BLOON_TYPE.ZEBRA))

//
global.waves[35] = new Wave(4200)
_v = global.waves[35].list

PUSH(_v,new Spawn(40,8,2,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(8,30,87,BLOON_TYPE.PRISMATIC))
//
global.waves[36] = new Wave(3353)
_v = global.waves[36].list

PUSH(_v,new Spawn(8,8,2,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(8,8,194,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(8,8,194,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(12,24,293,BLOON_TYPE.PRISMATIC))
//
global.waves[37] = new Wave(1776)
_v = global.waves[37].list

PUSH(_v,new Spawn(3,120,2,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(20,18,210,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(20,33,108,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
//
global.waves[38] = new Wave(2012)
_v = global.waves[38].list

PUSH(_v,new Spawn(20,10,2,BLOON_TYPE.PURPLE,[BLOON_PROPERTIES.CAMO,BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(36,16,159,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.REGROW]))
//
global.waves[39] = new Wave(5324)
_v = global.waves[39].list

PUSH(_v,new Spawn(9,10,2,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(9,10,220,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(10,30,319,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[40] = new Wave(6199,0.3)
_v = global.waves[40].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(6,24,15,BLOON_TYPE.CERAMIC))

PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(6,24,19,BLOON_TYPE.CERAMIC))

PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(5,24,23,BLOON_TYPE.CERAMIC))

PUSH(_v,new Spawn(1,0,21,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(6,24,3,BLOON_TYPE.CERAMIC))

PUSH(_v,new Spawn(1,0,17,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(13,24,7,BLOON_TYPE.CERAMIC))
//
global.waves[41] = new Wave(5640)
_v = global.waves[41].list

var _num = [ [1,1],[6,1],[6,1],[6,1],[6,1],[6,1],[6,1],[6,1],[6,1] ]
var _frame = [ [0,0],[9,0],[9,0],[9,0],[9,0],[9,0],[9,0],[9,0],[9,0]]
var _sframes = [ [2,2],[9,1],[8,2],[7,3],[6,4],[5,5],[4,6],[3,7],[2,8]]

var _rnum = 9

for (var i = 0; i < _rnum; i++) {
	PUSH(_v,new Spawn(_num[i][0],_frame[i][0],_sframes[i][0],BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(_num[i][1],_frame[i][1],_sframes[i][1],[BLOON_TYPE.RAINBOW,BLOON_TYPE.RAINBOW],[[BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.SHIELDED]] ))
}

PUSH(_v,new Spawn(5,9,1,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,9, [BLOON_TYPE.RAINBOW,BLOON_TYPE.RAINBOW,BLOON_TYPE.RAINBOW],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.SHIELDED],[BLOON_PROPERTIES.TATTERED] ]))

PUSH(_v,new Spawn(4,9,9,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,19,[BLOON_TYPE.RAINBOW,BLOON_TYPE.RAINBOW],[[BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.SHIELDED]] ))

repeat (19) {
    PUSH(_v,new Spawn(1,0,55,[BLOON_TYPE.RAINBOW,BLOON_TYPE.RAINBOW],[[BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.SHIELDED]] ))
}
//
global.waves[42] = new Wave(4584)
_v = global.waves[42].list

PUSH(_v,new Spawn(2,220,2,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(20,21,379,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[43] = new Wave(4680)
_v = global.waves[43].list

PUSH(_v,new Spawn(5,20,2,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(20,24,159,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[44] = new Wave(4430)
_v = global.waves[44].list

PUSH(_v,new Spawn(12,10,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(20,23,139,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(40,8,163,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
//
global.waves[45] = new Wave(9070)
_v = global.waves[45].list

PUSH(_v,new Spawn(10,77,2,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(40,15,106,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.REGROW]))
//
global.waves[46] = new Wave(11372)
_v = global.waves[46].list

PUSH(_v,new Spawn(28,35,2,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(1,0,4,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(5,35,31,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(1,0,29,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(6,35,6,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(1,0,19,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(1,0,16,BLOON_TYPE.BRICK))
//
global.waves[47] = new Wave(7365)
_v = global.waves[47].list

PUSH(_v,new Spawn(5,30,2,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(5,30,249,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(5,64,460,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[48] = new Wave(6352)
_v = global.waves[48].list

PUSH(_v,new Spawn(20,24,2,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,343,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.LEAD]))

repeat (23) {
	PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.LEAD]))
}

PUSH(_v,new Spawn(2,100,171,BLOON_TYPE.HTA))
//
global.waves[49] = new Wave(11036)
_v = global.waves[49].list

PUSH(_v,new Spawn(4,130,2,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(13,4,359,BLOON_TYPE.PURPLE))
PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(87,4,2,BLOON_TYPE.PURPLE))
//
global.waves[50] = new Wave(13392,0.18)
_v = global.waves[50].list

PUSH(_v,new Spawn(8,80,2,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(40,11,319,BLOON_TYPE.PRISMATIC))
//
global.waves[51] = new Wave(9608)
_v = global.waves[51].list

PUSH(_v,new Spawn(4,100,2,BLOON_TYPE.HTA))

PUSH(_v,new Spawn(1,0,299,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.LEAD]))

repeat (19) {
	PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.LEAD]))
}
//
global.waves[52] = new Wave(8192)
_v = global.waves[52].list

PUSH(_v,new Spawn(3,240,2,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(10,70,469,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(3,18,20,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(4,18,4,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,12,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(29,18,6,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[53] = new Wave(7776)
_v = global.waves[53].list

PUSH(_v,new Spawn(4,40,2,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,29,BLOON_TYPE.BFB))
PUSH(_v,new Spawn(26,40,11,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
//
global.waves[54] = new Wave(14806)
_v = global.waves[54].list

PUSH(_v,new Spawn(25,24,2,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(2,250,123,BLOON_TYPE.BRC))
//
global.waves[55] = new Wave(11264)
_v = global.waves[55].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(1,0,17,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))

repeat (29) {
	PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(1,0,17,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))
}

PUSH(_v,new Spawn(8,120,312,BLOON_TYPE.HTA))
//
global.waves[56] = new Wave(13336)
_v = global.waves[56].list

PUSH(_v,new Spawn(8,120,2,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(30,18,309,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.TATTERED,BLOON_PROPERTIES.REGROW]))
//
global.waves[57] = new Wave(16677)
_v = global.waves[57].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BFB))
PUSH(_v,new Spawn(15,60,29,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(1,0,31,BLOON_TYPE.BFB))
//
global.waves[58] = new Wave(13680)
_v = global.waves[58].list

PUSH(_v,new Spawn(1,0,0,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,25,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))

repeat (39) {
	PUSH(_v,new Spawn(1,0,25,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(1,0,25,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SHIELDED]))
}
//
global.waves[59] = new Wave(19184)
_v = global.waves[59].list

PUSH(_v,new Spawn(3,20,2,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))

repeat (7) {
	PUSH(_v,new Spawn(10,20,11,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
}

PUSH(_v,new Spawn(23,20,11,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,149,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[60] = new Wave(21120,0.15)
_v = global.waves[60].list

PUSH(_v,new Spawn(40,27,2,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(20,24,146,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.CAMO,BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(40,21,144,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[61] = new Wave(28112)
_v = global.waves[61].list

PUSH(_v,new Spawn(4,14,2,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(23,14,14,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(23,14,13,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(24,14,5,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(1,0,3,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(25,14,11,BLOON_TYPE.CERAMIC))
//
global.waves[62] = new Wave(16344)
_v = global.waves[62].list

PUSH(_v,new Spawn(15,50,2,BLOON_TYPE.HTA))
PUSH(_v,new Spawn(3,90,299,BLOON_TYPE.DDT))
//
global.waves[63] = new Wave(32420)
_v = global.waves[63].list

var _num = [ [2,1],[5,1],[5,1],[4,1],[5,1],[5,1],[4,1],[5,1],[5,1],[5,1],[4,1],[5,1],[5,1],[4,1],[5,1],[5,1] ]
var _frame = [ [17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0],[17,0] ]
var _sframes = [ [2,12],[5,7],[10,2],[15,14],[3,9],[8,4],[13,16],[1,11],[6,5],[11,1],[16,13],[4,8],[9,3],[14,15],[2,10],[7,5] ]

var _rnum = 16

for (var i = 0; i < _rnum; i++) {
	PUSH(_v,new Spawn(_num[i][0],_frame[i][0],_sframes[i][0],BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(_num[i][1],_frame[i][1],_sframes[i][1],BLOON_TYPE.MOAB ))
}

PUSH(_v,new Spawn(4,12,17,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,17,[BLOON_TYPE.MOAB,BLOON_TYPE.CERAMIC],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.STATIC] ]))
PUSH(_v,new Spawn(4,17,17,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,12,BLOON_TYPE.MOAB ))
PUSH(_v,new Spawn(5,17,5,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.MOAB ))
PUSH(_v,new Spawn(5,17,10,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.MOAB ))
PUSH(_v,new Spawn(8,17,15,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(2,150,216,BLOON_TYPE.LPZ))
//
global.waves[64] = new Wave(31936)
_v = global.waves[64].list

PUSH(_v,new Spawn(3,300,2,BLOON_TYPE.BFB))
PUSH(_v,new Spawn(1,0,599,BLOON_TYPE.ZOMG))
//
global.waves[65] = new Wave(28352)
_v = global.waves[65].list

PUSH(_v,new Spawn(80,20,2,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(2,400,19,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[66] = new Wave(25210)
_v = global.waves[66].list

var _num = [ [4,1],[3,1],[2,1],[3,1],[2,1],[2,1],[3,1],[2,1],[3,1],[2,1],[2,1],[3,1],[2,1],[3,1],[2,1],[2,1],[3,1],[2,1],[3,1],[2,1],[2,1],[3,1],[2,1],[3,1],[2,1],[2,1],[3,1],[2,1],[3,1],[2,1] ]
var _sframes = [ [2,24],[1,9],[16,19],[6,4],[21,14],[21,24],[1,9],[16,19],[6,4],[21,14],[11,24],[1,9],[16,19],[6,4],[21,24],[1,24],[1,9],[16,19],[6,4],[21,14],[11,24],[1,9],[16,19],[6,4],[21,14],[11,24],[1,9],[16,19],[6,4],[21,14] ]

var _rnum = array_length(_num)

for (var i = 0; i < _rnum; i++) {
	PUSH(_v,new Spawn(_num[i][0],25,_sframes[i][0],BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(_num[i][1],0,_sframes[i][1],BLOON_TYPE.MOAB ))
}

PUSH(_v,new Spawn(1,0,11,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(2,30,299,BLOON_TYPE.LPZ))
//
global.waves[67] = new Wave(29426)
_v = global.waves[67].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.CAMO]))

repeat (39) {
    PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.LEAD]))
    PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.CAMO]))
}

PUSH(_v,new Spawn(6,90,293,BLOON_TYPE.DDT))
//
global.waves[68] = new Wave(85036)
_v = global.waves[68].list

PUSH(_v,new Spawn(100,17,2,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(2,700,1016,BLOON_TYPE.ZOMG))
//
global.waves[69] = new Wave(27936)
_v = global.waves[69].list

PUSH(_v,new Spawn(6,330,2,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[70] = new Wave(55520,0.12)
_v = global.waves[70].list

PUSH(_v,new Spawn(8,150,2,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(32,35,549,BLOON_TYPE.HTA))
//
global.waves[71] = new Wave(63120)
_v = global.waves[71].list

PUSH(_v,new Spawn(2,80,2,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(6,12,19,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))

PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(6,12,11,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))

repeat (8) {
    PUSH(_v,new Spawn(7,12,3,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(7,12,8,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(6,12,11,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
    PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
}

PUSH(_v,new Spawn(7,12,3,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.PRISMATIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,73,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[72] = new Wave(69504)
_v = global.waves[72].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(59,12,299,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(83,12,7,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(8,12,3,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[73] = new Wave(32665)
_v = global.waves[73].list

PUSH(_v,new Spawn(15,40,2,BLOON_TYPE.DDT))
PUSH(_v,new Spawn(5,100,689,BLOON_TYPE.LPZ))
//
global.waves[74] = new Wave(89840)
_v = global.waves[74].list

PUSH(_v,new Spawn(3,500,2,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(1,0,500,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(1,0,500,BLOON_TYPE.ZOMG,[BLOON_PROPERTIES.SHIELDED]))
//

#endregion

#region NIGHTMARE WAVES
global.waves = []


//
global.waves[0] = new Wave(52,0.7)
var _v = global.waves[0].list

PUSH(_v,new Spawn(52,15,6,BLOON_TYPE.RED))
//
global.waves[1] = new Wave(66)
var _v = global.waves[1].list

PUSH(_v,new Spawn(33,27,5,BLOON_TYPE.BLUE))
//
global.waves[2] = new Wave(72)
var _v = global.waves[2].list

PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,20,BLOON_TYPE.RED,[BLOON_PROPERTIES.TATTERED]))

repeat (23) {
    PUSH(_v,new Spawn(1,0,19,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.TATTERED]))
    PUSH(_v,new Spawn(1,0,20,BLOON_TYPE.RED,[BLOON_PROPERTIES.TATTERED]))
}
//
global.waves[3] = new Wave(140)
var _v = global.waves[3].list

PUSH(_v,new Spawn(20,36,5,BLOON_TYPE.GREEN))
PUSH(_v,new Spawn(20,32,212,BLOON_TYPE.ORANGE))
//
global.waves[4] = new Wave(100)
var _v = global.waves[4].list

PUSH(_v,new Spawn(20,25,6,BLOON_TYPE.RED,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(80,12,20,BLOON_TYPE.RED,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[5] = new Wave(180)
var _v = global.waves[5].list

PUSH(_v,new Spawn(10,10,5,BLOON_TYPE.GREEN))

repeat (3) {
	PUSH(_v,new Spawn(10,10,210,BLOON_TYPE.GREEN))
}

PUSH(_v,new Spawn(10,8,210,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(10,8,228,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.TATTERED]))
//
global.waves[6] = new Wave(190)
var _v = global.waves[6].list

PUSH(_v,new Spawn(10,46,5,BLOON_TYPE.CYAN))
PUSH(_v,new Spawn(15,36,226,BLOON_TYPE.YELLOW))
PUSH(_v,new Spawn(30,26,102,BLOON_TYPE.BLUE,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[7] = new Wave(265)
var _v = global.waves[7].list

PUSH(_v,new Spawn(10,54,5,BLOON_TYPE.LIME))
PUSH(_v,new Spawn(15,44,254,BLOON_TYPE.PINK))
PUSH(_v,new Spawn(40,15,10,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.REGROW]))
//
global.waves[8] = new Wave(350)
var _v = global.waves[8].list

PUSH(_v,new Spawn(10,25,5,BLOON_TYPE.RED,[BLOON_PROPERTIES.STATIC]))

PUSH(_v,new Spawn(7,15,375,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.STUFFED_ORANGE))
PUSH(_v,new Spawn(6,15,5,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,5,[BLOON_TYPE.ORANGE,BLOON_TYPE.STUFFED_ORANGE],[[BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE]]))

PUSH(_v,new Spawn(6,15,15,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.STUFFED_ORANGE))

PUSH(_v,new Spawn(6,10,10,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.STUFFED_ORANGE))

PUSH(_v,new Spawn(6,15,5,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,15,[BLOON_TYPE.ORANGE,BLOON_TYPE.STUFFED_ORANGE],[[BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE]]))

PUSH(_v,new Spawn(6,15,15,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.STUFFED_ORANGE))

PUSH(_v,new Spawn(6,15,10,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.STUFFED_ORANGE))

PUSH(_v,new Spawn(6,15,5,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,15,[BLOON_TYPE.ORANGE,BLOON_TYPE.STUFFED_ORANGE],[[BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE]]))

PUSH(_v,new Spawn(6,15,15,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.STUFFED_ORANGE))

PUSH(_v,new Spawn(6,15,10,BLOON_TYPE.ORANGE))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.STUFFED_ORANGE))

PUSH(_v,new Spawn(16,15,5,BLOON_TYPE.ORANGE))
//
global.waves[9] = new Wave(347)
var _v = global.waves[9].list

PUSH(_v,new Spawn(20,40,5,BLOON_TYPE.PINK))
PUSH(_v,new Spawn(1,0,36,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(40,40,4,BLOON_TYPE.PINK))
//
global.waves[10] = new Wave(700,0.495)
var _v = global.waves[10].list

PUSH(_v,new Spawn(40,12,5,BLOON_TYPE.ORANGE,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(30,17,132,BLOON_TYPE.CYAN,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(20,22,57,BLOON_TYPE.LIME,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(10,32,132,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.REGROW]))
//
global.waves[11] = new Wave(310)
var _v = global.waves[11].list

PUSH(_v,new Spawn(30,16,5,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,32,[BLOON_TYPE.ORANGE,BLOON_TYPE.STUFFED_ORANGE],[ [BLOON_PROPERTIES.CAMO],[BLOON_PROPERTIES.NONE] ]))

repeat (4) {
	PUSH(_v,new Spawn(2,24,24,BLOON_TYPE.ORANGE,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(1,0,12,BLOON_TYPE.STUFFED_ORANGE))
    PUSH(_v,new Spawn(2,24,12,BLOON_TYPE.ORANGE,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(1,0,24,[BLOON_TYPE.ORANGE,BLOON_TYPE.STUFFED_ORANGE],[ [BLOON_PROPERTIES.CAMO],[BLOON_PROPERTIES.NONE] ]))
}

PUSH(_v,new Spawn(2,24,24,BLOON_TYPE.ORANGE,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(1,0,12,BLOON_TYPE.STUFFED_ORANGE))
PUSH(_v,new Spawn(7,24,12,BLOON_TYPE.ORANGE,[BLOON_PROPERTIES.CAMO]))
//
global.waves[12] = new Wave(425)
var _v = global.waves[12].list

PUSH(_v,new Spawn(20,33,5,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(1,0,169,[BLOON_TYPE.CYAN,BLOON_TYPE.STUFFED_CYAN],[ [BLOON_PROPERTIES.LEAD],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(1,0,35,BLOON_TYPE.CYAN,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(1,0,35,BLOON_TYPE.STUFFED_CYAN))

PUSH(_v,new Spawn(2,55,20,BLOON_TYPE.CYAN,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.STUFFED_CYAN))

PUSH(_v,new Spawn(1,0,40,BLOON_TYPE.CYAN,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(1,0,50,BLOON_TYPE.STUFFED_CYAN))

PUSH(_v,new Spawn(2,55,5,BLOON_TYPE.CYAN,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(1,0,30,BLOON_TYPE.STUFFED_CYAN))

PUSH(_v,new Spawn(8,55,25,BLOON_TYPE.CYAN,[BLOON_PROPERTIES.LEAD]))
//
global.waves[13] = new Wave(1000)
var _v = global.waves[13].list

PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))

repeat (39) {
	PUSH(_v,new Spawn(2,10,10,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.TATTERED]))
    PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))
}

PUSH(_v,new Spawn(2,10,10,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.REGROW]))
//
global.waves[14] = new Wave(280)
var _v = global.waves[14].list

PUSH(_v,new Spawn(10,44,2,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(20,20,183,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.SUPER_SHIELDED]))
//
global.waves[15] = new Wave(1230)
var _v = global.waves[15].list

PUSH(_v,new Spawn(12,4,5,BLOON_TYPE.PURPLE))

repeat (3) {
	PUSH(_v,new Spawn(12,4,156,BLOON_TYPE.PURPLE))
}

PUSH(_v,new Spawn(3,6,252,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(1,0,3,BLOON_TYPE.WHITE))

PUSH(_v,new Spawn(5,6,3,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(1,0,3,BLOON_TYPE.WHITE))

PUSH(_v,new Spawn(4,6,3,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(3,30,9,BLOON_TYPE.WHITE))

PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.STUFFED_LIME))
PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.WHITE))

PUSH(_v,new Spawn(2,20,5,BLOON_TYPE.STUFFED_LIME))
PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.WHITE))

PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.STUFFED_LIME))
PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.WHITE))

PUSH(_v,new Spawn(2,20,5,BLOON_TYPE.STUFFED_LIME))
PUSH(_v,new Spawn(2,30,5,BLOON_TYPE.WHITE))
//
global.waves[16] = new Wave(1420)
var _v = global.waves[16].list

PUSH(_v,new Spawn(1,0,230,BLOON_TYPE.BLACK))

repeat (4) {
	PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.WHITE))
    PUSH(_v,new Spawn(1,0,16,BLOON_TYPE.BLACK))
}

PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(1,0,16,[BLOON_TYPE.BLACK,BLOON_TYPE.STUFFED_LIME],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.STUFFED_LIME))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.STUFFED_LIME))
PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(1,0,16,[BLOON_TYPE.BLACK,BLOON_TYPE.STUFFED_LIME],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.STUFFED_LIME))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.BLACK))
PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.STUFFED_LIME))
PUSH(_v,new Spawn(1,0,16,BLOON_TYPE.WHITE))
PUSH(_v,new Spawn(1,0,14,BLOON_TYPE.BLACK))
//
global.waves[17] = new Wave(778)
var _v = global.waves[17].list

PUSH(_v,new Spawn(30,30,5,BLOON_TYPE.ZEBRA))
PUSH(_v,new Spawn(10,30,226,BLOON_TYPE.NINJA_RED))
//
global.waves[18] = new Wave(1372)
var _v = global.waves[18].list

PUSH(_v,new Spawn(67,6,5,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,4,BLOON_TYPE.PRISMATIC))
PUSH(_v,new Spawn(67,6,2,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.PRISMATIC))
PUSH(_v,new Spawn(66,6,4,BLOON_TYPE.PINK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(10,30,102,BLOON_TYPE.ROBO_RED))
//
global.waves[19] = new Wave(1590)
var _v = global.waves[19].list

PUSH(_v,new Spawn(30,15,5,BLOON_TYPE.GREEN,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,161,BLOON_TYPE.PATROL))
PUSH(_v,new Spawn(3,60,70,BLOON_TYPE.STUFFED_LIME))

repeat (4) {
	PUSH(_v,new Spawn(1,0,30,BLOON_TYPE.CERAMIC))
    PUSH(_v,new Spawn(6,60,30,BLOON_TYPE.STUFFED_LIME))
}

PUSH(_v,new Spawn(1,0,30,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(3,60,30,BLOON_TYPE.STUFFED_LIME))
//
global.waves[20] = new Wave(1050,0.385)
var _v = global.waves[20].list

PUSH(_v,new Spawn(4,16,2,BLOON_TYPE.NINJA_BLUE))

repeat (3) {
	PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.NINJA_BLUE))
	PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.NINJA_BLUE))
    
	PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.NINJA_BLUE))
    
    PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.REGROW]))
	PUSH(_v,new Spawn(1,0,12,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.NINJA_BLUE))
    
    PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.NINJA_BLUE))
}

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.NINJA_BLUE))
PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.REGROW]))

repeat (6) {
	PUSH(_v,new Spawn(1,0,12,BLOON_TYPE.BLACK,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.WHITE,[BLOON_PROPERTIES.REGROW]))
}

PUSH(_v,new Spawn(210,3,231,BLOON_TYPE.RED,[BLOON_PROPERTIES.CAMO,BLOON_PROPERTIES.LEAD]))
//
global.waves[21] = new Wave(2150)
var _v = global.waves[21].list

PUSH(_v,new Spawn(2,8,2,BLOON_TYPE.LIME))

repeat (49) {
    PUSH(_v,new Spawn(1,0,4,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(3,8,4,BLOON_TYPE.LIME))
}

PUSH(_v,new Spawn(1,0,4,BLOON_TYPE.AMBER,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(1,0,4,BLOON_TYPE.LIME))
//
global.waves[22] = new Wave(620)
var _v = global.waves[22].list

PUSH(_v,new Spawn(40,16,2,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(20,25,175,BLOON_TYPE.ZEBRA,[BLOON_PROPERTIES.LEAD]))
//
global.waves[23] = new Wave(2800)
var _v = global.waves[23].list

PUSH(_v,new Spawn(1,0,5,[BLOON_TYPE.RAINBOW,BLOON_TYPE.BARRIER_GREEN],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))

repeat (9) {
	PUSH(_v,new Spawn(4,33,33,BLOON_TYPE.RAINBOW))
    PUSH(_v,new Spawn(1,0,33,[BLOON_TYPE.RAINBOW,BLOON_TYPE.BARRIER_GREEN],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
}

PUSH(_v,new Spawn(4,33,33,BLOON_TYPE.RAINBOW))
//
global.waves[24] = new Wave(2721)
var _v = global.waves[24].list

PUSH(_v,new Spawn(20,60,2,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(25,30,109,BLOON_TYPE.PINK,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,30,[BLOON_TYPE.PINK,BLOON_TYPE.MINI_MOAB],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(4,30,30,BLOON_TYPE.PINK,[BLOON_PROPERTIES.STATIC]))
//
global.waves[25] = new Wave(2514)
var _v = global.waves[25].list

PUSH(_v,new Spawn(8,135,2,BLOON_TYPE.BRICK))
PUSH(_v,new Spawn(40,20,254,BLOON_TYPE.LIME,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(12,37,170,BLOON_TYPE.ROBO_BLUE))
//
global.waves[26] = new Wave(3584)
var _v = global.waves[26].list

PUSH(_v,new Spawn(27,10,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(27,10,159,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(18,12,160,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(18,24,156,BLOON_TYPE.NINJA_BLUE))
//
global.waves[27] = new Wave(9032)
var _v = global.waves[27].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.PRISMATIC))

repeat (23) {
	PUSH(_v,new Spawn(1,0,21,BLOON_TYPE.STUFFED_AMBER))
    PUSH(_v,new Spawn(1,0,27,BLOON_TYPE.PRISMATIC))
}

PUSH(_v,new Spawn(1,0,21,BLOON_TYPE.STUFFED_AMBER))
PUSH(_v,new Spawn(5,90,14,BLOON_TYPE.SPECTRUM))
//
global.waves[28] = new Wave(5783)
var _v = global.waves[28].list

repeat (3) {
	PUSH(_v,new Spawn(1,0,2,[BLOON_TYPE.MINI_MOAB,BLOON_TYPE.CERAMIC],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
    PUSH(_v,new Spawn(7,50,50,BLOON_TYPE.CERAMIC))
    PUSH(_v,new Spawn(1,0,50,[BLOON_TYPE.MINI_MOAB,BLOON_TYPE.CERAMIC],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
}

PUSH(_v,new Spawn(7,50,50,BLOON_TYPE.CERAMIC))
PUSH(_v,new Spawn(1,0,189,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[29] = new Wave(5448)
var _v = global.waves[29].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.PLANETARIUM))
PUSH(_v,new Spawn(1,0,620,[BLOON_TYPE.YELLOW,BLOON_TYPE.MINI_MOAB,BLOON_TYPE.STUFFED_AMBER],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.STUFFED_AMBER))
PUSH(_v,new Spawn(1,0,15,[BLOON_TYPE.YELLOW,BLOON_TYPE.STUFFED_AMBER],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.STUFFED_AMBER))
PUSH(_v,new Spawn(1,0,15,[BLOON_TYPE.YELLOW,BLOON_TYPE.STUFFED_AMBER],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.NONE] ]))

PUSH(_v,new Spawn(7,30,30,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,30,[BLOON_TYPE.YELLOW,BLOON_TYPE.MINI_MOAB],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.NONE] ]))

repeat (5) {
	PUSH(_v,new Spawn(9,30,30,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(1,0,30,[BLOON_TYPE.YELLOW,BLOON_TYPE.MINI_MOAB],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.NONE] ]))
}

PUSH(_v,new Spawn(9,30,30,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(10,30,21,BLOON_TYPE.YELLOW,[BLOON_PROPERTIES.STATIC]))
//
global.waves[30] = new Wave(3004,0.33)
var _v = global.waves[30].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.MOAB))
PUSH(_v,new Spawn(100,5,350,BLOON_TYPE.PINK,[BLOON_PROPERTIES.LEAD,BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(1,0,155,BLOON_TYPE.MOAB))
//
global.waves[31] = new Wave(6432)
var _v = global.waves[31].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.CAMO]))
PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.STUFFED_PURPLE))

repeat (31) {
    PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.REGROW]))
    PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.STUFFED_PURPLE))
}
//
global.waves[32] = new Wave(6192)
var _v = global.waves[32].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.BARRIER_GREEN))

repeat (15) {
    PUSH(_v,new Spawn(1,0,86,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.TATTERED]))
    PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.LEAD]))
    PUSH(_v,new Spawn(1,0,13,BLOON_TYPE.BARRIER_GREEN))
}
//
global.waves[33] = new Wave(6776)
var _v = global.waves[33].list

PUSH(_v,new Spawn(30,15,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(10,30,214,BLOON_TYPE.SPECTRUM))
PUSH(_v,new Spawn(1,0,270,BLOON_TYPE.HTA))
//
global.waves[34] = new Wave(4882)
var _v = global.waves[34].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,17,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))

repeat (5) {
    PUSH(_v,new Spawn(5,32,15,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(1,0,17,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SHIELDED]))
}

PUSH(_v,new Spawn(4,32,15,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,221,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[35] = new Wave(7958)
var _v = global.waves[35].list

PUSH(_v,new Spawn(1,0,2,[BLOON_TYPE.PLANETARIUM,BLOON_TYPE.MOAB],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(1,0,400,[BLOON_TYPE.PLANETARIUM,BLOON_TYPE.MOAB],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(12,40,610,BLOON_TYPE.BARRIER_PINK))
PUSH(_v,new Spawn(2,400,150,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
//
global.waves[36] = new Wave(11790)
var _v = global.waves[36].list

repeat (30) {
    PUSH(_v,new Spawn(1,0,2,[BLOON_TYPE.PINK,BLOON_TYPE.NINJA_GREEN],[ [BLOON_PROPERTIES.CAMO],[BLOON_PROPERTIES.NONE] ]))
    PUSH(_v,new Spawn(12,2,2,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.NINJA_GREEN))
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))
    PUSH(_v,new Spawn(11,2,2,BLOON_TYPE.PINK,[BLOON_PROPERTIES.CAMO]))
}

PUSH(_v,new Spawn(20,45,201,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW]))
PUSH(_v,new Spawn(20,25,245,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SUPER_SHIELDED]))
//
global.waves[37] = new Wave(9138)
var _v = global.waves[37].list

repeat (30) {
    PUSH(_v,new Spawn(1,0,2,[BLOON_TYPE.PINK,BLOON_TYPE.ROBO_PINK],[ [BLOON_PROPERTIES.LEAD],[BLOON_PROPERTIES.NONE] ]))
    PUSH(_v,new Spawn(24,2,2,BLOON_TYPE.PINK,[BLOON_PROPERTIES.LEAD]))
}

PUSH(_v,new Spawn(1,0,251,BLOON_TYPE.BRC))
//
global.waves[38] = new Wave(14190)
var _v = global.waves[38].list

PUSH(_v,new Spawn(30,21,2,BLOON_TYPE.SPECTRUM))
PUSH(_v,new Spawn(5,215,90,BLOON_TYPE.HTA))
//
global.waves[39] = new Wave(10408)
var _v = global.waves[39].list

PUSH(_v,new Spawn(50,11,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,160,BLOON_TYPE.BFB))
PUSH(_v,new Spawn(25,5,800,BLOON_TYPE.PATROL))
PUSH(_v,new Spawn(1,0,430,BLOON_TYPE.ROCKET_BLIMP))
//
global.waves[40] = new Wave(18010,0.22)
var _v = global.waves[40].list

PUSH(_v,new Spawn(200,3,2,BLOON_TYPE.RAINBOW))
PUSH(_v,new Spawn(40,10,46,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,10,[BLOON_TYPE.RAINBOW,BLOON_TYPE.MOAB],[ [BLOON_PROPERTIES.SUPER_SHIELDED],[BLOON_PROPERTIES.SUPER_SHIELDED] ]))
PUSH(_v,new Spawn(9,10,10,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(4,180,90,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
//
global.waves[41] = new Wave(25756)
var _v = global.waves[41].list

PUSH(_v,new Spawn(50,12,2,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,161,[BLOON_TYPE.BRC,BLOON_TYPE.STUFFED_PURPLE],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(8,43,43,BLOON_TYPE.STUFFED_PURPLE))
PUSH(_v,new Spawn(1,0,6,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(16,8,2,BLOON_TYPE.STUFFED_PURPLE))
//
global.waves[42] = new Wave(32552)
var _v = global.waves[42].list

PUSH(_v,new Spawn(17,30,2,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(1,0,19,BLOON_TYPE.BFB))
PUSH(_v,new Spawn(18,30,11,BLOON_TYPE.MINI_MOAB))

repeat (2) {
	PUSH(_v,new Spawn(1,0,19,BLOON_TYPE.BARRIER_PINK))
    PUSH(_v,new Spawn(1,0,11,BLOON_TYPE.MINI_MOAB))
    PUSH(_v,new Spawn(2,20,9,BLOON_TYPE.BARRIER_PINK))
    PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.MINI_MOAB))
}

PUSH(_v,new Spawn(1,0,19,BLOON_TYPE.BARRIER_PINK))
PUSH(_v,new Spawn(1,0,11,BLOON_TYPE.MINI_MOAB))
PUSH(_v,new Spawn(7,20,9,BLOON_TYPE.BARRIER_PINK))
PUSH(_v,new Spawn(1,0,20,[BLOON_TYPE.BARRIER_PINK,BLOON_TYPE.BFB],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(16,20,20,BLOON_TYPE.BARRIER_PINK))
//
global.waves[43] = new Wave(12020)
var _v = global.waves[43].list

PUSH(_v,new Spawn(56,6,2,BLOON_TYPE.RAINBOW,[BLOON_PROPERTIES.CAMO,BLOON_PROPERTIES.LEAD]))
PUSH(_v,new Spawn(0,130,169,BLOON_TYPE.HTA))
PUSH(_v,new Spawn(1,0,289,BLOON_TYPE.PRIMSATIC_HTA))
//
global.waves[44] = new Wave(21600)
var _v = global.waves[44].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.SPECTRUM))

repeat (35) {
	PUSH(_v,new Spawn(1,0,10,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.SUPER_SHIELDED]))
    PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(1,0,15,BLOON_TYPE.SPECTRUM))
}
//
global.waves[45] = new Wave(20740)
var _v = global.waves[45].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(1,0,299,BLOON_TYPE.PLANETARIUM))
PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(3,100,99,BLOON_TYPE.PLANETARIUM))
PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.BRC))
PUSH(_v,new Spawn(1,0,599,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
//
global.waves[46] = new Wave(34384)
var _v = global.waves[46].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.MEGA_BRC))
PUSH(_v,new Spawn(1,0,600,[BLOON_TYPE.MOAB,BLOON_TYPE.NINJA_YELLOW],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))

PUSH(_v,new Spawn(1,0,25,BLOON_TYPE.ROBO_YELLOW))
PUSH(_v,new Spawn(1,0,25,BLOON_TYPE.NINJA_YELLOW))
PUSH(_v,new Spawn(1,0,25,BLOON_TYPE.ROBO_YELLOW))

repeat (14) {
	PUSH(_v,new Spawn(1,0,25,[BLOON_TYPE.MOAB,BLOON_TYPE.NINJA_YELLOW],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
}
//
global.waves[47] = new Wave(23886)
var _v = global.waves[47].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.NINJA_PINK))
PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.ROBO_PINK))

repeat (24) {
    PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
    PUSH(_v,new Spawn(1,0,18,BLOON_TYPE.NINJA_PINK))
    PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
    PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.ROBO_PINK))
}

PUSH(_v,new Spawn(3,60,67,BLOON_TYPE.DDT))
//
global.waves[48] = new Wave(43038)
var _v = global.waves[48].list

PUSH(_v,new Spawn(5,250,2,BLOON_TYPE.PRIMSATIC_HTA))
PUSH(_v,new Spawn(1,0,799,BLOON_TYPE.ZOMG))
//
global.waves[49] = new Wave(37732)
var _v = global.waves[49].list

PUSH(_v,new Spawn(9,35,2,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,19,BLOON_TYPE.LPZ))
PUSH(_v,new Spawn(26,35,16,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,9,BLOON_TYPE.LPZ))
PUSH(_v,new Spawn(5,35,26,BLOON_TYPE.MINI_MOAB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,34,[BLOON_TYPE.PLANETARIUM_2,BLOON_TYPE.PATROL],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(19,5,5,BLOON_TYPE.PATROL))
PUSH(_v,new Spawn(1,0,5,[BLOON_TYPE.PLANETARIUM_2,BLOON_TYPE.PATROL],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(19,5,5,BLOON_TYPE.PATROL))
PUSH(_v,new Spawn(6,100,305,BLOON_TYPE.ROCKET_BLIMP))
//
global.waves[50] = new Wave(46868,0.15)
var _v = global.waves[50].list

PUSH(_v,new Spawn(1,0,2,[BLOON_TYPE.MEGA_BRC,BLOON_TYPE.MOAB],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.SHIELDED] ]))
PUSH(_v,new Spawn(14,70,70,BLOON_TYPE.MOAB,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(1,0,20,BLOON_TYPE.MEGA_BRC))
//
global.waves[51] = new Wave(38160)
var _v = global.waves[51].list

PUSH(_v,new Spawn(1,0,2,[BLOON_TYPE.BRICK,BLOON_TYPE.PLANETARIUM_2],[ [BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED],[BLOON_PROPERTIES.NONE] ]))
PUSH(_v,new Spawn(17,9,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,7,BLOON_TYPE.PLANETARIUM_2))
PUSH(_v,new Spawn(18,9,2,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,5,BLOON_TYPE.PLANETARIUM_2))
PUSH(_v,new Spawn(18,9,4,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,3,BLOON_TYPE.PLANETARIUM_2))
PUSH(_v,new Spawn(18,9,6,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,1,BLOON_TYPE.PLANETARIUM_2))
PUSH(_v,new Spawn(17,9,8,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
PUSH(_v,new Spawn(1,0,8,BLOON_TYPE.PLANETARIUM_2))
PUSH(_v,new Spawn(31,9,8,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.REGROW,BLOON_PROPERTIES.TATTERED]))
//
global.waves[52] = new Wave(64108)
var _v = global.waves[52].list

PUSH(_v,new Spawn(10,175,2,BLOON_TYPE.PRIMSATIC_HTA))
PUSH(_v,new Spawn(3,250,674,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
//
global.waves[53] = new Wave(52522)
var _v = global.waves[53].list

PUSH(_v,new Spawn(2,500,2,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(1,0,499,BLOON_TYPE.DEADLY_DDT))
PUSH(_v,new Spawn(1,0,500,BLOON_TYPE.NINJA_PINK))

PUSH(_v,new Spawn(1,0,11,[BLOON_TYPE.NINJA_PINK,BLOON_TYPE.ROBO_PINK],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))

repeat (98) {
	PUSH(_v,new Spawn(1,0,11,[BLOON_TYPE.NINJA_PINK,BLOON_TYPE.ROBO_PINK],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
}

PUSH(_v,new Spawn(1,0,11,BLOON_TYPE.ROBO_PINK))
//
global.waves[54] = new Wave(44164,0.11)
var _v = global.waves[54].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.STORM_LPZ))
PUSH(_v,new Spawn(5,10,599,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
PUSH(_v,new Spawn(1,0,10,[BLOON_TYPE.CERAMIC,BLOON_TYPE.BFB],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.NONE] ]))

repeat (5) {
    PUSH(_v,new Spawn(14,10,10,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
    PUSH(_v,new Spawn(1,0,10,[BLOON_TYPE.CERAMIC,BLOON_TYPE.BFB],[ [BLOON_PROPERTIES.STATIC],[BLOON_PROPERTIES.NONE] ]))
}

PUSH(_v,new Spawn(19,10,10,BLOON_TYPE.CERAMIC,[BLOON_PROPERTIES.STATIC]))
//
global.waves[55] = new Wave(85264)
var _v = global.waves[55].list

PUSH(_v,new Spawn(2,400,2,BLOON_TYPE.ZOMG))
PUSH(_v,new Spawn(1,0,749,BLOON_TYPE.ZOMG,[BLOON_PROPERTIES.SHIELDED]))
PUSH(_v,new Spawn(80,4,650,BLOON_TYPE.SPECTRUM))
//
global.waves[56] = new Wave(70692)
var _v = global.waves[56].list

PUSH(_v,new Spawn(9,12,2,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,3,BLOON_TYPE.MEGA_BRC))
PUSH(_v,new Spawn(50,12,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,3,BLOON_TYPE.MEGA_BRC))
PUSH(_v,new Spawn(50,12,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,3,BLOON_TYPE.MEGA_BRC))
PUSH(_v,new Spawn(11,12,9,BLOON_TYPE.BRICK,[BLOON_PROPERTIES.SUPER_SHIELDED]))
//
global.waves[57] = new Wave(131916)
var _v = global.waves[57].list

PUSH(_v,new Spawn(20,95,2,BLOON_TYPE.PRIMSATIC_HTA))
PUSH(_v,new Spawn(1,0,44,[BLOON_TYPE.ROCKET_BLIMP,BLOON_TYPE.PATROL],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))

repeat (7) {
    PUSH(_v,new Spawn(9,5,5,BLOON_TYPE.PATROL))
    PUSH(_v,new Spawn(1,0,5,[BLOON_TYPE.ROCKET_BLIMP,BLOON_TYPE.PATROL],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
}

PUSH(_v,new Spawn(9,5,5,BLOON_TYPE.PATROL))
PUSH(_v,new Spawn(10,50,5,BLOON_TYPE.ROCKET_BLIMP))
//
global.waves[58] = new Wave(52260)
var _v = global.waves[58].list

PUSH(_v,new Spawn(1,0,2,BLOON_TYPE.ZOMG,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(2,450,749,BLOON_TYPE.DEADLY_DDT))

PUSH(_v,new Spawn(1,0,414,[BLOON_TYPE.NINJA_RAINBOW,BLOON_TYPE.ROBO_RAINBOW],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))

repeat (59) {
    PUSH(_v,new Spawn(1,0,20,[BLOON_TYPE.NINJA_RAINBOW,BLOON_TYPE.ROBO_RAINBOW],[ [BLOON_PROPERTIES.NONE],[BLOON_PROPERTIES.NONE] ]))
}
//
global.waves[59] = new Wave(66654)
var _v = global.waves[59].list

PUSH(_v,new Spawn(1,0,51,BLOON_TYPE.PARTY_BLIMP))
PUSH(_v,new Spawn(1,0,1050,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,250,BLOON_TYPE.STORM_LPZ))
PUSH(_v,new Spawn(2,300,50,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
PUSH(_v,new Spawn(1,0,250,BLOON_TYPE.STORM_LPZ))
PUSH(_v,new Spawn(2,300,50,BLOON_TYPE.BFB,[BLOON_PROPERTIES.SUPER_SHIELDED]))
//
#endregion



/*
var _json = json_stringify(global.waves,true)

var _buff = buffer_create(1024,buffer_grow,1)
buffer_write(_buff,buffer_text,_json)
buffer_save(_buff,get_save_filename("","waves.json"))
buffer_delete(_buff)
*/

/*
var _html = ""
var _curr_multiplier = 1
for (var i = 0; i < array_length(global.waves); i++) {
	var _wave = global.waves[i]
    
    if variable_struct_exists(_wave,"cash_flow")
        _curr_multiplier = _wave.cash_flow
    
    var _cash = _wave.reward * _curr_multiplier + ( 99 + (i+2) )

    _html+="\n{| class=\"mw-collapsible mw-collapsed wikitable\" style=\"width: 100%;\""
    _html+=$"\n! WAVE {i+1}  ({floor(_cash)}$)"
    _html+="\n\n|-\n|"
    _html+="\n\n{| class=\"wikitable\" style=\"width:100%; text-align:center; width: 100%;\""
    _html+="\n! Count !! Bloon !! Start Time !! Spawn Interval"
    
    var _num = array_length(_wave.list)
    
    for (var p = 0; p < _num; p++) {
    	var _data = _wave.list[p]
        var _bloon = _data.bloons
        var _props = _data.properties
        var _bloon_icon = ""
        var _bloon_name = ""
        
        show_debug_message($" {i} | {_bloon} | {_props}")
        
        if is_array(_bloon){
            for (var l = 0; l < array_length(_bloon); l++) {
                var _nm = getIconName(_bloon[l],_props[l])
                _bloon_name += _nm[1] + " " + _nm[0]
                if l < array_length(_bloon)-1{
                    _bloon_name += " | "
                }
            }
        }
        else {
            var _nm = getIconName(_bloon,_props)
            _bloon_name = _nm[1] + " " + _nm[0]
        }
        
        _html+="\n|-"
        _html+=$"\n| {_data.number} || {_bloon_name} || {_data.start_interval}f ({_data.start_interval/30}s) ||  {_data.interval}f ({_data.interval/30}s)"
        
    }
    
    _html+="\n|}\n|}"
}

clipboard_set_text(_html)
show_message("copied data!")

game_end()

/*