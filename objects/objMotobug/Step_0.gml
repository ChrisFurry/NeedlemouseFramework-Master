/// @description Do the move

if(!event_is_playing(false) || !is_on_screen(64))exit;

switch(state){
	case 0:
		animframe = (animframe + (5 / 60)) mod 4;
		// Move
		x += dir;
		// Check Walls
		if(dir){
			var wallcheck1 = player_checktile(bbox_right,y,0,0,0,"CollTiles");
			var wallcheck2 = player_checkobject(bbox_right,y,0,0,0,parSolid);
		}else{
			var wallcheck1 = player_checktile(bbox_left,y,0,0,0,"CollTiles");
			var wallcheck2 = player_checkobject(bbox_left,y,0,0,0,parSolid);
		}
		// Check floor
		var floorcheck1 = player_checktile(x + dir,bbox_bottom,0,8,0,"CollTiles");
		var floorcheck3 = player_checktile(x,bbox_bottom,0,8,0,"CollTiles");
		// Move if check successful
		if(floorcheck3){
			for(var i = 0;i < 16;i++){
				var check = player_checktile(x,bbox_bottom,0,0,0,"CollTiles");
				if(check){
					y --;
					break;
				}
				y ++;
			}
		}
		// Turn State
		if(wallcheck1 || wallcheck2 || !floorcheck1){
			state = 1;
			exit;
		}
		break;
	case 1:
		// Turn
		animframe = 0;
		timer ++;
		if(timer > 60){
			timer = 0;
			dir = -dir;
			state = 0;
		}
		break;
}
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
	create_effect(sprBoom1,1,x,y,depth-1);
	audio_stop_play_sound(sndMonitorBoom,1,1);
	instance_create_depth(x,y,depth,objFlicky);
	create_give_points(x,y,floor(playerid.combo / 2),playerid);
	playerid.combo ++;
	instance_destroy();
}