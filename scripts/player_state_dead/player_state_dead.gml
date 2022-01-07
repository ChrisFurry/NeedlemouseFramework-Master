function player_state_dead(){
	x += xspeed;
	y += yspeed;
	yspeed += grav;
	// Funny joke
	if(keyboard_check(objGameData.key_left) && keyboard_check(objGameData.key_right)){
		animation = playerANI.walk;
		animation_frame = 0;
		dir = 0 - dir;
	}
	// Drown Bubbles
	if(drowningBubbles_timer){
		var eff = instance_create_depth(x + irandom_range(-5,5),y,0,objBubbles_Tiny);
		if(drowningBubbles_timer > 30)eff.sprite_index = sprMediumBubbles;
		drowningBubbles_timer --;
	}
	// Everything else
	objCamera.camera_followplayer = false;
	objCamera.player_lockedin = false;
	if(y > objCamera.camera_y + view_hport[0] + 128){
		state = -1;
		exit;
	}
}