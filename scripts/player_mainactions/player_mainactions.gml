function player_mainactions(){
	// Temp Variables
	var key_hor = sign(key_right - key_left);
	var key_vir = sign(key_down - key_up);
	var key_vir2 = sign(key_down2 - key_up2);
	var jump = (key_a || key_b || key_c);
	var jump2 = (key_a2 || key_b2 || key_c2);
	var crouch = (key_vir == 1 && abs(gspeed) < 1);
	var lookup = (key_vir == -1 && abs(gspeed) < 1);
	// Movement
	if(!(player_is & PLRFLG_HURT)){
		if(!(player_is & PLRFLG_SPINDASH) && !(player_is & PLRFLG_PEELOUT)){
			var is_idlestate = (!(player_is & PLRFLG_ROLLING) && grounded);
			if(is_idlestate){
				// Reset Variables
				jump_variable = false;
				player_is &= ~PLRFLG_BALLFORM; // Remove Ballform Flag
				jumpAbility_used = false;
				// Rolling
				if(key_vir == 1 && abs(gspeed) >= 1 && !rolling){
					player_is |= PLRFLG_ROLLING; // Add Rolling Flag
					audio_stop_play_sound(sndPlayer_roll,1,1);
					exit;
				}
			}
		}
	}else{
		player_is = PLRFLG_HURT;
		// Change Gravity
		grav = 0.1875;
		// Landing
		if(grounded){
			player_is = 0;
			gspeed = 0;
			xspeed = 0;
			exit;
		}
		// Animation
		animation = playerANI.hurt;
	}
	
	// Animation Control
	if(animation == playerANI.walk || animation == playerANI.run || animation == playerANI.peelout)animation_subimagesforced = floor(max(0, 6 - abs(gspeed)));
	if(animation == playerANI.roll)animation_subimagesforced = floor(max(0, 4 - abs(gspeed)));
	if(animation == playerANI.push)animation_subimagesforced = floor(max(0, 8 - abs(gspeed)) * 2);
}