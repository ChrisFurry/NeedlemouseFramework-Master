/// @description Slightly Move
var playerObj = instance_nearest(x,y,objPlayer);
var yoffset = 0;

if(playerObj){
	if(playerObj.floor_id == id){
		yoffset = 4;
	}
}

y = lerp(y,ystart + yoffset,0.2);

// Inherit the parent event
event_inherited();

