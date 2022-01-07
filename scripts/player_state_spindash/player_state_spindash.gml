function player_state_spindash(){
	// Stop Moving
	gspeed = 0;
	// Get Temp ABC Input
	var key_abc2 = (key_a2 || key_b2 || key_c2);
	// Lower SpindashRev
	spindashRev = clamp(spindashRev - ((spindashRev / 0.125) / 256),2,8);
	// Press the rev key lol
	if(key_abc2){
		animation_frame = 0;
		spindashRev += 2;
		audio_stop_play_sound(sndPlayer_spindashRev,1,(spindashRev + 6) / 8);
	}
	// Release Spindash
	if(!key_down){
		state = playerState.Default;
		rolling = true;
		ball_form = true;
		gspeed = (8 + (floor(spindashRev) / 2)) * dir;
		xspeed = gspeed;
		spindashRev = 0;
		audio_stop_sound(sndPlayer_spindashRev);
		audio_stop_play_sound(sndPlayer_spindashRelease,1,1);
		exit;
	}
	// Animations
	animation = playerANI.spindash;
	if(spindashRev >= 6)animation = playerANI.spindashFast;
}