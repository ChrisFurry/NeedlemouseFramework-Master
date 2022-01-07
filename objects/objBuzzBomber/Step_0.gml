/// @description Do da move

if(!event_is_playing(false) || !is_on_screen(64))exit;

switch(state){
	case 0:
		x += dir * 4;
		timer = max(timer - 1,0);
		var playerObj = instance_nearest(x,y,objPlayer);
		var playerRight = (dir == 1 && playerObj.x > x + 32);
		var playerLeft = (dir == -1 && playerObj.x < x - 32);
		if(playerObj && timer <= 0){
			if(distance_to_object(playerObj) < 86 && (playerRight || playerLeft)){
				state = 2;
				exit;
			}
		}
		if(dir == -1 && x < xstart - 256){
			state = 1;
			timer = 0;
		}
		if(dir == 1 && x > xstart + 256){
			state = 1;
			timer = 0;
		}
		break;
	case 1:
		timer ++;
		if(timer > 60){
			dir = -dir;
			state = 0;
			timer = 0;
			exit;
		}
		break;
	case 2:
		timer ++;
		if(timer > 60){
			var bullet = instance_create_depth(x + launchxoff * dir,y + launchyoff,depth,objBuzzBomberBullet);
			bullet.dir = dir;
			state = 0;
			timer = 60;
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