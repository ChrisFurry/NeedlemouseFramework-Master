/// @description 
if(!event_is_playing(false))exit;
image_index = (globalTimer / 8);
var obj = instance_nearest(x,y,objPlayer);

if(place_meeting(x,y,obj) && obj.state != playerState.Hurt){
	create_effect(sprRingCollect,1,x,y,depth);
	audio_stop_play_sound(sndRingCollect,1,1);
	objGameData.player_rings[obj.player_id] ++;
	instance_destroy();
	exit;
}
// Movement
if(movementActive){
	x += xspeed;
	y += yspeed;
	yspeed += grav;
}
// Collision
if(collActive){
	if(yspeed > 0 && (collision_point(x,bbox_bottom,parSolid,true,true) || collision_tile(x,bbox_bottom,"CollTiles"))){
		yspeed = 0 - yspeed;
	}
}
// Lifespan
if(lifeTimerActive){
	if(lifeTimer < 0){
		instance_destroy();
		exit;
	}
	lifeTimer --;
}