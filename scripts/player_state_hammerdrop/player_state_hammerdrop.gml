function player_state_hammerdrop(){
	// Temp Var
	var key_hor = sign(key_right - key_left);
	// Movement
	if(key_hor != 0){
		dir = key_hor;
		if((xspeed * key_hor) < top_gspeed)xspeed += ((airacc) * key_hor);
	}
	// Air Drag
	if (yspeed < 0 && yspeed > -4){
		xspeed -= ((xspeed / 0.125) / 256);
	}
	// Gravity
	yspeed += grav;
	// Landing
	if(grounded){
		if(angle <= 22.5 || angle >= 360 - 22.5){
			state = playerState.Default;
			rolling = true;
			grounded = false;
			yspeed = -4;
			ball_form = true;
			audio_stop_play_sound(sndPlayer_thud,1,1);
			// Effects
			var eff = create_effect(sprSmallDust,1,x,y + sensor_height,depth - 1);
			eff.hspeed = -2;
			eff.gravity = -0.1;
			var eff = create_effect(sprSmallDust,1,x,y + sensor_height,depth - 1);
			eff.hspeed = -1;
			eff.gravity = -0.2;
			var eff = create_effect(sprSmallDust,1,x,y + sensor_height,depth - 1);
			eff.hspeed = 2;
			eff.gravity = -0.1;
			var eff = create_effect(sprSmallDust,1,x,y + sensor_height,depth - 1);
			eff.hspeed = 1;
			eff.gravity = -0.2;
			exit;
		}else{
			state = playerState.Default;
			ball_form = true;
			gspeed *= 1.2;
			audio_stop_play_sound(sndPlayer_spindashRelease,1,1.5);
			exit;
		}
	}
	// Animation
	animation = playerANI.hammerdrop;
}