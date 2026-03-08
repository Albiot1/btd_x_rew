function scr_upgrades_initialize(){
    
    enum PATH_UPGR_TYPE {
        MAIN,
        LEFT,
        MIDDLE,
        RIGHT
    }
    
    #macro UPGRADE_MAIN_COLOR #ffffc0
    #macro UPGRADE_LEFT_COLOR #ff9c75
    #macro UPGRADE_MIDDLE_COLOR #9ce675
    #macro UPGRADE_RIGHT_COLOR #9c9cd8
    
    #macro UPGRADE_SPECIAL_COLOR_I #ff9cd8
    #macro UPGRADE_SPECIAL_COLOR_II #ff9c2b
    #macro UPGRADE_SPECIAL_COLOR_III #ffff47
    

    Upgrade = function(_icon,_tower_id,_upgrade_id,_unlocked = false) constructor {
        icon = _icon
        name = scr_get_upgrade_name(_tower_id,_upgrade_id)
        desc = scr_get_upgrade_desc(_tower_id,_upgrade_id)
        
        unlocked = _unlocked
        unlock_rank = 0
        unlock_cost = 0
        
        static SetUnlockCost = function (_rank,_bloonpoints){
            unlock_rank = _rank
            unlock_cost = _bloonpoints
            
            return self
        }
        static SetUpgradeData = function (_price,_object_change){
            upgr_cost = _price
            upgr_obj = _object_change
            
            return self
        }
    }
    
    SpecialPath = function (_path_type,_path_color) constructor {
        replaces = _path_type
        color = _path_color
        beaten = false
        switched = false
        
        bounty_tier = 0
        bounty_type = undefined
        
        static SetBounty = function (_bounty_type,_bounty_tier){
            bounty_tier = _bounty_tier-1
            bounty_type = _bounty_type
            
            return self
        }
    }
    
    global.upgrades = {
        translation: {},
    }
    
    if file_exists("data/upgrades_translation.json"){
        global.upgrades.translation = load_json( "data/upgrades_translation.json" )
    }
    
    #region DART MONKEY
    var _mid = "dart_monkey"
    global.upgrades.dart_monkey = {}
    var _dmkey = global.upgrades.dart_monkey
    
    _dmkey.main_0 = new Upgrade(spr_dart_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(120,undefined)
    _dmkey.main_1 = new Upgrade(spr_dart_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(180,undefined)
    _dmkey.left_0 = new Upgrade(spr_dart_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(200,undefined)
    _dmkey.left_1 = new Upgrade(spr_dart_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(500,undefined)
        .SetUnlockCost(16,2)
    _dmkey.left_2 = new Upgrade(spr_dart_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(2250,undefined)
        .SetUnlockCost(40,5)
    _dmkey.middle_0 = new Upgrade(spr_dart_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(500,undefined)
    _dmkey.middle_1 = new Upgrade(spr_dart_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(1_350,undefined)
        .SetUnlockCost(16,3)
    _dmkey.middle_2 = new Upgrade(spr_dart_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(3_500,undefined)
    _dmkey.right_0 = new Upgrade(spr_dart_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(400,undefined)
    _dmkey.right_1 = new Upgrade(spr_dart_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(750,undefined)
        .SetUnlockCost(16,2)
    _dmkey.right_2 = new Upgrade(spr_dart_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(7_500,undefined)
        .SetUnlockCost(40,7)
    _dmkey.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("mighty_moab",1)
    _dmkey.special_0 = new Upgrade(spr_dart_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(950,undefined)
    _dmkey.special_1 = new Upgrade(spr_dart_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(3_300,undefined)
        .SetUnlockCost(16,15)
    _dmkey.special_2 = new Upgrade(spr_dart_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(9_500,undefined)
        .SetUnlockCost(40,25)
    #endregion
    
    #region TACK SHOOTER
    _mid = "tack_shooter"
    global.upgrades.tack_shooter = {}
    var _tcksh = global.upgrades.tack_shooter
    
    _tcksh.main_0 = new Upgrade(spr_tack_shooter_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(130,undefined)
    _tcksh.main_1 = new Upgrade(spr_tack_shooter_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(230,undefined)
    _tcksh.left_0 = new Upgrade(spr_tack_shooter_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(550,undefined)
    _tcksh.left_1 = new Upgrade(spr_tack_shooter_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(1_200,undefined)
        .SetUnlockCost(17,2)
    _tcksh.left_2 = new Upgrade(spr_tack_shooter_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(3_500,undefined)
        .SetUnlockCost(41,5)
    _tcksh.middle_0 = new Upgrade(spr_tack_shooter_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(600,undefined)
    _tcksh.middle_1 = new Upgrade(spr_tack_shooter_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(1_500,undefined)
        .SetUnlockCost(17,3)
    _tcksh.middle_2 = new Upgrade(spr_tack_shooter_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(5_000,undefined)
        .SetUnlockCost(41,7)
    _tcksh.right_0 = new Upgrade(spr_tack_shooter_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(500,undefined)
    _tcksh.right_1 = new Upgrade(spr_tack_shooter_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(2_300,undefined)
        .SetUnlockCost(17,3)
    _tcksh.right_2 = new Upgrade(spr_tack_shooter_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(6_500,undefined)
        .SetUnlockCost(41,7)
    _tcksh.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("ufo_bloon",2)
    _tcksh.special_0 = new Upgrade(spr_tack_shooter_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(2_200,undefined)
    _tcksh.special_1 = new Upgrade(spr_tack_shooter_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(5_900,undefined)
        .SetUnlockCost(17,15)
    _tcksh.special_2 = new Upgrade(spr_tack_shooter_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(14_400,undefined)
        .SetUnlockCost(41,25)
    #endregion
    
    #region BOOMERANG MONKEY
    _mid = "boomerang_thrower"
    global.upgrades.boomerang_thrower = {}
    var _bmthr = global.upgrades.boomerang_thrower
    
    _bmthr.main_0 = new Upgrade(spr_boomerang_thrower_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(200,undefined)
    _bmthr.main_1 = new Upgrade(spr_boomerang_thrower_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(330,undefined)
    _bmthr.left_0 = new Upgrade(spr_boomerang_thrower_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(800,undefined)
    _bmthr.left_1 = new Upgrade(spr_boomerang_thrower_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(2_000,undefined)
        .SetUnlockCost(18,3)
    _bmthr.left_2 = new Upgrade(spr_boomerang_thrower_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(4_000,undefined)
        .SetUnlockCost(42,7)
    _bmthr.middle_0 = new Upgrade(spr_boomerang_thrower_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1_200,undefined)
    _bmthr.middle_1 = new Upgrade(spr_boomerang_thrower_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(2_700,undefined)
        .SetUnlockCost(18,3)
    _bmthr.middle_2 = new Upgrade(spr_boomerang_thrower_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(7_500,undefined)
        .SetUnlockCost(42,7)
    _bmthr.right_0 = new Upgrade(spr_boomerang_thrower_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_400,undefined)
    _bmthr.right_1 = new Upgrade(spr_boomerang_thrower_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(2_100,undefined)
        .SetUnlockCost(18,3)
    _bmthr.right_2 = new Upgrade(spr_boomerang_thrower_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(5_400,undefined)
        .SetUnlockCost(42,7)
    _bmthr.special_path = new SpecialPath(PATH_UPGR_TYPE.LEFT,UPGRADE_SPECIAL_COLOR_II)
        .SetBounty("blooming_bloon",2)
    _bmthr.special_0 = new Upgrade(spr_boomerang_thrower_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(1_900,undefined)
    _bmthr.special_1 = new Upgrade(spr_boomerang_thrower_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(5_550,undefined)
        .SetUnlockCost(18,15)
    _bmthr.special_2 = new Upgrade(spr_boomerang_thrower_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(17_000,undefined)
        .SetUnlockCost(42,25)
    #endregion
    
    #region SNIPER MONKEY
    _mid = "sniper_monkey"
    global.upgrades.sniper_monkey = {}
    var _snimk = global.upgrades.sniper_monkey
    
    _snimk.main_0 = new Upgrade(spr_sniper_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(500,undefined)
    _snimk.main_1 = new Upgrade(spr_sniper_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(1_200,undefined)
    _snimk.left_0 = new Upgrade(spr_sniper_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(1_200,undefined)
    _snimk.left_1 = new Upgrade(spr_sniper_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(3_300,undefined)
        .SetUnlockCost(19,4)
    _snimk.left_2 = new Upgrade(spr_sniper_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(7_500,undefined)
        .SetUnlockCost(43,7)
    _snimk.middle_0 = new Upgrade(spr_sniper_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(3_000,undefined)
    _snimk.middle_1 = new Upgrade(spr_sniper_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(6_350,undefined)
        .SetUnlockCost(19,5)
    _snimk.middle_2 = new Upgrade(spr_sniper_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(15_500,undefined)
        .SetUnlockCost(43,11)
    _snimk.right_0 = new Upgrade(spr_sniper_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(3_300,undefined)
    _snimk.right_1 = new Upgrade(spr_sniper_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(5_700,undefined)
        .SetUnlockCost(19,4)
    _snimk.right_2 = new Upgrade(spr_sniper_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(12_500,undefined)
        .SetUnlockCost(43,11)
    _snimk.special_path = new SpecialPath(PATH_UPGR_TYPE.LEFT,UPGRADE_SPECIAL_COLOR_II)
        .SetBounty("big_bully",1)
    _snimk.special_0 = new Upgrade(spr_sniper_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(2_100,undefined)
    _snimk.special_1 = new Upgrade(spr_sniper_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(5_900,undefined)
        .SetUnlockCost(19,15)
    _snimk.special_2 = new Upgrade(spr_sniper_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(27_000,undefined)
        .SetUnlockCost(43,25)
        
    #endregion
    
    #region NINJA MONKEY
    _mid = "ninja_monkey"
    global.upgrades.ninja_monkey = {}
    var _ninjm = global.upgrades.ninja_monkey
    
    _ninjm.main_0 = new Upgrade(spr_ninja_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(370,undefined)
    _ninjm.main_1 = new Upgrade(spr_ninja_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(480,undefined)
    _ninjm.left_0 = new Upgrade(spr_ninja_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(500,undefined)
    _ninjm.left_1 = new Upgrade(spr_ninja_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(2_100,undefined)
        .SetUnlockCost(20,3)
    _ninjm.left_2 = new Upgrade(spr_ninja_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(3_800,undefined)
        .SetUnlockCost(44,7)
    _ninjm.middle_0 = new Upgrade(spr_ninja_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1_050,undefined)
    _ninjm.middle_1 = new Upgrade(spr_ninja_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(3_000,undefined)
        .SetUnlockCost(20,4)
    _ninjm.middle_2 = new Upgrade(spr_ninja_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(14_000,undefined)
        .SetUnlockCost(44,9)
    _ninjm.right_0 = new Upgrade(spr_ninja_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_050,undefined)
    _ninjm.right_1 = new Upgrade(spr_ninja_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(1_900,undefined)
        .SetUnlockCost(20,3)
    _ninjm.right_2 = new Upgrade(spr_ninja_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(8_100,undefined)
        .SetUnlockCost(44,7)
    _ninjm.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("mother",2)
    _ninjm.special_0 = new Upgrade(spr_ninja_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(1_600,undefined)
    _ninjm.special_1 = new Upgrade(spr_ninja_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(2_900,undefined)
        .SetUnlockCost(20,15)
    _ninjm.special_2 = new Upgrade(spr_ninja_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(22_900,undefined)
        .SetUnlockCost(44,25)
    #endregion
    
    #region BOMB TOWER
    _mid = "bomb_tower"
    global.upgrades.bomb_tower = {}
    var _bombt = global.upgrades.bomb_tower
    
    _bombt.main_0 = new Upgrade(spr_bomb_tower_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(450,undefined)
    _bombt.main_1 = new Upgrade(spr_bomb_tower_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(400,undefined)
    _bombt.left_0 = new Upgrade(spr_bomb_tower_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(900,undefined)
    _bombt.left_1 = new Upgrade(spr_bomb_tower_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(1_400,undefined)
        .SetUpgradeData(21,2)
    _bombt.left_2 = new Upgrade(spr_bomb_tower_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(6_500,undefined)
        .SetUnlockCost(45,7)
    _bombt.midddle_0 = new Upgrade(spr_bomb_tower_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(800,undefined)
    _bombt.midddle_1 = new Upgrade(spr_bomb_tower_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(3_200,undefined)
        .SetUnlockCost(21,4)
    _bombt.midddle_2 = new Upgrade(spr_bomb_tower_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(9_900,undefined)
        .SetUnlockCost(45,7)
    _bombt.right_0 = new Upgrade(spr_bomb_tower_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(700,undefined)
    _bombt.right_1 = new Upgrade(spr_bomb_tower_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(3_000,undefined)
        .SetUnlockCost(21,4)
    _bombt.right_2 = new Upgrade(spr_bomb_tower_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(7_500,undefined)
        .SetUnlockCost(45,9)
    _bombt.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("super_bloon",2)
    _bombt.special_0 = new Upgrade(spr_bomb_tower_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(1_500,undefined)
    _bombt.special_1 = new Upgrade(spr_bomb_tower_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(6_300,undefined)
        .SetUnlockCost(21,15)
    _bombt.special_2 = new Upgrade(spr_bomb_tower_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(31_000,undefined)
        .SetUnlockCost(45,25)
    #endregion
    
    #region SUB MONKEY
    _mid = "sub_monkey"
    global.upgrades.sub_monkey = {}
    var _subm = global.upgrades.sub_monkey
    
    _subm.main_0 = new Upgrade(spr_sub_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(330,undefined)
    _subm.main_1 = new Upgrade(spr_sub_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(440,undefined)
    _subm.left_0 = new Upgrade(spr_sub_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(950,undefined)
    _subm.left_1 = new Upgrade(spr_sub_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(2_400,undefined)
        .SetUnlockCost(22,3)
    _subm.left_2 = new Upgrade(spr_sub_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(10_000,undefined)
        .SetUnlockCost(46,9)
    _subm.middle_0 = new Upgrade(spr_sub_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1_000,undefined)
    _subm.middle_1 = new Upgrade(spr_sub_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(2_500,undefined)
        .SetUnlockCost(22,4)
    _subm.middle_2 = new Upgrade(spr_sub_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(7_500,undefined)
        .SetUnlockCost(46,9)
    _subm.right_0 = new Upgrade(spr_sub_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(900,undefined)
    _subm.right_1 = new Upgrade(spr_sub_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(2_100,undefined)
        .SetUnlockCost(22,3)
    _subm.right_2 = new Upgrade(spr_sub_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(19_000,undefined)
        .SetUnlockCost(46,11)
    _subm.special_path = new SpecialPath(PATH_UPGR_TYPE.LEFT,UPGRADE_SPECIAL_COLOR_II)
        .SetBounty("clown_bloon",1)
    _subm.special_0 = new Upgrade(spr_sub_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(2_300,undefined)
    _subm.special_1 = new Upgrade(spr_sub_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(6_500,undefined)
        .SetUnlockCost(22,15)
    _subm.special_2 = new Upgrade(spr_sub_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(23_000,undefined)
        .SetUnlockCost(46,25)
    #endregion
    
    #region CHARGE TOWER
    _mid = "charge_tower"
    global.upgrades.charge_tower = {}
    var _chart = global.upgrades.charge_tower
    
    _chart.main_0 = new Upgrade(spr_charge_tower_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(220,undefined)
    _chart.main_1 = new Upgrade(spr_charge_tower_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(330,undefined)
    _chart.left_0 = new Upgrade(spr_charge_tower_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(750,undefined)
    _chart.left_1 = new Upgrade(spr_charge_tower_upgrade_l_1,_mid,"left_1")
        .SetUpgradeData(1_500,undefined)
        .SetUnlockCost(23,3)
    _chart.left_2 = new Upgrade(spr_charge_tower_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(3_000,undefined)
        .SetUnlockCost(47,7)
    _chart.middle_0 = new Upgrade(spr_charge_tower_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1_100,undefined)
    _chart.middle_1 = new Upgrade(spr_charge_tower_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(3_400,undefined)
        .SetUnlockCost(23,4)
    _chart.middle_2 = new Upgrade(spr_charge_tower_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(13_500,undefined)
        .SetUnlockCost(47,9)
    _chart.righ_0 = new Upgrade(spr_charge_tower_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_150,undefined)
    _chart.righ_1 = new Upgrade(spr_charge_tower_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(2_700,undefined)
        .SetUnlockCost(23,4)
    _chart.righ_2 = new Upgrade(spr_charge_tower_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(10_300,undefined)
        .SetUnlockCost(47,9)
    _chart.special_path = new SpecialPath(PATH_UPGR_TYPE.LEFT,UPGRADE_SPECIAL_COLOR_II)
        .SetBounty("annoying_bloon",2)
    _chart.special_0 = new Upgrade(spr_charge_tower_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(1_250,undefined)
    _chart.special_1 = new Upgrade(spr_charge_tower_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(7_000,undefined)
        .SetUnlockCost(23,15)
    _chart.special_2 = new Upgrade(spr_charge_tower_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(21_500,undefined)
        .SetUnlockCost(47,25)
    #endregion
    
    #region GLUE GUNNER
    _mid = "glue_gunner"
    global.upgrades.glue_gunner = {}
    var _glueg = global.upgrades.glue_gunner
    
    _glueg.main_0 = new Upgrade(spr_glue_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(240,undefined)
    _glueg.main_1 = new Upgrade(spr_glue_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(300,undefined)
    _glueg.left_0 = new Upgrade(spr_glue_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(1_500,undefined)
    _glueg.left_1 = new Upgrade(spr_glue_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(2_500,undefined)
        .SetUnlockCost(24,4)
    _glueg.left_2 = new Upgrade(spr_glue_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(6_500,undefined)
        .SetUnlockCost(48,0)
    _glueg.middle_0 = new Upgrade(spr_glue_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1_800,undefined)
    _glueg.middle_1 = new Upgrade(spr_glue_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(6_000,undefined)
        .SetUnlockCost(24,5)
    _glueg.middle_2 = new Upgrade(spr_glue_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(16_000,undefined)
        .SetUnlockCost(48,11)
    _glueg.right_0 = new Upgrade(spr_glue_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(2_000,undefined)
    _glueg.right_1 = new Upgrade(spr_glue_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(5_000,undefined)
        .SetUnlockCost(24,4)
    _glueg.right_2 = new Upgrade(spr_glue_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(6_600,undefined)
        .SetUnlockCost(48,9)
    _glueg.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("blooming_bloon",1)
    _glueg.special_0 = new Upgrade(spr_glue_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(2_600,undefined)
    _glueg.special_1 = new Upgrade(spr_glue_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(9_000,undefined)
        .SetUnlockCost(24,15)
    _glueg.special_2 = new Upgrade(spr_glue_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(28_000,undefined)
        .SetUnlockCost(48,25)
    #endregion
    
    #region ICE MONKEY
    _mid = "ice_monkey"
    global.upgrades.ice_monkey = {}
    var _icemo = global.upgrades.ice_monkey
    
    _icemo.main_0 = new Upgrade(spr_ice_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(350,undefined)
    _icemo.main_1 = new Upgrade(spr_ice_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(250,undefined)
    _icemo.left_0 = new Upgrade(spr_ice_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(550,undefined)
    _icemo.left_1 = new Upgrade(spr_ice_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(1_500,undefined)
        .SetUnlockCost(25,3)
    _icemo.left_2 = new Upgrade(spr_ice_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(4_500,undefined)
        .SetUnlockCost(49,9)
    _icemo.middle_0 = new Upgrade(spr_ice_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(2_700,undefined)
    _icemo.middle_1 = new Upgrade(spr_ice_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(5_400,undefined)
        .SetUnlockCost(25,5)
    _icemo.middle_2 = new Upgrade(spr_ice_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(21_000,undefined)
        .SetUnlockCost(49,13)
    _icemo.right_0 = new Upgrade(spr_ice_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(500,undefined)
    _icemo.right_1 = new Upgrade(spr_ice_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(2_750,undefined)
        .SetUnlockCost(25,3)
    _icemo.right_2 = new Upgrade(spr_ice_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(5_500,undefined)
        .SetUnlockCost(49,11)
    _icemo.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("blooming_bloon",2)
    _icemo.special_0 = new Upgrade(spr_ice_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(3_100,undefined)
    _icemo.special_1 = new Upgrade(spr_ice_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(10_100,undefined)
        .SetUnlockCost(25,15)
    _icemo.special_2 = new Upgrade(spr_ice_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(41_000,undefined)
        .SetUnlockCost(49,25)
    #endregion
    
    #region BUCCANEER
    _mid = "buccaneer"
    global.upgrades.buccaneer = {}
    var _buccn = global.upgrades.buccaneer
    
    _buccn.main_0 = new Upgrade(spr_buccaneer_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(450,undefined)
    _buccn.main_1 = new Upgrade(spr_buccaneer_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(350,undefined)
    _buccn.left_0 = new Upgrade(spr_buccaneer_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(900,undefined)
    _buccn.left_1 = new Upgrade(spr_buccaneer_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(1_800,undefined)
        .SetUnlockCost(26,3)
    _buccn.left_2 = new Upgrade(spr_buccaneer_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(6_500,undefined)
        .SetUnlockCost(50,7)
    _buccn.middle_0 = new Upgrade(spr_buccaneer_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(2_200,undefined)
    _buccn.middle_1 = new Upgrade(spr_buccaneer_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(4_200,undefined)
        .SetUnlockCost(26,4)
    _buccn.middle_2 = new Upgrade(spr_buccaneer_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(14_000,undefined)
        .SetUnlockCost(50,11)
    _buccn.right_0 = new Upgrade(spr_buccaneer_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_000,undefined)
    _buccn.right_1 = new Upgrade(spr_buccaneer_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(2_100,undefined)
        .SetUnlockCost(26,3)
    _buccn.right_2 = new Upgrade(spr_buccaneer_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(9_100,undefined)
        .SetUnlockCost(50,9)
    _buccn.special_path = new SpecialPath(PATH_UPGR_TYPE.LEFT,UPGRADE_SPECIAL_COLOR_II)
        .SetBounty("clown_bloon",2)
    _buccn.special_0 = new Upgrade(spr_buccaneer_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(2_400,undefined)
    _buccn.special_1 = new Upgrade(spr_buccaneer_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(6_000,undefined)
        .SetUnlockCost(26,15)
    _buccn.special_2 = new Upgrade(spr_buccaneer_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(24_000,undefined)
        .SetUnlockCost(50,25)
    #endregion
    
    #region ENGINEER
    _mid = "engineer"
    global.upgrades.engineer = {}
    var _engin = global.upgrades.engineer
    
    _engin.main_0 = new Upgrade(spr_engineer_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(530,undefined)
    _engin.main_1 = new Upgrade(spr_engineer_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(350,undefined)
    _engin.left_0 = new Upgrade(spr_engineer_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(750,undefined)
    _engin.left_1 = new Upgrade(spr_engineer_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(2_500,undefined)
        .SetUnlockCost(27,3)
    _engin.left_2 = new Upgrade(spr_engineer_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(5_000,undefined)
        .SetUnlockCost(51,7)
    _engin.middle_0 = new Upgrade(spr_engineer_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(550,undefined)
    _engin.middle_1 = new Upgrade(spr_engineer_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(1_200,undefined)
        .SetUnlockCost(27,2)
    _engin.middle_2 = new Upgrade(spr_engineer_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(12_000,undefined)
        .SetUnlockCost(51,9)
    _engin.right_0 = new Upgrade(spr_engineer_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_100,undefined)
    _engin.right_1 = new Upgrade(spr_engineer_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(3_500,undefined)
        .SetUnlockCost(27,3)
    _engin.right_2 = new Upgrade(spr_engineer_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(7_500,undefined)
        .SetUnlockCost(51,9)
    _engin.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("ufo_bloon",3)
    _engin.special_0 = new Upgrade(spr_engineer_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(1_800,undefined)
    _engin.special_1 = new Upgrade(spr_engineer_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(13_500,undefined)
        .SetUnlockCost(27,15)
    _engin.special_2 = new Upgrade(spr_engineer_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(27_000,undefined)
        .SetUnlockCost(51,25)
    #endregion
    
    #region ACE MONKEY
    _mid = "ace_monkey"
    global.upgrades.ace_monkey = {}
    var _acemon = global.upgrades.ace_monkey
    
    _acemon.main_0 = new Upgrade(spr_ace_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(440,undefined)
    _acemon.main_1 = new Upgrade(spr_ace_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(500,undefined)
    _acemon.left_0 = new Upgrade(spr_ace_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(900,undefined)
    _acemon.left_1 = new Upgrade(spr_ace_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(3_300,undefined)
        .SetUnlockCost(28,3)
    _acemon.left_2 = new Upgrade(spr_ace_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(12_500,undefined)
        .SetUnlockCost(52,9)
    _acemon.middle_0 = new Upgrade(spr_ace_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(2_800,undefined)
    _acemon.middle_1 = new Upgrade(spr_ace_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(4_500,undefined)
        .SetUnlockCost(28,5)
    _acemon.middle_2 = new Upgrade(spr_ace_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(19_000,undefined)
        .SetUnlockCost(52,11)
    _acemon.right_0 = new Upgrade(spr_ace_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(2_500,undefined)
    _acemon.right_1 = new Upgrade(spr_ace_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(4_500,undefined)
        .SetUnlockCost(28,4)
    _acemon.right_2 = new Upgrade(spr_ace_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(16_000,undefined)
        .SetUnlockCost(52,11)
    _acemon.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("horror_bloon",1) //prison break
    _acemon.special_0 = new Upgrade(spr_ace_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(3_600,undefined)
    _acemon.special_1 = new Upgrade(spr_ace_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(6_500,undefined)
        .SetUnlockCost(28,15)
    _acemon.special_2 = new Upgrade(spr_ace_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(36_000,undefined)
        .SetUnlockCost(52,25)
    #endregion
    
    #region BLOONCHIPPER
    _mid = "bloonchipper"
    global.upgrades.bloonchipper = {}
    var _chipper = global.upgrades.bloonchipper
    
    _chipper.main_0 = new Upgrade(spr_bloonchipper_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(400,undefined)
    _chipper.main_1 = new Upgrade(spr_bloonchipper_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(400,undefined)
    _chipper.left_0 = new Upgrade(spr_bloonchipper_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(1_600,undefined)
    _chipper.left_1 = new Upgrade(spr_bloonchipper_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(3_600,undefined)
        .SetUnlockCost(29,4)
    _chipper.left_2 = new Upgrade(spr_bloonchipper_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(9_000,undefined)
        .SetUnlockCost(53,9)
    _chipper.middle_0 = new Upgrade(spr_bloonchipper_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1_200,undefined)
    _chipper.middle_1 = new Upgrade(spr_bloonchipper_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(3_300,undefined)
        .SetUnlockCost(29,4)
    _chipper.middle_2 = new Upgrade(spr_bloonchipper_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(12_500,undefined)
        .SetUnlockCost(53,11)
    _chipper.right_0 = new Upgrade(spr_bloonchipper_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_800,undefined)
    _chipper.right_1 = new Upgrade(spr_bloonchipper_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(3_200,undefined)
        .SetUnlockCost(29,4)
    _chipper.right_2 = new Upgrade(spr_bloonchipper_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(8_500,undefined)
        .SetUnlockCost(53,9)
    _chipper.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("track_crawler",1)
    _chipper.special_0 = new Upgrade(spr_bloonchipper_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(4_500,undefined)
    _chipper.special_1 = new Upgrade(spr_bloonchipper_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(12_000,undefined)
        .SetUnlockCost(29,15)
    _chipper.special_2 = new Upgrade(spr_bloonchipper_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(40_000,undefined)
        .SetUnlockCost(53,25)
    #endregion
    
    #region ALCHEMIST
    _mid = "alchemist_monkey"
    global.upgrades.alchemist_monkey = {}
    var _alch = global.upgrades.alchemist_monkey
    
    _alch.main_0 = new Upgrade(spr_alchemist_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(600,undefined)
    _alch.main_1 = new Upgrade(spr_alchemist_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(430,undefined)
    _alch.left_0 = new Upgrade(spr_alchemist_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(2_200,undefined)
    _alch.left_1 = new Upgrade(spr_alchemist_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(2_500,undefined)
        .SetUnlockCost(30,4)
    _alch.left_2 = new Upgrade(spr_alchemist_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(4_400,undefined)
        .SetUnlockCost(54,7)
    _alch.middle_0 = new Upgrade(spr_alchemist_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1_900,undefined)
    _alch.middle_1 = new Upgrade(spr_alchemist_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(4_100,undefined)
        .SetUnlockCost(30,4)
    _alch.middle_2 = new Upgrade(spr_alchemist_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(8_000,undefined)
        .SetUnlockCost(54,9)
    _alch.right_0 = new Upgrade(spr_alchemist_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_000,undefined)
    _alch.right_1 = new Upgrade(spr_alchemist_upgrade_r_1,_mid,"right_1")
        .SetUpgradeData(2_000,undefined)
        .SetUnlockCost(30,3)
    _alch.right_2 = new Upgrade(spr_alchemist_upgrade_r_1,_mid,"right_2")
        .SetUpgradeData(9_000,undefined)
        .SetUnlockCost(54,9)
    _alch.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("big_bully",2)
    _alch.special_0 = new Upgrade(spr_alchemist_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(3_000,undefined)
    _alch.special_1 = new Upgrade(spr_alchemist_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(8_300,undefined)
        .SetUnlockCost(30,15)
    _alch.special_2 = new Upgrade(spr_alchemist_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(26_000,undefined)
        .SetUnlockCost(54,25)
    #endregion
    
    #region APPRENTICE MONKEY
    _mid = "apprentice_monkey"
    global.upgrades.apprentice_monkey = {}
    var _apprm = global.upgrades.apprentice_monkey
    
    _apprm.main_0 = new Upgrade(spr_apprentice_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(360,undefined)
    _apprm.main_1 = new Upgrade(spr_apprentice_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(850,undefined)
    _apprm.left_0 = new Upgrade(spr_apprentice_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(3_300,undefined)
    _apprm.left_1 = new Upgrade(spr_apprentice_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(5_400,undefined)
        .SetUnlockCost(31,4)
    _apprm.left_2 = new Upgrade(spr_apprentice_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(15_300,undefined)
        .SetUnlockCost(55,11)
    _apprm.middle_0 = new Upgrade(spr_apprentice_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1_500,undefined)
    _apprm.middle_1 = new Upgrade(spr_apprentice_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(3_500,undefined)
        .SetUnlockCost(31,4)
    _apprm.middle_2 = new Upgrade(spr_apprentice_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(17_300,undefined)
        .SetUnlockCost(55,11)
    _apprm.right_0 = new Upgrade(spr_apprentice_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_600,undefined)
    _apprm.right_1 = new Upgrade(spr_apprentice_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(5_500,undefined)
        .SetUnlockCost(31,5)
    _apprm.right_2 = new Upgrade(spr_apprentice_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(16_300,undefined)
        .SetUnlockCost(55,9)
    _apprm.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("big_bully",2)
    _apprm.special_0 = new Upgrade(spr_apprentice_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(3_500,undefined)
    _apprm.special_1 = new Upgrade(spr_apprentice_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(8_500,undefined)
        .SetUnlockCost(31,15)
    _apprm.special_2 = new Upgrade(spr_apprentice_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(45_000,undefined)
        .SetUnlockCost(55,25)
    #endregion
    
    #region MONKEY VILLAGE
    _mid = "monkey_village"
    global.upgrades.monkey_village = {}
    var _village = global.upgrades.monkey_village
    
    _village.main_0 = new Upgrade(spr_monkey_village_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(800,undefined)
    _village.main_1 = new Upgrade(spr_monkey_village_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(1_300,undefined)
    _village.left_0 = new Upgrade(spr_monkey_village_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(2_000,undefined)
    _village.left_1 = new Upgrade(spr_monkey_village_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(2_500,undefined)
        .SetUnlockCost(32,4)
    _village.left_2 = new Upgrade(spr_monkey_village_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(15_000,undefined)
        .SetUnlockCost(56,11)
    _village.middle_0 = new Upgrade(spr_monkey_village_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(3_000,undefined)
    _village.middle_1 = new Upgrade(spr_monkey_village_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(9_000,undefined)
        .SetUnlockCost(32,5)
    _village.middle_2 = new Upgrade(spr_monkey_village_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(18_000,undefined)
        .SetUnlockCost(56,11)
    _village.right_0 = new Upgrade(spr_monkey_village_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(2_500,undefined)
    _village.right_1 = new Upgrade(spr_monkey_village_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(6_000,undefined)
        .SetUnlockCost(32,5)
    _village.right_2 = new Upgrade(spr_monkey_village_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(20_000,undefined)
        .SetUnlockCost(56,11)
    _village.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("big_bully",1)
    _village.special_0 = new Upgrade(spr_monkey_village_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(3_500,undefined)
    _village.special_1 = new Upgrade(spr_monkey_village_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(16_000,undefined)
        .SetUnlockCost(32,15)
    _village.special_2 = new Upgrade(spr_monkey_village_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(45_000,undefined)
        .SetUnlockCost(56,25)
    #endregion
    
    #region BANANA FARM
    _mid = "banana_farm"
    global.upgrades.banana_farm = {}
    var _farmb= global.upgrades.banana_farm
    
    _farmb.main_0 = new Upgrade(spr_banana_farm_upgrades_1,_mid,"main_0",true)
        .SetUpgradeData(600,undefined)
    _farmb.main_1 = new Upgrade(spr_banana_farm_upgrades_2,_mid,"main_1",true)
        .SetUpgradeData(1_200,undefined)
    _farmb.left_0 = new Upgrade(spr_banana_farm_upgrades_l_1,_mid,"left_0",true)
        .SetUpgradeData(1_400,undefined)
    _farmb.left_1 = new Upgrade(spr_banana_farm_upgrades_l_2,_mid,"left_1")
        .SetUpgradeData(2_600,undefined)
        .SetUnlockCost(33,4)
    _farmb.left_2 = new Upgrade(spr_banana_farm_upgrades_l_3,_mid,"left_2")
        .SetUpgradeData(6_000,undefined)
        .SetUnlockCost(57,9)
    _farmb.middle_0 = new Upgrade(spr_banana_farm_upgrades_m_1,_mid,"middle_0",true)
        .SetUpgradeData(2_800,undefined)
    _farmb.middle_1 = new Upgrade(spr_banana_farm_upgrades_m_2,_mid,"middle_1")
        .SetUpgradeData(9_000,undefined)
        .SetUnlockCost(33,5)
    _farmb.middle_2 = new Upgrade(spr_banana_farm_upgrades_m_3,_mid,"middle_2")
        .SetUpgradeData(21_000,undefined)
        .SetUnlockCost(57,13)
    _farmb.right_0 = new Upgrade(spr_banana_farm_upgrades_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_700,undefined)
    _farmb.right_1 = new Upgrade(spr_banana_farm_upgrades_r_2,_mid,"right_1")
        .SetUpgradeData(2_500,undefined)
        .SetUnlockCost(33,4)
    _farmb.right_2 = new Upgrade(spr_banana_farm_upgrades_r_3,_mid,"right_2")
        .SetUpgradeData(7_800,undefined)
        .SetUnlockCost(57,9)
    _farmb.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("ufo_bloon",1)
    _farmb.special_0 = new Upgrade(spr_banana_farm_upgrades_s_1,_mid,"special_0")
        .SetUpgradeData(3_000,undefined)
    _farmb.special_1 = new Upgrade(spr_banana_farm_upgrades_s_2,_mid,"special_1")
        .SetUpgradeData(3_000,undefined)
        .SetUnlockCost(33,15)
    _farmb.special_2 = new Upgrade(spr_banana_farm_upgrades_s_3,_mid,"special_2")
        .SetUpgradeData(15_000,undefined)
        .SetUnlockCost(57,25)
    #endregion
    
    #region MORTAR MONKEY
    _mid = "mortar_monkey"
    global.upgrades.mortar_monkey = {}
    var _mmortar= global.upgrades.mortar_monkey
    
    _mmortar.main_0 = new Upgrade(spr_mortar_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(300,undefined)
    _mmortar.main_1 = new Upgrade(spr_mortar_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(400,undefined)
    _mmortar.left_0 = new Upgrade(spr_mortar_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(1_300,undefined)
    _mmortar.left_1 = new Upgrade(spr_mortar_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(3_900,undefined)
        .SetUnlockCost(34,4)
    _mmortar.left_2 = new Upgrade(spr_mortar_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(10_900,undefined)
        .SetUnlockCost(58,9)
    _mmortar.middle_0 = new Upgrade(spr_mortar_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(2_000,undefined)
    _mmortar.middle_1 = new Upgrade(spr_mortar_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(7_500,undefined)
        .SetUnlockCost(34,5)
    _mmortar.middle_2 = new Upgrade(spr_mortar_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(22_500,undefined)
        .SetUnlockCost(58,13)
    _mmortar.right_0 = new Upgrade(spr_mortar_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_750,undefined)
    _mmortar.right_1 = new Upgrade(spr_mortar_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(3_000,undefined)
        .SetUnlockCost(34,4)
    _mmortar.right_2 = new Upgrade(spr_mortar_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(12_750,undefined)
        .SetUnlockCost(58,9)
    _mmortar.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("mother",1)
    _mmortar.special_0 = new Upgrade(spr_mortar_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(2_550,undefined)
    _mmortar.special_1 = new Upgrade(spr_mortar_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(7_700,undefined)
        .SetUnlockCost(34,15)
    _mmortar.special_2 = new Upgrade(spr_mortar_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(37_000,undefined)
        .SetUnlockCost(58,25)
    #endregion
    
    #region DARTLING GUNNER
    _mid = "dartling_gunner"
    global.upgrades.dartling_gunner = {}
    var _dartgunn= global.upgrades.dartling_gunner
    
    _dartgunn.main_0 = new Upgrade(spr_dartling_gunner_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(750,undefined)
    _dartgunn.main_1 = new Upgrade(spr_dartling_gunner_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(1_200,undefined)
    _dartgunn.left_0 = new Upgrade(spr_dartling_gunner_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(4_300,undefined)
    _dartgunn.left_1 = new Upgrade(spr_dartling_gunner_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(8_500,undefined)
        .SetUnlockCost(35,5)
    _dartgunn.left_2 = new Upgrade(spr_dartling_gunner_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(20_500,undefined)
        .SetUnlockCost(59,11)
    _dartgunn.middle_0 = new Upgrade(spr_dartling_gunner_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(5_900,undefined)
    _dartgunn.middle_1 = new Upgrade(spr_dartling_gunner_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(39_000,undefined)
        .SetUnlockCost(35,7)
    _dartgunn.middle_2 = new Upgrade(spr_dartling_gunner_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(85_000,undefined)
        .SetUnlockCost(59,15)
    _dartgunn.right_0 = new Upgrade(spr_dartling_gunner_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(6_600,undefined)
    _dartgunn.right_1 = new Upgrade(spr_dartling_gunner_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(13_900,undefined)
        .SetUnlockCost(35,5)
    _dartgunn.right_2 = new Upgrade(spr_dartling_gunner_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(26_500,undefined)
        .SetUnlockCost(59,11)
    _dartgunn.special_path = new SpecialPath(PATH_UPGR_TYPE.LEFT,UPGRADE_SPECIAL_COLOR_II)
        .SetBounty("horror_bloon",1)
    _dartgunn.special_0 = new Upgrade(spr_dartling_gunner_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(5_000,undefined)
    _dartgunn.special_1 = new Upgrade(spr_dartling_gunner_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(15_000,undefined)
        .SetUnlockCost(35,15)
    _dartgunn.special_2 = new Upgrade(spr_dartling_gunner_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(73_000,undefined)
        .SetUnlockCost(59,25)
    #endregion
    
    #region SPIKE FACTORY
    _mid = "spike_factory"
    global.upgrades.spike_factory = {}
    var _spikefac = global.upgrades.spike_factory
    
    _spikefac.main_0 = new Upgrade(spr_spike_factory_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(700,undefined)
    _spikefac.main_1 = new Upgrade(spr_spike_factory_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(1_250,undefined)
    _spikefac.left_0 = new Upgrade(spr_spike_factory_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(2_400,undefined)
    _spikefac.left_1 = new Upgrade(spr_spike_factory_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(8_500,undefined)
        .SetUnlockCost(16,5)
    _spikefac.left_2 = new Upgrade(spr_spike_factory_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(13_500,undefined)
        .SetUnlockCost(60,9)
    _spikefac.middle_0 = new Upgrade(spr_spike_factory_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(3_000,undefined)
    _spikefac.middle_1 = new Upgrade(spr_spike_factory_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(7_800,undefined)
        .SetUnlockCost(36,6)
    _spikefac.middle_2 = new Upgrade(spr_spike_factory_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(25_000,undefined)
        .SetUnlockCost(60,13)
    _spikefac.right_0 = new Upgrade(spr_spike_factory_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(3_400,undefined)
    _spikefac.right_1 = new Upgrade(spr_spike_factory_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(6_600,undefined)
        .SetUnlockCost(36,5)
    _spikefac.right_2 = new Upgrade(spr_spike_factory_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(15_500,undefined)
        .SetUnlockCost(60,11)
    _spikefac.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("big_bully",3)
    _spikefac.special_0 = new Upgrade(spr_spike_factory_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(3_500,undefined)
    _spikefac.special_1 = new Upgrade(spr_spike_factory_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(11_500,undefined)
        .SetUnlockCost(36,15)
    _spikefac.special_2 = new Upgrade(spr_spike_factory_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(42_000,undefined)
        .SetUnlockCost(60,25)
    #endregion
    
    #region HELI PILOT
    _mid = "heli_pilot"
    global.upgrades.heli_pilot = {}
    var _helipil = global.upgrades.heli_pilot
    
    _helipil.main_0 = new Upgrade(spr_heli_pilot_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(900,undefined)
    _helipil.main_1 = new Upgrade(spr_heli_pilot_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(1_150,undefined)
    _helipil.left_0 = new Upgrade(spr_heli_pilot_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(2_200,undefined)
    _helipil.left_1 = new Upgrade(spr_heli_pilot_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(3_300,undefined)
        .SetUnlockCost(37,5)
    _helipil.left_2 = new Upgrade(spr_heli_pilot_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(12_000,undefined)
        .SetUnlockCost(61,9)
    _helipil.middle_0 = new Upgrade(spr_heli_pilot_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(2_400,undefined)
    _helipil.middle_1 = new Upgrade(spr_heli_pilot_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(17_900,undefined)
        .SetUnlockCost(37,5)
    _helipil.middle_2 = new Upgrade(spr_heli_pilot_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(53_500,undefined)
        .SetUnlockCost(61,13)
    _helipil.right_0 = new Upgrade(spr_heli_pilot_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1_600,undefined)
    _helipil.right_1 = new Upgrade(spr_heli_pilot_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(5_000,undefined)
        .SetUnlockCost(37,5)
    _helipil.right_2 = new Upgrade(spr_heli_pilot_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(13_500,undefined)
        .SetUnlockCost(61,11)
    _helipil.special_path = new SpecialPath(PATH_UPGR_TYPE.LEFT,UPGRADE_SPECIAL_COLOR_II)
        .SetBounty("mighty_moab",3)
    _helipil.special_0 = new Upgrade(spr_heli_pilot_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(3_600,undefined)
    _helipil.special_1 = new Upgrade(spr_heli_pilot_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(18_300,undefined)
        .SetUnlockCost(37,15)
    _helipil.special_2 = new Upgrade(spr_heli_pilot_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(65_500,undefined)
        .SetUnlockCost(61,25)
    #endregion
    
    #region PLASMA MONKEY
    _mid = "plasma_monkey"
    global.upgrades.plasma_monkey = {}
    var _plasmam = global.upgrades.plasma_monkey
    
    _plasmam.main_0 = new Upgrade(spr_plasma_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(800,undefined)
    _plasmam.main_1 = new Upgrade(spr_plasma_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(900,undefined)
    _plasmam.left_0 = new Upgrade(spr_plasma_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(1_800,undefined)
    _plasmam.left_1 = new Upgrade(spr_plasma_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(3_500,undefined)
        .SetUnlockCost(38,4)
    _plasmam.left_2 = new Upgrade(spr_plasma_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(10_500,undefined)
        .SetUnlockCost(62,7)
    _plasmam.middle_0 = new Upgrade(spr_plasma_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(3_350,undefined)
    _plasmam.middle_1 = new Upgrade(spr_plasma_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(11_900,undefined)
        .SetUnlockCost(38,5)
    _plasmam.middle_2 = new Upgrade(spr_plasma_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(33_000,undefined)
        .SetUnlockCost(62,13)
    _plasmam.right_0 = new Upgrade(spr_plasma_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(2_000,undefined)
    _plasmam.right_1 = new Upgrade(spr_plasma_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(5_000,undefined)
        .SetUnlockCost(38,5)
    _plasmam.right_2 = new Upgrade(spr_plasma_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(16_000,undefined)
        .SetUnlockCost(62,11)
    _plasmam.special_path = new SpecialPath(PATH_UPGR_TYPE.LEFT,UPGRADE_SPECIAL_COLOR_II)
        .SetBounty("track_crawler",2)
    _plasmam.special_0 = new Upgrade(spr_plasma_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(4_500,undefined)
    _plasmam.special_1 = new Upgrade(spr_plasma_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(16_000,undefined)
        .SetUnlockCost(38,15)
    _plasmam.special_2 = new Upgrade(spr_plasma_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(66_000,undefined)
        .SetUnlockCost(62,25)
    #endregion
    
    #region SUPER MONKEY
    _mid = "super_monkey"
    global.upgrades.super_monkey = {}
    var _superm = global.upgrades.super_monkey
    
    _superm.main_0 = new Upgrade(spr_super_monkey_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(2_400,undefined)
    _superm.main_1 = new Upgrade(spr_super_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(4_600,undefined)
    _superm.left_0 = new Upgrade(spr_super_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(9_000,undefined)
    _superm.left_1 = new Upgrade(spr_super_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(19_900,undefined)
        .SetUnlockCost(39,6)
    _superm.left_2 = new Upgrade(spr_super_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(44_000,undefined)
        .SetUnlockCost(63,13)
    _superm.middle_0 = new Upgrade(spr_super_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(16_500,undefined)
    _superm.middle_1 = new Upgrade(spr_super_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(90_000,undefined)
        .SetUnlockCost(39,8)
    _superm.middle_2 = new Upgrade(spr_super_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(600_000,undefined)
        .SetUnlockCost(63,17)
    _superm.right_0 = new Upgrade(spr_super_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(10_000,undefined)
    _superm.right_1 = new Upgrade(spr_super_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(27_000,undefined)
        .SetUnlockCost(39,7)
    _superm.right_2 = new Upgrade(spr_super_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(54_000,undefined)
        .SetUnlockCost(63,13)
    _superm.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("annoying_bloon",4)
    _superm.special_0 = new Upgrade(spr_super_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(21_000,undefined)
    _superm.special_1 = new Upgrade(spr_super_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(55_000,undefined)
        .SetUnlockCost(39,15)
    _superm.special_2 = new Upgrade(spr_super_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(155_000,undefined)
        .SetUnlockCost(63,25)
    #endregion
    
}