/// @description The jump

if(!event_is_playing(false) || !is_on_screen(64))exit;
// The move
if(y >= ystart){
	yspeed = ylaunch;
	y = ystart;
}
y += yspeed;
yspeed += grav;

// The collision
var playerid = instance_nearest(x,y,parPlayer);
if(playerid)var playerColl = place_meeting(x,y,playerid);
if(!playerid)exit;
if(playerColl){
	if(playerid.attacking){
		hp --;
		playerid.yspeed = -abs(playerid.yspeed);
	}else{
		playerid.hurt = 1;
		playerid.hurtdir = x;
	}
}

if(hp <= 0){
	create_effect(sprBoom1,1,x,y,depth - 1);
	audio_stop_play_sound(sndMonitorBoom,1,1);
	instance_create_depth(x,y,depth,objFlicky);
	create_give_points(x,y,floor(playerid.combo / 2),playerid);
	playerid.combo ++;
	instance_destroy();
}