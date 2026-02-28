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
    /*
    Ninja Monkey
    Bomb Shooter
    Monkey Village
    Ice Monkey
    Mortar
    Monkey Ace
    Super Monkey
    */
    #macro UPGRADE_SPECIAL_COLOR_II #ff9c2b
    /*
    Boomerang Thrower
    Charge Tower
    Monkey Buccaneer
    Submarine
    Sniper
    Dartling Gunner
    Heli Pilot
    Plasma Monkey
    */
    #macro UPGRADE_SPECIAL_COLOR_III #ffff47
    /*
    Wizard Monkey
    Engineer
    Tack Shooter
    Farm
    Bloonchipper
    Glue Gunner
    Spike Factory
    */
    
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
        .SetUpgradeData(160,undefined)
    _dmkey.main_1 = new Upgrade(spr_dart_monkey_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(180,undefined)
    _dmkey.left_0 = new Upgrade(spr_dart_monkey_upgrade_l_1,_mid,"left_0",true)
        .SetUpgradeData(210,undefined)
    _dmkey.left_1 = new Upgrade(spr_dart_monkey_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(750,undefined)
        .SetUnlockCost(16,2)
    _dmkey.left_2 = new Upgrade(spr_dart_monkey_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(1800,undefined)
        .SetUnlockCost(40,5)
    _dmkey.middle_0 = new Upgrade(spr_dart_monkey_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(710,undefined)
    _dmkey.middle_1 = new Upgrade(spr_dart_monkey_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(1600,undefined)
        .SetUnlockCost(16,3)
    _dmkey.middle_2 = new Upgrade(spr_dart_monkey_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(3200,undefined)
    _dmkey.right_0 = new Upgrade(spr_dart_monkey_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(440,undefined)
    _dmkey.right_1 = new Upgrade(spr_dart_monkey_upgrade_r_2,_mid,"right_1")
        .SetUpgradeData(850,undefined)
        .SetUnlockCost(16,2)
    _dmkey.right_2 = new Upgrade(spr_dart_monkey_upgrade_r_3,_mid,"right_2")
        .SetUpgradeData(7500,undefined)
        .SetUnlockCost(40,7)
    _dmkey.special_path = new SpecialPath(PATH_UPGR_TYPE.MIDDLE,UPGRADE_SPECIAL_COLOR_III)
        .SetBounty("mighty_moab",1)
    _dmkey.special_0 = new Upgrade(spr_dart_monkey_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(950,undefined)
    _dmkey.special_1 = new Upgrade(spr_dart_monkey_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(3300,undefined)
        .SetUnlockCost(16,15)
    _dmkey.special_2 = new Upgrade(spr_dart_monkey_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(9500,undefined)
        .SetUnlockCost(40,25)
    #endregion
    
    #region TACK SHOOTER
    _mid = "tack_shooter"
    global.upgrades.tack_shooter = {}
    var _tcksh = global.upgrades.tack_shooter
    
    _tcksh.main_0 = new Upgrade(spr_tack_shooter_upgrade_1,_mid,"main_0",true)
        .SetUpgradeData(170,undefined)
    _tcksh.main_1 = new Upgrade(spr_tack_shooter_upgrade_2,_mid,"main_1",true)
        .SetUpgradeData(230,undefined)
    
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
        .SetUpgradeData(2200,undefined)
    _alch.left_1 = new Upgrade(spr_alchemist_upgrade_l_2,_mid,"left_1")
        .SetUpgradeData(2500,undefined)
        .SetUnlockCost(30,4)
    _alch.left_2 = new Upgrade(spr_alchemist_upgrade_l_3,_mid,"left_2")
        .SetUpgradeData(4400,undefined)
        .SetUnlockCost(54,7)
    _alch.middle_0 = new Upgrade(spr_alchemist_upgrade_m_1,_mid,"middle_0",true)
        .SetUpgradeData(1900,undefined)
    _alch.middle_1 = new Upgrade(spr_alchemist_upgrade_m_2,_mid,"middle_1")
        .SetUpgradeData(4100,undefined)
        .SetUnlockCost(30,4)
    _alch.middle_2 = new Upgrade(spr_alchemist_upgrade_m_3,_mid,"middle_2")
        .SetUpgradeData(8000,undefined)
        .SetUnlockCost(54,9)
    _alch.right_0 = new Upgrade(spr_alchemist_upgrade_r_1,_mid,"right_0",true)
        .SetUpgradeData(1000,undefined)
    _alch.right_1 = new Upgrade(spr_alchemist_upgrade_r_1,_mid,"right_1")
        .SetUpgradeData(2000,undefined)
        .SetUnlockCost(30,3)
    _alch.right_2 = new Upgrade(spr_alchemist_upgrade_r_1,_mid,"right_2")
        .SetUpgradeData(9000,undefined)
        .SetUnlockCost(54,9)
    _alch.special_path = new SpecialPath(PATH_UPGR_TYPE.RIGHT,UPGRADE_SPECIAL_COLOR_I)
        .SetBounty("big_bully",2)
    _alch.special_0 = new Upgrade(spr_alchemist_upgrade_s_1,_mid,"special_0")
        .SetUpgradeData(3000,undefined)
    _alch.special_1 = new Upgrade(spr_alchemist_upgrade_s_2,_mid,"special_1")
        .SetUpgradeData(8300,undefined)
        .SetUnlockCost(30,15)
    _alch.special_2 = new Upgrade(spr_alchemist_upgrade_s_3,_mid,"special_2")
        .SetUpgradeData(26000,undefined)
        .SetUnlockCost(54,25)
    #endregion
    
}