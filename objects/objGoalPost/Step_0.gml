/// @description 
if(!event_is_playing(false))exit;
switch(state){
	case 0:
		eggmanFrame = 0;
		var playerObj = player[0];
		if(!playerObj)exit;
		if(playerObj.x > x){
			state = 1;
			objCamera.camera_lockL = x - objGame.screen_xscale / 2;
			objCamera.camera_lockR = x + objGame.screen_xscale / 2;
			spinSpd = 24;
			postSprite = playerObj.goalpostSprite;
			audio_stop_play_sound(sndGoalpost_spin,1,1);
			objRoomDefiner.timer_active = false;
			g_event = gameEvents.endlevel;
			playerObj.invincible = 0;
			objGameData.return_room = objRoomDefiner.next_level;
		}
		break;
	case 1:
		eggmanFrame = 1;
		rotation -= spinSpd;
		rotation = angle_wrap(rotation);
		spintimer ++;
		if(round(globalTimer) mod 8 == 0){
			create_effect(sprRingCollect,1,x + irandom_range(-24,24),y + irandom_range(-24,0),depth - 1);
		}
		if(spintimer >= 90){
			// Slow down the spin
			spinSpd = max(spinSpd - 0.15,5);
			// Stop Music
			if(objMusic.currentMusic != -1){
				objMusic.switchActive = true;
				objMusic.switchTo = [-1,0.01,1];
			}
		}
		if(spinSpd <= 5 && round(rotation) <= 270 && round(rotation) >= 250){
			// End of act
			state = 2;
		}
		break;
	case 2:
		var playerObj = player[0];
		if(!playerObj)exit;
		if(playerObj.grounded || playerObj.state == -2){
			if(playerObj.state != -2){
				playerObj.state = playerObj.statevictory;
			}
			instance_create_depth(0,0,-1,objActClear);
			audio_stop_play_sound(musActClear,1,1);
			state = 3;
			exit;
		}
		break;
}