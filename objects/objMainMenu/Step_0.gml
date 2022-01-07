/// @description All Menu Stuff

timer ++;

// Get keys
var key_hor = keyboard_check_pressed(objGameData.key_right) - keyboard_check_pressed(objGameData.key_left);
var key_hor_hold = keyboard_check(objGameData.key_right) - keyboard_check(objGameData.key_left);
var key_vir = keyboard_check_pressed(objGameData.key_down) - keyboard_check_pressed(objGameData.key_up);
var confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(objGameData.key_a) || keyboard_check_pressed(objGameData.key_c);
var cancel = keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(objGameData.key_b);

switch(state){
	case 0:
		menuOpt += key_vir;
		if(key_vir != 0)audio_stop_play_sound(sndMenuMove,1,1);
		if(menuOpt < 0)menuOpt = 2;
		if(menuOpt > 2)menuOpt = 0;
		if(timer > 60 && confirm){
			switch(menuOpt){
				case 0: // Go to GHZ
					state = 10;
					objMusic.switchTo = [-1,0.05,1];
					objMusic.switchActive = true;
					audio_stop_play_sound(sndMenuOut,1,1);
					break;
				case 1: // Options
					state = 1;
					menuOpt = 0;
					audio_stop_play_sound(sndMenuSelect,1,1);
					break;
				case 2: // Exit Game
					state = 12;
					objMusic.switchTo = [-1,0.05,1];
					objMusic.switchActive = true;
					audio_stop_play_sound(sndMenuOut,1,1);
					break;
			}
		}
		// Menu Pos Stuff
		menuPos = lerp(menuPos,menuOpt * -baseYMove,0.2);
		menuPos2 = lerp(menuPos2,menuOpt * -baseXMove,0.2);
		break;
	case 1: // Options
		menuOpt += key_vir;
		if(key_vir != 0)audio_stop_play_sound(sndMenuMove,1,1);
		if(menuOpt < 0)menuOpt = 2;
		if(menuOpt > 2)menuOpt = 0;
		if(confirm){
			switch(menuOpt){
				case 0:
					state = 2;
					break;
				case 1:	
					state = 4;
					menuOpt = 0;
					break;
				case 2:
					objGame.window_scale ++;
					if(objGame.window_scale > 4)objGame.window_scale = 1;
					objGame.window_changescale = true;
					audio_stop_play_sound(sndMenuSelect,1,1);
					break;
			}
		}
		if(key_hor != 0 && menuOpt == 2){
			objGame.window_scale += key_hor;
			audio_stop_play_sound(sndMenuSelect,1,1);
			if(objGame.window_scale > 4)objGame.window_scale = 1;
			if(objGame.window_scale < 0)objGame.window_scale = 4;
			objGame.window_changescale = true;
		}
		if(cancel){
			state = 0;
			menuOpt = 1;
			save_settings();
		}
		// Menu Pos Stuff
		menuPos = lerp(menuPos,menuOpt * -baseYMove,0.2);
		menuPos2 = lerp(menuPos2,menuOpt * -baseXMove,0.2);
		break;
	case 2: // Find key
		menuOpt += key_vir;
		if(key_vir != 0)audio_stop_play_sound(sndMenuMove,1,1);
		if(menuOpt < 0)menuOpt = 6;
		if(menuOpt > 6)menuOpt = 0;
		if(confirm){
			state = 3;
			exit;
		}
		if(cancel){
			state = 1;
			menuOpt = 0;
			save_controls();
			exit;
		}
		// Menu Pos Stuff
		menuPos = lerp(menuPos,menuOpt * -baseYMove,0.2);
		menuPos2 = lerp(menuPos2,menuOpt * -baseXMove,0.2);
		break;
	case 3: // Get Input
		if(keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_escape)){
			state = 2;
			exit;
		}
		if(keyboard_key != 0 && keyboard_key != vk_escape && keyboard_key != vk_enter){
			switch(menuOpt){
				case 0:
					objGameData.key_up = keyboard_key;
					break;
				case 1:
					objGameData.key_down = keyboard_key;
					break;
				case 2:
					objGameData.key_left = keyboard_key;
					break;
				case 3:
					objGameData.key_right = keyboard_key;
					break;
				case 4:
					objGameData.key_a = keyboard_key;
					break;
				case 5:
					objGameData.key_b = keyboard_key;
					break;
				case 6:
					objGameData.key_c = keyboard_key;
					break;
			}
			state = 2;
			if(key_vir != 0)audio_stop_play_sound(sndMenuSelect,1,1);
			exit;
		}
		// Menu Pos Stuff
		menuPos = lerp(menuPos,menuOpt * -baseYMove,0.2);
		menuPos2 = lerp(menuPos2,menuOpt * -baseXMove,0.2);
		break;
	case 4: // Volume Settings
		if(key_vir != 0){
			switch(menuOpt){
				default:
					menuOpt = 0;
					break;
				case 0:
					menuOpt = 1;
					break;
			}
			audio_stop_play_sound(sndMenuMove,1,1);
		}
		if(key_hor_hold != 0){
			holdBuffer ++;
			if(holdBuffer == 1){ // lol funny volume code
				switch(menuOpt){
					default:
						mus_volume += sign(key_hor_hold) / 100;
						break;
					case 0:
						sfx_volume += sign(key_hor_hold) / 100;
						break;
				}
			}else if(holdBuffer > 30 && holdBuffer < 90 && globalTimer mod 5 == 0){
				switch(menuOpt){
					default:
						mus_volume += sign(key_hor_hold) / 100;
						break;
					case 0:
						sfx_volume += sign(key_hor_hold) / 100;
						break;
				}
			}else if(holdBuffer >= 90){
				switch(menuOpt){
					default:
						mus_volume += sign(key_hor_hold) / 100;
						break;
					case 0:
						sfx_volume += sign(key_hor_hold) / 100;
						break;
				}
			}
			sfx_volume = clamp(sfx_volume,0,1);
			mus_volume = clamp(mus_volume,0,1);
		}else{
			holdBuffer = 0;
		}
		if(cancel){
			state = 1;
			menuOpt = 1;
			save_settings();
			exit;
		}
		// Menu Pos Stuff
		menuPos = lerp(menuPos,menuOpt * -baseYMove,0.2);
		menuPos2 = lerp(menuPos2,menuOpt * -baseXMove,0.2);
		break;
	case 10: // Leave to level
		// Menu Pos Stuff
		menuPos = lerp(menuPos,leaveMenuTimer * -baseYMove,0.2);
		menuPos2 = lerp(menuPos2,leaveMenuTimer * -baseXMove,0.2);
		if(leaveMenuTimer > 30){
			leaveMenuZoom ++;
			leaveMenuRotate ++;
		}
		leaveMenuTimer ++;
		if(leaveMenuTimer > 180){
			room_goto(zoneGHZ2);
			exit;
		}
		break;
	case 11: // Dev Menu (unused)
		room_goto(rmDevMenu);
		exit;
		break;
	case 12: // Quit Game
		// Menu Pos Stuff
		menuPos = lerp(menuPos,leaveMenuTimer * -10,0.2);
		if(leaveMenuTimer > 30){
			leaveMenuZoom ++;
			leaveMenuRotate ++;
		}
		leaveMenuTimer ++;
		if(leaveMenuTimer > 90){
			window_set_fullscreen(false);
			
			if(objGame.screen_yscale > 2){
				objGame.screen_yscale = max(objGame.screen_yscale - 4,2);
				objGame.window_changescale = true;
			}else if(objGame.screen_xscale > 2){
				objGame.screen_xscale = max(objGame.screen_xscale - 4,2);
				objGame.window_changescale = true;
			}else{game_end()}
		}
		break;
}