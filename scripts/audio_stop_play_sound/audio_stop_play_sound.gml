function audio_stop_play_sound(sound_index,volume,pitch){
	audio_stop_sound(sound_index);
	audio_play_sound(sound_index,1,false);
	audio_sound_gain(sound_index,volume * sfx_volume,0);
	audio_sound_pitch(sound_index,pitch);
}