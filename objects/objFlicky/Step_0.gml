/// @description 
if(!event_is_playing(false))exit;
switch(state){
	case 0:
		y += yspeed;
		yspeed += grav;
		var floorcheck1 = player_checktile(x,bbox_bottom,0,8,0,"CollTiles");
		if(floorcheck1){
			yspeed = ybounce;
			state = 1;
		}
		spriteFrame = 0;
		break;
	case 1:
		x += 3 * dir;
		y += yspeed;
		yspeed += grav;
		spriteFrame = 2;
		if(yspeed < 0)spriteFrame = 1;
		var floorcheck1 = player_checktile(x,bbox_bottom,0,8,0,"CollTiles");
		if(floorcheck1){
			yspeed = ybounce;
		}
		break;
}
if(!is_on_screen(0))instance_destroy();