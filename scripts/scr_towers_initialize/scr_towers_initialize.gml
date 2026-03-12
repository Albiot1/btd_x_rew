function scr_towers_initialize(){
    
    enum PLACEMENT {
        GROUND,
        WATER,
        ALL
    }
    
    global.towers = {}
    
    global.towers.translation = -1
    if file_exists("data/upgrades_translation.json"){
        global.towers.translation = load_json( "data/upgrades_translation.json" )
    }
    
    function Tower(_id,_price,_rank = 0,_placement = PLACEMENT.GROUND) constructor {
        myid = _id
        
        var _name = "NOT FOUND!"
        if variable_struct_exists(global.towers.translation,_id){
            _name = global.towers.translation[$ _id]
        }
        else {
            show_debug_message($"Tower name : {_id} NOT FOUND !!!")
        }
        
        name = _name
        
        panel_icon = -1
        panel_color = -1
        rank = _rank
        placement = _placement
        obj = undefined
        price = _price
        stats = { range:0 }
        static setPanel = function (_icon,_color){
            panel_icon = _icon
            panel_color = _color
            
            return self
        }
        static setObjcet = function (_object){
            obj = _object
            
            return self
        }
        static setStats = function (_range){
            stats.range = _range
            
            return self
        }
    }
    
    
    global.towers.dart_monkey = new Tower("dart_monkey",200)
        .setPanel(spr_dart_monkey_panel,#79ff5b)
    global.towers.tack_shooter = new Tower("tack_shooter",370)
        .setPanel(spr_tack_shooter_panel,#79ff5b)
    global.towers.boomerang_thrower = new Tower("boomerang_thrower",380)
        .setPanel(spr_boomerang_monkey_panel,#ffc429)
    global.towers.sniper_monkey = new Tower("sniper_monkey",420)
        .setPanel(spr_sniper_monkey_panel,#ffc429)
    global.towers.ninja_monkey = new Tower("ninja_monkey",590)
        .setPanel(spr_ninja_monkey_panel,#ff4f7e)
    global.towers.bomb_tower = new Tower("bomb_tower",650)
        .setPanel(spr_bomb_tower_panel,#ff4f7e)
    global.towers.sub_monkey = new Tower("sub_monkey",440)
        .setPanel(spr_sub_monkey_panel,#5fffe7)
    global.towers.charge_tower = new Tower("charge_tower",450)
        .setPanel(spr_charge_tower_panel,#5fffe7)
    global.towers.glue_gunner = new Tower("glue_gunner",450)
        .setPanel(spr_glue_gunner_panel,#ffffe7)
    global.towers.ice_monkey = new Tower("ice_monkey",510)
        .setPanel(spr_ice_monkey_panel,#ffffe7)
    global.towers.buccaneer = new Tower("buccaneer",550)
        .setPanel(spr_buccaneer_panel,#5f5fe7)
    global.towers.engineer = new Tower("engineer",470)
        .setPanel(spr_engineer_monkey_panel,#5f5fe7)
    global.towers.ace_monkey = new Tower("ace_monkey",810)
        .setPanel(spr_ace_monkey_panel,#9c9c8e)
    global.towers.bloonchipper = new Tower("bloonchipper",600)
        .setPanel(spr_bloonchipper_panel,#9c9c8e)
    global.towers.alchemist_monkey = new Tower("alchemist_monkey",720)
        .setPanel(spr_alchemist_monkey_panel,#b16399)
    global.towers.apprentice_monkey = new Tower("apprentice_monkey",450)
        .setPanel(spr_apprentice_monkey_panel,#b16399)
    global.towers.monkey_village = new Tower("monkey_village",900)
        .setPanel(spr_monkey_village_panel,#ffff47)
    global.towers.banana_farm = new Tower("banana_farm",1200)
        .setPanel(spr_banana_farm_panel,#ffff47)
    global.towers.mortar_monkey = new Tower("mortar_monkey",720)
        .setPanel(spr_mortar_launcher_panel,#ff5f47)
    global.towers.dartling_gunner = new Tower("dartling_gunner",950)
        .setPanel(spr_dartling_gunner_panel,#ff5f47)
    global.towers.spike_factory = new Tower("spike_factory",750)
        .setPanel(spr_spike_factory_panel,#399c2b)
    global.towers.heli_pilot = new Tower("heli_pilot",1250)
        .setPanel(spr_heli_pilot_panel,#399c2b)
    global.towers.plasma_monkey = new Tower("plasma_monkey",1050)
        .setPanel(spr_plasma_monkey_panel,#ff9cd8)
    global.towers.super_monkey = new Tower("super_monkey",2500)
        .setPanel(spr_super_monkey_panel,#ff9cd8)
    
}