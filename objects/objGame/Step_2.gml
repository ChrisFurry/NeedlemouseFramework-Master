/// @description Control Death, Debug

//--Death Control--//
if(g_event == gameEvents.playerdead){
	if(player[0].state == -1){
		if(deadTimer == 0){
			objGameData.player_lives[0] --;
			objGameGui.gui_player_onscreen = false;
			objMusic.switchActive = true;
			objMusic.switchTo = [-1,0.05,1];
		}
		deadTimer ++;
		// You still have lives
		if(deadTimer == 60 && objGameData.player_lives[0] > 0){
			instance_create_depth(0,0,0,objDeathFade);
		}else if(deadTimer == 60 && objGameData.player_lives[0] <= 0){
			// You don't have lives
			instance_create_depth(0,0,0,objGameover);
			audio_stop_play_sound(musGameOver,1,1);
		}
	}
	if(instance_exists(objGameover)){
		if(objGameover.Finished){
			game_restart(); // Simply restart the game after a game over.
		}
	}
	if(instance_exists(objDeathFade) && objGameData.player_lives[0] > 0){
		if(objDeathFade.Finished){
			deadTimer = 0;
			objGameData.player_rings[0] = 0;
			objGameData.player_rings[1] = 0;
			with(objPlayer)player_reset();
			room_restart();
			exit;
		}
	}
}


// Debug -- View invisible stuff
if(layer_exists(layer_get_id("CollTiles")))layer_set_visible(layer_get_id("CollTiles"),debug_view);
if(layer_exists(layer_get_id("CollTiles2")))layer_set_visible(layer_get_id("CollTiles2"),debug_view);
if(instance_exists(objCameraLock))objCameraLock.visible = debug_view;
if(instance_exists(parCamlockTrigger))parCamlockTrigger.visible = debug_view;
