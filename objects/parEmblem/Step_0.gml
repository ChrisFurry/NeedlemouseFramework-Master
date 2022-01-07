/// @description Insert description here
// You can write your code in this editor
if(!event_is_playing(false))exit;
var playerObj = instance_nearest(x,y,parPlayer);

if(hitTimer == 0 && place_meeting(x,y,parPlayer)){
	hitTimer = 1;
	objGameData.player_score[playerObj.player_id] += 100;
	audio_stop_play_sound(sndEmblemGet,1,1);
	visible = true;
}
if(hitTimer != 0)hitTimer ++;
if(hitTimer > 60)instance_destroy();