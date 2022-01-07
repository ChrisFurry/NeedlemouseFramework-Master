function player_state_peelout(){
	// Stop Moving
	gspeed = 0;
	// Lower SpindashRev
	spindashRev = min(spindashRev + 0.5,16);
	// Release Spindash
	if(!key_up){
		state = playerState.Default;
		rolling = false;
		gspeed = spindashRev * dir;
		xspeed = gspeed;
		spindashRev = 0;
		audio_stop_sound(sndPlayer_spindashRev);
		audio_stop_play_sound(sndPlayer_spindashRelease,1,1);
		exit;
	}
	// Animations
	if(abs(spindashRev) < anim_runspd){
		animation = playerANI.walk;
	}else if(abs(spindashRev) < anim_runspd * 2){
		animation = playerANI.run;
	}else{
		animation = playerANI.peelout;
	}
	animation_subimagesforced = floor(max(0, 6 - abs(spindashRev)));
}