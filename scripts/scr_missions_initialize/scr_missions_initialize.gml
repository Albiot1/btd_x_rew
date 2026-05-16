function scr_missions_initialize(){

    Mission = function (_id,_color,_icon,_map) constructor {
        completed = false
        color = [ color_get_red(_color)/255,color_get_green(_color)/255,color_get_blue(_color)/255 ]
        map = _map
        icon = _icon
        name = scr_get_translation("mission_"+_id+"_name")
        
        var _track_name = global.tracks[$ _map].name
        
        
        desc = _track_name + " - " + scr_get_translation("mission_"+_id+"_desc")
    }
    
    global.missions = {
        color_splash: new Mission("color_splash",#68b34e,spr_mission_icon_color_splash,"swamp_spirals"),
        non_stop_assault: new Mission("non_stop_assault",#008000,spr_mission_icon_non_stop_assault,"monkey_fort"),
        flood: new Mission("flood",#009dff,spr_mission_icon_flood,"monkey_town_docks"),
        blimp_brigade: new Mission("blimp_brigade",#808080,spr_mission_icon_blimp_brigade,"conveyor_belt"),
        necropolis: new Mission("necropolis",#5f5f47,spr_mission_icon_necropolis,"the_depths"),
        solar_storm: new Mission("solar_storm",#ffff75,spr_mission_icon_solar_storm,"sun_stone"),
        prison_break_1: new Mission("prison_break_1",#ea854a,spr_mission_icon_prison_break1,"bloon_bounty_center"),
        prison_break_2: new Mission("prison_break_2",#ea854a,spr_mission_icon_prison_break2,"bloon_bounty_center"),
        prison_break_3: new Mission("prison_break_3",#ea854a,spr_mission_icon_prison_break3,"bloon_bounty_center"),
        prison_break_4: new Mission("prison_break_4",#ea854a,spr_mission_icon_prison_break4,"bloon_bounty_center"),
        ultra_break_v1: new Mission("ultra_break_v1",#ee1c24,spr_mission_icon_ultra_break_out_v1,"bloon_bounty_center"),
        ultra_break_v4: new Mission("ultra_break_v4",#ee1c24,spr_mission_icon_ultra_break_out_v4,"bloon_bounty_center"),
    }
    
}