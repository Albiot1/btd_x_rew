function scr_challenges_initialize(){

    enum CTYPE {
        NORMAL,
        TIMED
    }
    
    Challenge = function(_id = -1,_track = -1,_type = CTYPE.NORMAL,_creator_name = -1) constructor {
        complete = false
        
        if _type == CTYPE.TIMED{
            time = -1
        }
        track = _track
        name = scr_get_translation("challenge_"+_id+"_name")
        
        if variable_struct_exists(global.tracks,_track){
            desc = global.tracks[$ _track].name+" - "
        }
        else {
        	desc = ""
        }
        desc += scr_get_translation("challenge_"+_id+"_desc")
        
        type = _type
        creator = _creator_name
    }
    
    global.challenges = {
        deflation: new Challenge("deflation","monkey_meadows"),
        antishield: new Challenge("antishield","bloon_oasis"),
        starveout: new Challenge("starveout","monkey_town_docks"),
        necronomicon: new Challenge("necronomicon","graveyard"),
        mvsgoliath: new Challenge("mvsgoliath","monkey_fort",,"Weirdoverse()"),
        redcross: new Challenge("redcross","swamp_spirals",,"Sheeper"),
        
        onetrace: new Challenge("onetrace","minecarts",CTYPE.TIMED),
        llrace: new Challenge("llrace","monkey_fort",CTYPE.TIMED),
        maxpower: new Challenge("maxpower","conveyor_belt",CTYPE.TIMED),
        swarmsupport: new Challenge("swarmsupport","village_defense",CTYPE.TIMED),
        supramonkey: new Challenge("supramonkey","crimson_creek",CTYPE.TIMED,"YWNBYA & OTP I think"),
        lfast: new Challenge("lfast","bloonlight_throwback",CTYPE.TIMED)
    }
    
}