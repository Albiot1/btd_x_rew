page = 0

enum COMPLETION_MARK {
    NOT_COMPLETED,
    COMPLETED,
    COMPLETED_TIME
}

list = [
    global.challenges.deflation,
    global.challenges.antishield,
    global.challenges.starveout,
    global.challenges.necronomicon,
    global.challenges.mvsgoliath,
    global.challenges.redcross,
    global.challenges.onetrace,
    global.challenges.llrace,
    global.challenges.maxpower,
    global.challenges.swarmsupport,
    global.challenges.supramonkey,
    global.challenges.lfast
]

number = array_length(list)
max_page = ceil(number/4)-1

mouse_on = -1

challenge_creator_text = scr_get_translation("challenge_creator_text")
challenge_completed_text = [ scr_get_translation("challenge_completed"),scr_get_translation("challenge_completed_time") ]
challenge_not_completed_text = scr_get_translation("challenge_notcompleted")

instance_create_depth(4,5,depth,obj_exit_button)