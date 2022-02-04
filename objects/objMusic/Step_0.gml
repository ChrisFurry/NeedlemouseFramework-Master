/// @description Play music, fade music, ect
// Pause
if(g_event == gameEvents.paused && objGame.gamePaused){
	if(!audio_is_paused(currentMusic) && audio_exists(currentMusic))audio_pause_sound(currentMusic);
	exit;
}else{
	if(audio_is_paused(currentMusic) && audio_exists(currentMusic))audio_resume_sound(currentMusic);
}

// Play the fucking music
if(audio_exists(currentMusic)){
	// Play the music if it isn't already playing
	if(!audio_is_playing(currentMusic)){
		// Set Loop Point
		if(musicLoopArray[currentMusic] != pointer_null){
			var musicData = musicLoopArray[currentMusic];
			musicLoopPoint = musicData[0];
			musicLoopEnd = musicData[1];
		}
		audio_play_sound(currentMusic,32,true);
		audio_sound_gain(currentMusic,mus_volume,0);
	}
	// Make sure its always at its highest,
	audio_sound_gain(currentMusic,mus_volume,0);
}
// Loop the music
if(musicLoopPoint != musicLoopEnd && audio_exists(currentMusic)){
	var musicpos = audio_sound_get_track_position(currentMusic);
	if(musicpos >= musicLoopEnd){
		var newmusicpos = (musicpos - musicLoopEnd) + musicLoopPoint;
		audio_sound_set_track_position(currentMusic,newmusicpos);
	}
}
// Fade or just cut
if(switchActive){
	// Cancel the switch
	if(switchTo[0] == currentMusic){
		switchActive = false;
		exit;
	}
	// Complex Fade Code
	if(switchTo[2] == true){
		switchFade -= switchTo[1];
		var audio1Fade = 1;
		audio_sound_gain(currentMusic,clamp(switchFade * audio1Fade * mus_volume,0,1),0);
		if(switchFade <= 0)switchTo[2] = false;
	}else{
		// Save position if it's something like the level music.
		if(currentMusic == levelMusic)musicSavedPos = audio_sound_get_track_position(currentMusic);
		// Cut code
		audio_stop_sound(currentMusic);
		currentMusic = switchTo[0];
		if(audio_exists(currentMusic)){
			// Set Loop Point
			var musicData = musicLoopArray[currentMusic];
			if(is_array(musicData)){
				musicLoopPoint = musicData[0];
				musicLoopEnd = musicData[1];
			}else{
				musicLoopPoint = 0;
				musicLoopEnd = 0;
			}
			audio_play_sound(currentMusic,32,true);
			// It doesn't work btw LMFAO
			if(musicSavedPos != 0 && currentMusic == levelMusic)audio_sound_set_track_position(currentMusic,musicSavedPos);
		}
		switchActive = false;
		switchFade = 1;
	}
}