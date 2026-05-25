enum MUSIC_STATE {
    LOWER_GAIN,
    GAIN_BACK,
    NONE
}

global.gain = {
    music: 1,
    sound: 1,
    setSound: function (_gain){
        
        sound = _gain
        
        var _sounds = [
            snd_blimp_destroyed,
            snd_blimp_hit,
            snd_bounty_btfo,
            snd_ceramic_hit,
            snd_large_boom,
            snd_lead_hit,
            snd_lightning,
            snd_popp,
            snd_popping,
            snd_small_boom,
            snd_temple,
            snd_tower_place,
            snd_tower_select,
            snd_upgrade,
            snd_winning
        ]
        
        for (var i = 0; i < array_length(_sounds); i++) {
        	var _snd = _sounds[i]
            audio_sound_gain(_snd,_gain,0)
        }
        
    },
    setMusic: function (_gain){
        
        music = _gain
        with global.music{
            if changing == MUSIC_STATE.NONE{
                gain_real = gain*_gain
                audio_emitter_gain(emitter,gain_real,0)
            }
        }
        
    }
}

global.music = {
    current: -1,
    next: -1,
    changing: MUSIC_STATE.NONE,
    gain: 1,
    gain_real: 1,
    paused: false,
    emitter: audio_emitter_create(),
    change: function (_music){
        changing = MUSIC_STATE.LOWER_GAIN
        next = _music
    },
    pause: function (){
        audio_pause_sound(current)
        paused = true
    },
    stop: function (){
        audio_stop_sound(current)
        current = -1
    },
    unpause: function (){
        audio_resume_sound(current)
        paused = false
    },
    play: function (_music){
        current = audio_play_sound_on(emitter,_music,true,5)
    },
    step: function (){
        switch (changing) {
        	case MUSIC_STATE.NONE:
            break;
            case MUSIC_STATE.LOWER_GAIN:
                
                gain = lerp(gain,0,0.15)
                gain_real = gain*global.gain.music
                if gain<=0.1{
                    stop()
                    if next != -1{
                        play(next)
                        next = -1
                    }
                    changing = MUSIC_STATE.GAIN_BACK
                }
                
                audio_emitter_gain(emitter,gain_real,0)
                
            break;
            case MUSIC_STATE.GAIN_BACK:
                
                gain = lerp(gain,1,0.15)
                gain_real = gain*global.gain.music
                if gain>=0.99{
                    gain = 1
                    changing = MUSIC_STATE.NONE
                }
                
                audio_emitter_gain(emitter,gain_real,0)
                
            break;
        }
        
    }
}

