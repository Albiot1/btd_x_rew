page = 0

list = [
    global.missions.color_splash,
    global.missions.non_stop_assault,
    global.missions.flood,
    global.missions.blimp_brigade,
    global.missions.necropolis,
    global.missions.solar_storm,
    global.missions.prison_break_1,
    global.missions.prison_break_2,
    global.missions.prison_break_3,
    global.missions.prison_break_4,
    global.missions.ultra_break_v1,
    global.missions.ultra_break_v4
]

number = array_length(list)

desc = array_create( number,"" )
desc_h = array_create( number, 0 )

start_x = 96
start_y = 16
spacing_x = 448
spacing_y = 184

for (var i = 0; i < number; i++) {
    var _mission = list[i]
    var _completed = _mission.completed
    var _desc = _mission.desc
    
    if _completed == true{
        _desc += "\n" + mission_completed_text
    }
    
    desc[i] = _desc
    desc_h[i] = string_height_ext(_desc,16,356)
}

max_page = ceil((number-4)/2)-1

mouse_on = -1

mission_completed_text = scr_get_translation("mission_completed_text")

instance_create_depth(4,5,depth,obj_exit_button)