/// @description Bubble stuff

timer ++;
var playerobj = instance_nearest(x,y,parPlayer);
if(timer > 60 && place_meeting(x,y,playerobj)){
	playerobj.state = playerState.Default;
	playerobj.ball_form = false;
	playerobj.xspeed = 0;
	playerobj.yspeed = 0;
	playerobj.gspeed = 0;
	playerobj.drowning_timer = 0;
	audio_stop_play_sound(sndPlayer_gulp,1,1);
	create_effect(sprBigBubblePop,1,x,y,depth);
	instance_destroy();
}
vspeed = max(vspeed - 0.05,-1);
if(!instance_position(x,y,parWater)){
	create_effect(sprBigBubblePop,1,x,y,depth);	
	instance_destroy();
}