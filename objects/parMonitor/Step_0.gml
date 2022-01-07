/// @description Move and get destroyed
var playerObj = instance_nearest(x,y,parPlayer);
if(playerObj){
	switch(state){
		case 0:
			var player_attacking = (playerObj.attacking);
			if(player_attacking){
				solid_floor = false;
				solid_walls = false;
				solid_ceiling = true;
				if(place_meeting(x,y,playerObj)){
					create_effect(sprBoom1,1,x,y,depth - 1);
					var powerupobj = instance_create_depth(x,y,depth-1,objPowerup);
					powerupobj.powerup = powerup;
					powerupobj.powerup_value0 = powerup_value0;
					powerupobj.powerup_value1 = powerup_value1;
					powerupobj.give_to_player = playerObj.player_id;
					powerupobj.sprite_index = icon_sprite;
					state = 1;
					playerObj.yspeed = 0 - playerObj.yspeed;
					audio_stop_play_sound(sndMonitorBoom,1,1);
				}
			}else{
				solid_floor = true;
				solid_walls = true;
				solid_ceiling = true;
			}
			if(place_meeting(x,y + 8,playerObj) || (playerObj.ceiling_id == id && playerObj.ceiling_type == "Object")){
				falling = true;
				yspeed = -1.5;
				depth = 11;
			}
			break;
		case 1:
			solid_floor = false;
			solid_walls = false;
			solid_ceiling = false;
			falling = false;
			break;
	}
}
if(falling){
	yspeed += grav;
	if(collision_tile(x,bbox_bottom + yspeed,"CollTiles") && yspeed > 0){
		y -= 16;
		while(!collision_tile(x,bbox_bottom + sign(yspeed),"CollTiles")){
			y ++;
		}
		yspeed = 0;
		falling = false;
	}
	y += yspeed;
}

// Inherit the parent event
event_inherited();

