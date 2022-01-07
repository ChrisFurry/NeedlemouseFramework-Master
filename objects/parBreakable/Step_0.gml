/// @description 
if(!event_is_playing(false))exit;
var broke = false;
var brokedir = false;
var playerObj = instance_nearest(x,y,objPlayer);
if(!playerObj)exit;
if(playerObj.rolling){
	solid_floor = false;
	solid_walls = false;
	solid_ceiling = false;
}else{
	solid_floor = true;
	solid_walls = true;
	solid_ceiling = true;
}
if(place_meeting(x,y,objPlayer)){
	broke = true;
	brokedir = sign(objPlayer.x - (x + (sprite_width/ 2)));
}

if(broke){
	var loop = tileBreakWidth * tileBreakHeight;
	var tileSize = sprite_get_height(tileBreakSprite);
	for(var i = 0;i < loop;i ++){
		var tempx = x + ((i mod tileBreakWidth) * tileSize);
		var tempy = y + floor((i / tileBreakWidth) * tileSize);
		var block = instance_create_depth(tempx,tempy,depth,objBrokenTile);
		block.sprite_index = tileBreakSprite;
		block.image_index = tileBreakOrder[i mod array_length_1d(tileBreakOrder)];
		block.image_speed = 0;
		block.gravity = 0.2;
		var tempSpeed =  2 - (i mod tileBreakWidth);
		block.hspeed = brokedir * 4 * tempSpeed;
		block.vspeed = ((tileBreakHeight / 2) - floor((i / tileBreakWidth) * tileBreakHeight)) * tileBreakPower;
	}
	audio_stop_play_sound(sndWallBroken,1,1);
	instance_destroy();
}