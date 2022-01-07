/// @description 
if(!event_is_playing(false))exit;
image_index = (globalTimer / 4);

switch(state){
	case 0:
		if(objGameData.player_rings[0] >= 50 && g_gamemode == gamemode.normal){
			visible = true;
			var playerObj = player[0];
			if(place_meeting(x,y,playerObj)){
				state = 1;
				with(playerObj){
					state = -2;
					currShield = 0;
				}
				create_effect(sprSpecialRingBegone,1,x,y,depth);
				audio_stop_play_sound(sndSpecialRingCollect,1,1);
				visible = false;
				objGameData.specialRing_got = true;
				exit;
			}
		}else{
			visible = false;
		}
		break;
}