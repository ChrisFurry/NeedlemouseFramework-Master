function player_takedamage(){
	// Cancel out damage
	if(hurt == 1 && ((player_is & PLRFLG_HURT) || (player_is & PLRFLG_DEAD) || invincible))hurt = 0;
	// Shield Damage
	if(hurt == 1 && currShield != 0){
		hurt = 0;
		player_is = PLRFLG_HURT;
		yspeed = -4;
		xspeed = sign(sign(x - hurtdir) + 0.5) * 2;
		grounded = false;
		currShield = 0;
		audio_stop_play_sound(sndPlayer_hurt,1,1);
		invincible = 2;
		inv_frames = 120;
		exit;
	}
	// Damage
	if(hurt == 1 && objGameData.player_rings[player_id] > 0){
		hurt = 0;
		player_is = PLRFLG_HURT;
		yspeed = -4;
		xspeed = sign(sign(x - hurtdir) + 0.5) * 2;
		grounded = false;
		rings_scatter(x,y,objGameData.player_rings[player_id]);
		objGameData.player_rings[player_id] = 0;
		audio_stop_play_sound(sndPlayer_ringloss,1,1);
		invincible = 2;
		inv_frames = 120;
		exit;
	}
	// Die
	if(((hurt == 1 && objGameData.player_rings[player_id] <= 0) || hurt == 2) && (player_is & PLRFLG_DEAD)){
		hurt = 0;
		player_is = PLRFLG_DEAD;
		yspeed = -8;
		xspeed = 0;
		grounded = false;
		animation = playerANI.die;
		currShield = 0;
		audio_stop_play_sound(sndPlayer_hurt,1,1);
		if(instance_number(parPlayer) == 1)g_event = gameEvents.playerdead;
		exit;
	}
}