/// @description Move Camera
if(event_is_playing(false)){
	if(instance_exists(player[number_id])){
		// Camera target stuff
		if(camera_followplayer){
			camera_xtarget += objGame.screen_xscale / 2;
			camera_ytarget += objGame.screen_yscale / 2;
			// unExtend things
			camera_xtarget -= camera_xextend;
			// Margins
			camera_xtarget = max(camera_xtarget,player[number_id].x - camera_marginR);
			camera_xtarget = min(camera_xtarget,player[number_id].x - camera_marginL);
			camera_ytarget = max(camera_ytarget,player[number_id].y - camera_marginD);
			camera_ytarget = min(camera_ytarget,player[number_id].y - camera_marginU);
			if(camera_extend){
				// Extend bc of spindash or peelout
				if(player[number_id].state == playerState.Spindash || player[number_id].state == playerState.Peelout || abs(player[number_id].gspeed) >= player[number_id].anim_runspd - 1){
					if(player[number_id].gspeed > 0 || (player[number_id].gspeed == 0 && player[number_id].dir == 1))camera_xextend = min(camera_xextend + 2,64);
					if(player[number_id].gspeed < 0 || (player[number_id].gspeed == 0 && player[number_id].dir == -1))camera_xextend = max(camera_xextend - 2,-64);
				}else{
					camera_xextend = max(abs(camera_xextend) - 2,0) * sign(camera_xextend);
				}
			}else{
				camera_xextend = 0;
				camera_yextend = 0;
			}
			// Extend things
			camera_xtarget += camera_xextend;
			// Ground Lerp
			if(player[number_id].grounded){
				camera_ytarget = lerp(camera_ytarget,player[number_id].y,0.2);
			}
			// Center
			camera_xtarget -= objGame.screen_xscale / 2;
			camera_ytarget -= objGame.screen_yscale / 2;
			// Lock player in
			if(player_lockedin){
				if(player[number_id].x < camera_lockL){
					player[number_id].x = camera_lockL;
					player[number_id].gspeed = 0;
					player[number_id].xspeed = 0;
				}
				if(player[number_id].x > camera_lockR){
					player[number_id].x = camera_lockR;
					player[number_id].gspeed = 0;
					player[number_id].xspeed = 0;
				}
				// kill (endless pit)
				if(player[number_id].y > camera_lockD + 32 && player[number_id].y > camera_y + objGame.screen_yscale + 32)player[number_id].hurt = 2;
			}
		}
	}
	// Lock camera target area.
	camera_xtarget = clamp(camera_xtarget,camera_lockL,camera_lockR - objGame.screen_xscale);
	camera_ytarget = clamp(camera_ytarget,camera_lockU,camera_lockD - objGame.screen_yscale);
	// Move the main camera depending on the state!
	switch(camera_state){
		case 0:
			camera_state_timer = 0;
			if(camera_x != camera_xtarget){
				if(camera_x < camera_xtarget)camera_x = min(camera_x + (camera_speed),round(camera_xtarget));
				if(camera_x > camera_xtarget)camera_x = max(camera_x - (camera_speed),round(camera_xtarget));
			}
			if(camera_y != camera_ytarget){
				if(camera_y < camera_ytarget)camera_y = min(camera_y + (camera_speed),round(camera_ytarget));
				if(camera_y > camera_ytarget)camera_y = max(camera_y - (camera_speed),round(camera_ytarget));
			}
			break;
		case 1: // Move slowly... to fastly
			camera_state_timer = min(camera_state_timer + 1, camera_speed * 2);
			if(camera_x != camera_xtarget){
				if(camera_x < camera_xtarget)camera_x = min(camera_x + (camera_state_timer * 0.5),round(camera_xtarget));
				if(camera_x > camera_xtarget)camera_x = max(camera_x - (camera_state_timer * 0.5),round(camera_xtarget));
			}
			if(camera_y != camera_ytarget){
				if(camera_y < camera_ytarget)camera_y = min(camera_y + (camera_state_timer * 0.5),round(camera_ytarget));
				if(camera_y > camera_ytarget)camera_y = max(camera_y - (camera_state_timer * 0.5),round(camera_ytarget));
			}
			if(camera_x == camera_xtarget && camera_y == camera_ytarget){
				state = 1;
			}
			break;
		case 2: // Move Y Slowly
			camera_state_timer = 0;
			if(camera_x != camera_xtarget){
				if(camera_x < camera_xtarget)camera_x = min(camera_x + (camera_speed),round(camera_xtarget));
				if(camera_x > camera_xtarget)camera_x = max(camera_x - (camera_speed),round(camera_xtarget));
			}
			if(camera_y != camera_ytarget && (camera_y > camera_lockD - objGame.screen_yscale || camera_y < camera_lockU)){
				if(camera_y < camera_ytarget)camera_y = min(camera_y + (2),round(camera_ytarget));
				if(camera_y > camera_ytarget)camera_y = max(camera_y - (2),round(camera_ytarget));
			}else if(camera_y != camera_ytarget){
				if(camera_y < camera_ytarget)camera_y = min(camera_y + (camera_speed),round(camera_ytarget));
				if(camera_y > camera_ytarget)camera_y = max(camera_y - (camera_speed),round(camera_ytarget));
			}
			if(camera_x == camera_xtarget && camera_y == camera_ytarget){
				state = 1;
			}
			break;
	}
}
camera_set_view_pos(view_camera[number_id],camera_x,camera_y);