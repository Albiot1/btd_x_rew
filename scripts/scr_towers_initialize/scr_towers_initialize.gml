function scr_towers_initialize(){
    
    enum PLACEMENT {
        GROUND,
        WATER,
        WATER_N_GROUND,
        ONLY_PATH
    }
    
    global.towers = {}
    
    function Tower(_id,_price,_rank = 0,_placement = PLACEMENT.GROUND,_unlocked = false) constructor {
        myid = _id
        
        var _name = scr_get_translation(_id)
        
        name = _name
        
        panel_hotkey = -1
        panel_icon = -1
        panel_color = -1
        rank = _rank
        placement = _placement
        obj = undefined
        price = _price
        unlocked = _unlocked
        preview_range = 0
        static setPanel = function (_icon,_color,_hotkey = -1){
            panel_icon = _icon
            panel_color = _color
            panel_hotkey = _hotkey
            
            return self
        }
        static setObject = function (_object){
            obj = _object
            
            return self
        }
        static setPreviewRange = function (_range){
            stats.preview_range = _range
            
            return self
        }
    }
    
    
    global.towers.dart_monkey = new Tower("dart_monkey",200,0,,true)
        .setPanel(spr_dart_monkey_panel,#79ff5b,HOTKEY.TOWER_DARTM)
    global.towers.tack_shooter = new Tower("tack_shooter",370,1)
        .setPanel(spr_tack_shooter_panel,#79ff5b,HOTKEY.TOWER_TACKS)
    global.towers.boomerang_thrower = new Tower("boomerang_thrower",380,2)
        .setPanel(spr_boomerang_monkey_panel,#ffc429,HOTKEY.TOWER_BOMRM)
    global.towers.sniper_monkey = new Tower("sniper_monkey",420,2)
        .setPanel(spr_sniper_monkey_panel,#ffc429,HOTKEY.TOWER_SNIPM)
    global.towers.ninja_monkey = new Tower("ninja_monkey",590,3)
        .setPanel(spr_ninja_monkey_panel,#ff4f7e,HOTKEY.TOWER_NINJM)
    global.towers.bomb_tower = new Tower("bomb_tower",650,3)
        .setPanel(spr_bomb_tower_panel,#ff4f7e,HOTKEY.TOWER_BOMBS)
    global.towers.sub_monkey = new Tower("sub_monkey",440,4,PLACEMENT.WATER)
        .setPanel(spr_sub_monkey_panel,#5fffe7,HOTKEY.TOWER_SUBMM)
    global.towers.charge_tower = new Tower("charge_tower",450,4)
        .setPanel(spr_charge_tower_panel,#5fffe7,HOTKEY.TOWER_CHARG)
    global.towers.glue_gunner = new Tower("glue_gunner",450,5)
        .setPanel(spr_glue_gunner_panel,#ffffe7,HOTKEY.TOWER_GLUEG)
    global.towers.ice_monkey = new Tower("ice_monkey",510,5)
        .setPanel(spr_ice_monkey_panel,#ffffe7,HOTKEY.TOWER_ICEMO)
    global.towers.buccaneer = new Tower("buccaneer",550,6,PLACEMENT.WATER)
        .setPanel(spr_buccaneer_panel,#5f5fe7,HOTKEY.TOWER_BUCCM)
    global.towers.engineer = new Tower("engineer",470,6)
        .setPanel(spr_engineer_monkey_panel,#5f5fe7,HOTKEY.TOWER_ENGIM)
    global.towers.ace_monkey = new Tower("ace_monkey",810,7)
        .setPanel(spr_ace_monkey_panel,#9c9c8e,HOTKEY.TOWER_ACEMO)
    global.towers.bloonchipper = new Tower("bloonchipper",600,7)
        .setPanel(spr_bloonchipper_panel,#9c9c8e,HOTKEY.TOWER_BLONC)
    global.towers.alchemist_monkey = new Tower("alchemist_monkey",720,8)
        .setPanel(spr_alchemist_monkey_panel,#b16399,HOTKEY.TOWER_ALCHE)
    global.towers.apprentice_monkey = new Tower("apprentice_monkey",450,8)
        .setPanel(spr_apprentice_monkey_panel,#b16399,HOTKEY.TOWER_APPRE)
    global.towers.monkey_village = new Tower("monkey_village",900,9)
        .setPanel(spr_monkey_village_panel,#ffff47,HOTKEY.TOWER_VILLA)
    global.towers.banana_farm = new Tower("banana_farm",1200,9)
        .setPanel(spr_banana_farm_panel,#ffff47,HOTKEY.TOWER_BANAN)
    global.towers.mortar_monkey = new Tower("mortar_monkey",720,10)
        .setPanel(spr_mortar_launcher_panel,#ff5f47,HOTKEY.TOWER_MORTA)
    global.towers.dartling_gunner = new Tower("dartling_gunner",950,10)
        .setPanel(spr_dartling_gunner_panel,#ff5f47,HOTKEY.TOWER_DARTG)
    global.towers.spike_factory = new Tower("spike_factory",750,11)
        .setPanel(spr_spike_factory_panel,#399c2b,HOTKEY.TOWER_SPIKE)
    global.towers.heli_pilot = new Tower("heli_pilot",1250,11)
        .setPanel(spr_heli_pilot_panel,#399c2b,HOTKEY.TOWER_HELIP)
    global.towers.plasma_monkey = new Tower("plasma_monkey",1050,12)
        .setPanel(spr_plasma_monkey_panel,#ff9cd8,HOTKEY.TOWER_PLASM)
    global.towers.super_monkey = new Tower("super_monkey",2500,12)
        .setPanel(spr_super_monkey_panel,#ff9cd8,HOTKEY.TOWER_SUPER)
    global.towers.road_spikes = new Tower("road_spikes",30,0,PLACEMENT.ONLY_PATH,true)
        .setPanel(spr_spikes_panel,#ffffc0,HOTKEY.ROAD_SPIKES)
    global.towers.grilled_pineapple = new Tower("grilled_pineapple",30,0,PLACEMENT.ONLY_PATH,true)
        .setPanel(spr_pineapple_bomb_panel,#ffffc0,HOTKEY.GRIL_PINEAP)
    
}