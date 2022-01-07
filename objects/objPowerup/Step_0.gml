/// @description Move up and give power
timer ++;
y = max(ystart - (timer * 2),ystart - 64);

if(timer == 60){
	switch(powerup){
		case "give_rings":
			objGameData.player_rings[give_to_player] += powerup_value0;
			audio_stop_play_sound(sndRingCollect,1,1);
			break;
		case "give_lives":
			objGameData.player_lives[give_to_player] += powerup_value0;
			audio_stop_play_sound(sndRingCollect,1,1);
			break;
		case "give_shield":
			player[give_to_player].currShield = powerup_value0;
			audio_stop_play_sound(sndShieldGet,1,1);
			break;
		case "give_inv":
			player[give_to_player].invincible = powerup_value0;
			player[give_to_player].inv_frames = powerup_value1;
			break;
		case "give_speedshoes":
			player[give_to_player].speedshoes = powerup_value0;
			player[give_to_player].speedshoes_frames = powerup_value1;
			break;
	}
}

if(timer > 100)instance_destroy();