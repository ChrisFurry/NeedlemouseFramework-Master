/// @description Insert description here
// You can write your code in this editor
timer ++;
switch(state){
	case 0:
		objGameGui.gui_player_onscreen = false;
		posx[0] = max(posx[0] - 16,view_wport[0] / 2);
		if(timer > 20)posx[1] = min(posx[1] + 16,view_wport[0] / 2);
		if(timer > 40)posx[2] = max(posx[2] - 16,(view_wport[0] / 2) + 108);
		if(timer > 80)posy[0] = max(posy[0] - 16,(view_hport[0] / 2));
		if(timer > 90)posy[1] = max(posy[1] - 16,(view_hport[0] / 2) + 24);
		if(timer > 100)posy[2] = max(posy[2] - 16,(view_hport[0] / 2) + 48);
		if(timer > 110)posy[3] = max(posy[3] - 16,(view_hport[0] / 2) + 72);
		if(timer >= get_time_frames(0,0,4)){
			state = 1;
			timer = 0;
		}
		break;
	case 1:
		if(ring_bonus > 0){
			objGameData.player_score[0] += min(ring_bonus,10);
			new_score += min(ring_bonus,10);
			ring_bonus = max(ring_bonus - 10,0);
		}
		if(time_bonus > 0){
			objGameData.player_score[0] += min(time_bonus,10);
			new_score += min(time_bonus,10);
			time_bonus = max(time_bonus - 10,0);
		}
		if(perfect_bonus > 0){
			objGameData.player_score[0] += min(perfect_bonus,10);
			new_score += min(perfect_bonus,10);
			perfect_bonus = max(perfect_bonus - 10,0);
		}
		if((keyboard_check_pressed(objGameData.key_a) || keyboard_check_pressed(objGameData.key_b) || keyboard_check_pressed(objGameData.key_c)) || (ring_bonus == 0 && time_bonus == 0 && perfect_bonus <= 0)){
			objGameData.player_score[0] += ring_bonus + time_bonus + ((perfect_bonus > -1) * perfect_bonus);
			new_score += ring_bonus + time_bonus + ((perfect_bonus > -1) * perfect_bonus);
			ring_bonus = 0;
			time_bonus = 0;
			perfect_bonus = min(perfect_bonus,0);
			
			audio_stop_play_sound(sndScoreTally,1,1);
			state = 2;
			timer = 0;
			exit;
		}
		audio_stop_play_sound(sndScore_BonusTick,1,1);
		break;
	case 2:
		objGameData.checkpoint_active = false;
		objGameData.checkpoint_object = -1;
		objGameData.player_rings[0] = 0;
		objGameData.player_rings[1] = 0;
		if(!stayAfterTally){
			if(timer > get_time_frames(0,0,2)){
				posx[0] += 16;
				posx[1] -= 16;
				posx[2] += 16;
				posy[0] -= 16;
				posy[1] -= 16;
				posy[2] -= 16;
				posy[3] -= 16;
			}
		}else{
			// Special Stage
			if(objGameData.specialRing_got && !instance_exists(objSpecialStageFade)){
				instance_create_depth(0,0,-1000,objSpecialStageFade);
			}else if(instance_exists(objSpecialStageFade)){
				if(objSpecialStageFade.Finished)room_goto(rmDebugSpecialStage);
			}
			if(!objGameData.specialRing_got && !instance_exists(objActclearFade)){
				instance_create_depth(0,0,-1000,objActclearFade);
			}else if(instance_exists(objActclearFade)){
				if(objActclearFade.Finished)room_goto(objGameData.return_room);
			}
		}
		break;
}