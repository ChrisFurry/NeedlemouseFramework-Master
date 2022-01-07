/// @description Change Option
// Get keys
var key_hor = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
var key_hor_hold = keyboard_check(vk_right) - keyboard_check(vk_left);
var key_vir = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
var confirm = keyboard_check_pressed(vk_enter);
var cancel = keyboard_check_pressed(vk_backspace);
// Menu stuff
switch(currMenu){
	case devMenu.main:
		currSel += key_vir;
		if(currSel < 0)currSel = 2;
		if(currSel > 2)currSel = 0;
		if(confirm){
			switch(currSel){
				case 0:
					currSel = 0;
					currMenu = devMenu.charsel;
					returnMenu = devMenu.roomsel;
					break;
				case 1:
					currSel = 0;
					currMenu = devMenu.options;
					break;
				case 2:
					game_end();
					break;
			}
		}
		break;
	case devMenu.charsel:
		currMenu = returnMenu;
		break;
	case devMenu.roomsel:
		currSel += key_vir;
		if(currSel < 0)currSel = allRooms;
		if(currSel > allRooms)currSel = 0;
		if(confirm){
			g_gamemode = gamemode.normal;
			room_goto(currSel);
			exit;
		}
		if(cancel){
			currMenu = devMenu.main;
			currSel = 0;
		}
		break;
	case devMenu.options:
		currSel += key_vir;
		if(currSel < 0)currSel = 2;
		if(currSel > 2)currSel = 0;
		// Change Settings
		switch(currSel){
			case 0: // Window Scale
				if(key_hor == 1 || confirm){
					switch(objGame.window_scale){
						default:
						case 1:
							objGame.window_scale = 2;
							break;
						case 2:
							objGame.window_scale = 3;
							break;
						case 3:
							objGame.window_scale = 4;
							break;
						case 4:
							objGame.window_scale = 1;
							break;
					}
					objGame.window_changescale = true;
					save_settings();
				}
				if(key_hor == -1){
					switch(objGame.window_scale){
						default:
						case 1:
							objGame.window_scale = 4;
							break;
						case 2:
							objGame.window_scale = 1;
							break;
						case 3:
							objGame.window_scale = 2;
							break;
						case 4:
							objGame.window_scale = 3;
							break;
					}
					objGame.window_changescale = true;
					save_settings();
				}
				break;
			case 1: // Sound control
				if(confirm){
					currMenu = devMenu.volume;
					currSel = 0;
					exit;
				}
				break;
			case 2: // Controls
				if(confirm){
					currMenu = devMenu.controls;
					currSel = 0;
					exit;
				}
				break;
		}
		if(cancel){
			currMenu = devMenu.main;
			currSel = 0;
		}
		break;
	case devMenu.controls:
		currSel += key_vir;
		if(currSel < 0)currSel = 6;
		if(currSel > 6)currSel = 0;
		if(confirm){
			currMenu = devMenu.collect_input;
			exit;
		}
		if(cancel){
			currMenu = devMenu.options;
			currSel = 2;
			save_controls();
			exit;
		}
		break;
	case devMenu.collect_input:
		if(keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_escape)){
			currMenu = devMenu.controls;
			exit;
		}
		if(keyboard_key != 0 && keyboard_key != vk_escape && keyboard_key != vk_enter){
			switch(currSel){
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
			currMenu = devMenu.controls;
			exit;
		}
		break;
	case devMenu.volume:
		if(key_vir != 0){
			switch(currSel){
				default:
					currSel = 0;
					break;
				case 0:
					currSel = 1;
					break;
			}
		}
		if(key_hor_hold != 0){
			holdBuffer ++;
			if(holdBuffer == 1){ // lol funny volume code
				switch(currSel){
					default:
						mus_volume += sign(key_hor_hold) / 100;
						break;
					case 0:
						sfx_volume += sign(key_hor_hold) / 100;
						break;
				}
			}else if(holdBuffer > 30 && holdBuffer < 90 && globalTimer mod 5 == 0){
				switch(currSel){
					default:
						mus_volume += sign(key_hor_hold) / 100;
						break;
					case 0:
						sfx_volume += sign(key_hor_hold) / 100;
						break;
				}
			}else if(holdBuffer >= 90){
				switch(currSel){
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
			currMenu = devMenu.options;
			currSel = 1;
			save_settings();
			exit;
		}
		break;
}