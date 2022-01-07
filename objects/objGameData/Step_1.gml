/// @description Player Control Variables
if(g_event == gameEvents.playing || g_event == gameEvents.endlevel){
	for(var i = 0;i < array_length_1d(player);i ++){
		if(instance_exists(player[i])){
			if(playerHasControl[0]){
				player[i].key_up = keyboard_check(key_up);
				player[i].key_down = keyboard_check(key_down);
				player[i].key_left = keyboard_check(key_left);
				player[i].key_right = keyboard_check(key_right);
				player[i].key_a = keyboard_check(key_a);
				player[i].key_b = keyboard_check(key_b);
				player[i].key_c = keyboard_check(key_c);
	
				player[i].key_up2 = keyboard_check_pressed(key_up);
				player[i].key_down2 = keyboard_check_pressed(key_down);
				player[i].key_left2 = keyboard_check_pressed(key_left);
				player[i].key_right2 = keyboard_check_pressed(key_right);
				player[i].key_a2 = keyboard_check_pressed(key_a);
				player[i].key_b2 = keyboard_check_pressed(key_b);
				player[i].key_c2 = keyboard_check_pressed(key_c);
			}else{
				player[i].key_up = false;
				player[i].key_down = false;
				player[i].key_left = false;
				player[i].key_right = false;
				player[i].key_a = false;
				player[i].key_b = false;
				player[i].key_c = false;
	
				player[i].key_up2 = false;
				player[i].key_down2 = false;
				player[i].key_left2 = false;
				player[i].key_right2 = false;
				player[i].key_a2 = false;
				player[i].key_b2 = false;
				player[i].key_c2 = false;
			}
		}
	}
}

// Change Music depending on player current powers
if(g_event != gameEvents.paused){
	// Invincible Music
	if(player[0].invincible == 1 && objMusic.currentMusic != objMusic.invincibleMusic){
		objMusic.switchTo = [objMusic.invincibleMusic,1,0];
		objMusic.switchActive = true;
	}else if(player[0].invincible != 1 && objMusic.currentMusic == objMusic.invincibleMusic){
		objMusic.switchTo = [objMusic.levelMusic,1,0];
		objMusic.switchActive = true;
	}
	// Drowning!!!
	with(objPlayer){ // If you make a CPU Player, make sure it used objPlayer, so then it doesn't check for em.
		// Stop Music for the drowning theme, Start it if you got air
		if(drowning_timer == get_time_frames(0,0,18)){
			objMusic.switchTo = [-2,0,0];
			objMusic.switchActive = true;
			if(!audio_is_playing(musDrowning))audio_stop_play_sound(musDrowning,1,1);
		}else if(g_event != gameEvents.playerdead && objMusic.currentMusic == -2 && drowning_timer < get_time_frames(0,0,18)){
			objMusic.switchTo = [objMusic.levelMusic,0,0];
			objMusic.switchActive = true;
			if(audio_is_playing(musDrowning))audio_stop_sound(musDrowning);
		}
	}
}

// Slowdown FPS (Debug)
if(keyboard_check(vk_numpad0) && g_debug_mode){gameFPS = 10}else{gameFPS = 60}

// Change FPS
room_speed = gameFPS;

// Add to Global Timer
if(g_event != gameEvents.paused && g_event != gameEvents.playerdead)globalTimer ++;