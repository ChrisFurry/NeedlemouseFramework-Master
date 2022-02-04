function player_drowningTimer(){
	// lol
	drowning_timer = (drowning_timer * underwater) + (underwater);
	if(drowning_timer == get_time_frames(0,0,5) || drowning_timer == get_time_frames(0,0,10) || drowning_timer == get_time_frames(0,0,15))audio_stop_play_sound(sndPlayer_airTimer,1,1);
	// Spawn bubble Numbers
	if(drowning_timer == get_time_frames(0,0,18)){
		var bubble = instance_create_depth(x,y,0,objDrowningNumbers);
		bubble.sprite_index = sprDrowning5;
	}
	if(drowning_timer == get_time_frames(0,0,20)){
		var bubble = instance_create_depth(x,y,0,objDrowningNumbers);
		bubble.sprite_index = sprDrowning4;
	}
	if(drowning_timer == get_time_frames(0,0,22)){
		var bubble = instance_create_depth(x,y,0,objDrowningNumbers);
		bubble.sprite_index = sprDrowning3;
	}
	if(drowning_timer == get_time_frames(0,0,24)){
		var bubble = instance_create_depth(x,y,0,objDrowningNumbers);
		bubble.sprite_index = sprDrowning2;
	}
	if(drowning_timer == get_time_frames(0,0,26)){
		var bubble = instance_create_depth(x,y,0,objDrowningNumbers);
		bubble.sprite_index = sprDrowning1;
	}
	if(drowning_timer == get_time_frames(0,0,28)){
		var bubble = instance_create_depth(x,y,0,objDrowningNumbers);
		bubble.sprite_index = sprDrowning0;
	}
	if(drowning_timer >= get_time_frames(0,0,30) && g_event != gameEvents.playerdead){
		hurt = 0;
		state = statedead;
		yspeed = 0;
		xspeed = 0;
		grounded = false;
		animation = playerANI.drown;
		currShield = 0;
		audio_stop_play_sound(sndPlayer_drown,1,1);
		drowningBubbles_timer = 60;
		if(instance_number(parPlayer) == 1)g_event = gameEvents.playerdead;
		exit;
	}
	// Bubbles
	if(underwater && globalTimer mod 60 == 0){
		instance_create_depth(x + (8 * dir),y-16,depth-1,objBubbles_Tiny);
	}
}