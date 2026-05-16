function scr_achievements_initialize(){

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
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_mil_n_90"),[_track_name] ),ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_NORMAL_90_WAVE)
            .setData( { map:_track_id } )
        array_push(global.achievements_order.milestone,_ach_id)
        _ach_id = "milestone_normal_190_"+_track_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_mil_n_190"),[_track_name] ),ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_NORMAL_190_WAVE)
            .setData( { map:_track_id } )
        array_push(global.achievements_order.milestone,_ach_id)
        _ach_id = "milestone_impoppable_75_"+_track_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_mil_i_75"),[_track_name] ),ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_IMPOPPABLE_75_WAVE)
            .setData( { map:_track_id } )
        array_push(global.achievements_order.milestone,_ach_id)
        _ach_id = "milestone_nightmare_60_"+_track_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_mil_ngh_60"),[_track_name] ),ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_NIGHTMARE_60_WAVE)
            .setData( { map:_track_id } )
        array_push(global.achievements_order.milestone,_ach_id)
        _ach_id = "milestone_score_2mil_"+_track_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_mil_sc_2"),[_track_name] ),ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_2MIL_SCORE)
            .setData( { map:_track_id } )
        array_push(global.achievements_order.milestone,_ach_id)
        _ach_id = "milestone_time_under_240_"+_track_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_mil_tm_240"),[_track_name] ),ACHIEVEMENT_MAIN_TYPE.MILESTONE,ACHIEVEMENT_EXACT_TYPE.MILESTONE_UNDER_240_SECONDS)
            .setData( { map:_track_id } )
        array_push(global.achievements_order.milestone,_ach_id)
    }
    
    var _monkeys = variable_struct_get_names(global.towers)
    var _monkeys_num = array_length(_monkeys)
    
    for (var i = 0; i < _monkeys_num; i++) {
    	var _monkey_id = _monkeys[i]
        var _monkey_name = global.towers[$ _monkey_id].name
        
        var _ach_id = "tower_unlock_fifth_tiers_"+_monkey_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_unl_v"),[_monkey_name] ),ACHIEVEMENT_MAIN_TYPE.TOWER,ACHIEVEMENT_EXACT_TYPE.TOWER_ALL_FIFTH_TIER_UPGRADES)
            .setData( { tower:_monkey_id } )
        array_push(global.achievements_order.tower,_ach_id)
        var _ach_id = "tower_unlock_special_path_"+_monkey_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_unl_s"),[_monkey_name] ),ACHIEVEMENT_MAIN_TYPE.TOWER,ACHIEVEMENT_EXACT_TYPE.TOWER_SPECIAL_PATH)
            .setData( { tower:_monkey_id } )
        array_push(global.achievements_order.tower,_ach_id)
    }
    
    var _missions = variable_struct_get_names(global.missions)
    var _missions_num = array_length(_missions)
    
    for (var i = 0; i < _missions_num; i++) {
        var _mission_id = _missions[i]
        var _mission_name = global.missions[$ _mission_id].name
        
        var _ach_id = "challenge_beat_mission_"+_mission_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_bet_m"),[_mission_name] ),ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_MISSIONS)
            .setData( { mission:_mission_id } )
        array_push(global.achievements_order.challenge,_ach_id)
    }
    
    var _bounties = variable_struct_get_names(global.bounty.list)
    var _bounties_num = array_length(_bounties)
    
    for (var i = 0; i < _bounties_num; i++) {
    	var _bounty_id = _bounties[i]
        var _bounty_name = scr_get_translation("bounty_"+_bounty_id+"_name_0")
        
        var _ach_id = "challenge_beat_bounty_"+_bounty_id
        global.achievements[$ _ach_id] = new Achievement(scr_text_format_insert( scr_get_translation("achievement_bet_b"),[_bounty_name] ),ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_BOUNTY)
        array_push(global.achievements_order.challenge,_ach_id)
    }
    
    
    var _ach_id = $"challenge_moon_temple_0"
    global.achievements[$ _ach_id] = new Achievement(scr_get_translation("achievement_bet_m_i"),ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_MOON_TEMPLE)
    array_push(global.achievements_order.challenge,_ach_id)
    var _ach_id = $"challenge_moon_temple_1"
    global.achievements[$ _ach_id] = new Achievement(scr_get_translation("achievement_bet_m_ii"),ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_MOON_TEMPLE)
    array_push(global.achievements_order.challenge,_ach_id)
    var _ach_id = $"challenge_moon_temple_2"
    global.achievements[$ _ach_id] = new Achievement(scr_get_translation("achievement_bet_m_iii"),ACHIEVEMENT_MAIN_TYPE.CHALLENGE,ACHIEVEMENT_EXACT_TYPE.CHALLENGE_MOON_TEMPLE)
    array_push(global.achievements_order.challenge,_ach_id)
    
}