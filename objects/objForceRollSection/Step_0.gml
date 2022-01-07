/// @description 
if(!event_is_playing(false))exit;
with(objPlayer){
	if(instance_position(x,y,other)){
		if(!rolling && grounded){
			state = playerState.Default;
			rolling = true;
			audio_stop_play_sound(sndPlayer_roll,1,1);
		}
		if(grounded && abs(gspeed) < 1){
			var whatthe = sign(gspeed);
			if(whatthe == 0)whatthe = 1;
			gspeed = whatthe * 2;
			audio_stop_play_sound(sndPlayer_roll,1,1);
		}
		if(needle_personaltouch){
			gspeed += dir * airacc;
		}
	}
}