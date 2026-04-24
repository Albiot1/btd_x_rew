global.music.play(snd_main_menu_music)
room_goto(rm_start_screen)

var _tex_array = texturegroup_get_textures( "splash_screen_group");
for (var i = 0; i < array_length(_tex_array); ++i)
{
    texture_flush(_tex_array[i]);
}