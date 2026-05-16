function scr_tracks_initialize(){
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
    
    Track = function (_id,_difficulty,_icon = -1,_type = TRACK_TYPE.NORMAL) constructor {
        name = scr_get_translation("track_"+_id+"_name")
        difficulty = _difficulty
        icon = _icon
        type = _type
        my_bounty = -1
        bounty_medal_icon = -1
        
        if type == TRACK_TYPE.NORMAL{
            best_time = 500 //86_400
            
            milestone = {
                normal: 0,
                impoppable: 0,
                nightmare: 0,
                timetrial: 0,
                score: 0
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
                nightmare: 0,
                overall: 90_000
            }
        }
        
        static setBounty = function (_bounty_id,_medal_icon){
            lastmedal.bounty = 0
            bounty_medal_icon = _medal_icon
            my_bounty = _bounty_id
        }
        
    }
    
    global.tracks = {}
    
    global.tracks.monkey_meadows = new Track("monkey_meadows",TRACK_DIFFICULTY.FLOATY,spr_background_monkey_meadows_preview)
    global.tracks.bloon_oasis = new Track("bloon_oasis",TRACK_DIFFICULTY.FLOATY,spr_background_bloon_oasis_preview)
    global.tracks.shade_woods = new Track("shade_woods",TRACK_DIFFICULTY.FLOATY,spr_background_shade_woods_preview)
    global.tracks.bloonlight_throwback = new Track("bloonlight_throwback",TRACK_DIFFICULTY.FLOATY,spr_background_bloon_light_throwback_preview)
    global.tracks.bloon_circles_x = new Track("bloon_circles_x",TRACK_DIFFICULTY.FLOATY,spr_background_bloon_circles_preview)
    global.tracks.rubber_rug = new Track("rubber_rug",TRACK_DIFFICULTY.FLOATY,spr_background_rubber_rug_preview)
    global.tracks.monkey_fort = new Track("monkey_fort",TRACK_DIFFICULTY.INFLATE,spr_background_monkey_fort_preview)
    global.tracks.swamp_spirals = new Track("swamp_spirals",TRACK_DIFFICULTY.INFLATE,spr_background_swamp_spirals_preview)
    global.tracks.portal_lab = new Track("portal_lab",TRACK_DIFFICULTY.INFLATE,spr_background_portal_lab_preview)
    global.tracks.autumn_acres = new Track("autumn_acres",TRACK_DIFFICULTY.INFLATE,spr_background_autumn_acres_preview)
    global.tracks.minecarts = new Track("minecarts",TRACK_DIFFICULTY.INFLATE,spr_background_minecarts_preview)
    global.tracks.omega_river = new Track("omega_river",TRACK_DIFFICULTY.INFLATE,spr_background_omega_river_preview)
    global.tracks.graveyard = new Track("graveyard",TRACK_DIFFICULTY.INFLATE,spr_background_graveyard_preview)
    global.tracks.frozen_lake = new Track("frozen_lake",TRACK_DIFFICULTY.INFLATE,spr_background_frozen_lake_preview)
    global.tracks.sky_battles = new Track("sky_battles",TRACK_DIFFICULTY.INFLATE,spr_background_sky_battles_preview)
    global.tracks.monkey_town_docks = new Track("monkey_town_docks",TRACK_DIFFICULTY.HARD_TORN,spr_background_monkey_town_docks_preview)
    global.tracks.conveyor_belt = new Track("conveyor_belt",TRACK_DIFFICULTY.HARD_TORN,spr_background_conveyor_belts_preview)
    global.tracks.circuit = new Track("circuit",TRACK_DIFFICULTY.HARD_TORN,spr_background_circuit_preview)
    global.tracks.crimson_creek = new Track("crimson_creek",TRACK_DIFFICULTY.HARD_TORN,spr_background_crimson_creek_preview)
    global.tracks.space_portals = new Track("space_portals",TRACK_DIFFICULTY.HARD_TORN,spr_background_space_portals_preview)
    global.tracks.village_defense = new Track("village_defense",TRACK_DIFFICULTY.HARD_TORN,spr_background_village_defense_preview)
    global.tracks.lava_stream = new Track("lava_stream",TRACK_DIFFICULTY.HARD_TORN,spr_background_lava_stream_preview)
    global.tracks.ravine_river = new Track("ravine_river",TRACK_DIFFICULTY.HARD_TORN,spr_background_ravine_river_preview)
    global.tracks.sun_stone = new Track("sun_stone",TRACK_DIFFICULTY.MAD_POP,spr_background_sun_stone_preview)
    global.tracks.xtreme_park = new Track("xtreme_park",TRACK_DIFFICULTY.MAD_POP,spr_background_xtreme_park_preview)
    global.tracks.bloonside_river = new Track("bloonside_river",TRACK_DIFFICULTY.MAD_POP,spr_background_bloonside_river_preview)
    global.tracks.grand_canyon = new Track("grand_canyon",TRACK_DIFFICULTY.MAD_POP,spr_background_grandcanyon_preview)
    global.tracks.peaceful_bridge = new Track("peaceful_bridge",TRACK_DIFFICULTY.MAD_POP,spr_background_peaceful_bridge_preview)
    global.tracks.the_depths = new Track("the_depths",TRACK_DIFFICULTY.MAD_POP,spr_background_the_depths_preview)
    global.tracks.lawless_badlands = new Track("lawless_badlands",TRACK_DIFFICULTY.MAD_POP,spr_background_lawless_badlands_preview)
    global.tracks.lost_pools = new Track("lost_pools",TRACK_DIFFICULTY.MAD_POP,spr_background_lost_pools_preview)
    
    global.tracks.bloon_bounty_center = new Track("bloon_bounty_center",TRACK_DIFFICULTY.MAD_POP,spr_background_break_out_preview,TRACK_TYPE.SPECIAL)
    global.tracks.lunar_temple = new Track("lunar_temple",TRACK_DIFFICULTY.MAD_POP,spr_background_lunar_temple_preview,TRACK_TYPE.SPECIAL)
    
    global.tracks_order = ["monkey_meadows","bloon_oasis","shade_woods","bloonlight_throwback","bloon_circles_x","rubber_rug","monkey_fort","swamp_spirals","portal_lab","autumn_acres","minecarts","omega_river","graveyard","frozen_lake","sky_battles","monkey_town_docks","conveyor_belt","circuit","crimson_creek","space_portals","village_defense","lava_stream","ravine_river","sun_stone","xtreme_park","bloonside_river","grand_canyon","peaceful_bridge","the_depths","lawless_badlands","lost_pools"]
    //
}