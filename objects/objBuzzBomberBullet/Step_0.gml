/// @description Move

if(!event_is_playing(false))exit;
if(!is_on_screen(64))instance_destroy();

x += movespd * dir;
y += movespd;

var collcheck = place_meeting(x,y,parSolid);
var collcheck2 = player_checktile(x,y,0,0,0,"CollTiles");

if(collcheck || collcheck2)instance_destroy();

var playerObj = instance_nearest(x,y,parPlayer);
if(playerObj){
	if(place_meeting(x,y,playerObj)){
		playerObj.hurt = 1;
		playerObj.hurtdir = x;
	}
}