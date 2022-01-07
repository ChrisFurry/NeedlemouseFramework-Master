function player_isunderwater(){
	if(!instance_exists(parWater)){
		underwater = false;
		exit;
	}
	var oldWater_obj = water_obj;
	water_obj = instance_position(x,y,parWater);
	if(water_obj && !underwater){
		underwater = true;
		xspeed /= 2;
		yspeed /= 4;
		audio_stop_play_sound(sndSplash,1,1);
		// Water Splash
		if(!instance_position(x,yprevious,water_obj)){
			var effect = create_effect(sprWaterSplash,1,x,y,depth-1);
			effect.y = water_obj.bbox_top;
			if(y > water_obj.y){
				effect.y = water_obj.bbox_bottom;
				effect.image_yscale = -1;
			}
		}
		if(!instance_position(xprevious,y,water_obj)){
			var effect = create_effect(sprWaterSplash,1,x,y,depth-1);
			effect.x = water_obj.bbox_left;
			effect.image_angle = 90;
			if(x > water_obj.x){
				effect.x = water_obj.bbox_right;
				effect.image_angle = -90;
			}
		}
	}
	if(!water_obj && underwater){
		underwater = false;
		yspeed *= 2;
		audio_stop_play_sound(sndSplash,1,1);
		// Water Splash
		if(instance_position(x,yprevious,oldWater_obj)){
			var effect = create_effect(sprWaterSplash,1,x,y,depth-1);
			effect.y = oldWater_obj.bbox_top;
			if(y > oldWater_obj.y){
				effect.y = oldWater_obj.bbox_bottom;
				effect.image_yscale = -1;
			}
		}
		if(instance_position(xprevious,y,oldWater_obj)){
			var effect = create_effect(sprWaterSplash,1,x,y,depth-1);
			effect.x = oldWater_obj.bbox_left;
			effect.image_angle = 90;
			if(x > oldWater_obj.x){
				effect.x = oldWater_obj.bbox_right;
				effect.image_angle = -90;
			}
		}
	}
}