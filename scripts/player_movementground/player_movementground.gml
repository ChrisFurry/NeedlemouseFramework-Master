function player_movementground(){
	// Reset Variables
	wall_id = false;
	wall_type = "None";
	ceiling_id = false;
	ceiling_type = "None";
	//var solidObj = parSolid;
	// Slope Factor
	if(gspeed != 0){
		if((gspeed > 0 && angle_fake < 180) || (gspeed < 0 && angle_fake > 180))gspeed -= (slope_factor_up * sine[angle_fake]);
		if((gspeed > 0 && angle_fake > 180) || (gspeed < 0 && angle_fake < 180))gspeed -= (slope_factor_down * sine[angle_fake]);
	}
	// Calculate Steps
	/* Steps are basically "LETS GOOO NO SPEED CAP" */
	var absgspeed = abs(gspeed);
	var total_steps = ceil(absgspeed / max_speed);
	if(total_steps == 0)total_steps = 1;
	var dist = absgspeed;
	// Start loop
	repeat(total_steps){
		// Change Wall Sensor Y Offset
		sensor_ywall = ((angle_fake == 0 && state != playerState.Rolling) * 8);
		// Calculate Step
		var step = min(dist, max_speed) * sign(gspeed);
		if(dist > 0)dist -= abs(step);
		// Change Speed Variables
		xspeed = gspeed * cosine[angle];
		yspeed = gspeed * -sine[angle];
		var movexspeed = step * cosine[angle];
		var moveyspeed = step * -sine[angle];
		// Wall Decection
		var collwall = player_wallcollision(x + (movexspeed),y + (moveyspeed),0,0,sensor_angle,sign(movexspeed));
		if(collwall[0]){
			var pX = x;
			var pY = y;
			pX = round(pX);
			pY = round(pY);
			repeat(16){ // MOVE BACK
				var check = player_wallcollision(pX,pY,sign(gspeed),0,sensor_angle,sign(movexspeed));
				if(check[0]){
					pX -= cosine[sensor_angle] * sign(gspeed);
					pY += sine[sensor_angle] * sign(gspeed);
				}else break;
			}
			repeat(16){ // MOVE FORWARD
				var check = player_wallcollision(pX,pY,sign(gspeed),0,sensor_angle,sign(movexspeed));
				if(!check[0]){
					pX += cosine[sensor_angle] * sign(gspeed);
					pY -= sine[sensor_angle] * sign(gspeed);
				}else break;
			}
			x = round(pX); // Round and set
			y = round(pY);
			wall_id = collwall[0];
			wall_type = collwall[1];
			gspeed = 0;
			xspeed = 0;
			yspeed = 0;
			dist = 0;
			movexspeed = 0;
			moveyspeed = 0;
			step = 0;
		}
		// Move Player
		x += movexspeed;
		y += moveyspeed;
		// Virticle Detection
		// Ceiling
		var collceil = player_ceilingcollision(x,y,0,0,sensor_angle);
		if(collceil[0]){
			ceiling_id = collceil[0];
			ceiling_type = collceil[1];
		}
		// Lock to ground
		if(floor_id){
			if(instance_exists(floor_id) && floor_type == "Object" || floor_id && floor_type == "Tile"){
				var pX = x - (sine[sensor_angle] * 16);
				var pY = y - (cosine[sensor_angle] * 16);
				for(var i = 0;i < 32;i++){
					var check = player_floorcollision(pX,pY,0,1,sensor_angle);
					if(check[0]){
						x = pX;
						y = pY;
						if(cosine[sensor_angle] == 1)y = floor(y);
						if(cosine[sensor_angle] == -1)y = ceil(y);
						if(sine[sensor_angle] == 1)x = floor(x);
						if(sine[sensor_angle] == -1)x = ceil(x);
						break;
					}
					pX += sine[sensor_angle];
					pY += cosine[sensor_angle];
				}
				floor_id = check[0];
				if(floor_id){
					floor_type = check[1];
					if(floor_type == "Tile"){
						floor_mirror = tempTileData_Mirror;
						floor_flip = tempTileData_Flip;
					}
					angle = player_getangle(angle,floor_id,floor_type);
					angle_fake = angle;
					sensor_angle = angle_wrap(round(angle / 90) * 90);
				}else{
					grounded = false;
					floor_id = false;
					floor_type = "None";
				}
			}else{
				grounded = false;
				floor_id = false;
				floor_type = "None";
			}
		}else{
			grounded = false;
			floor_id = false;
			floor_type = "None";
		}
	}
	// Fall off angle
	if(angle_fake >= 69 && angle_fake <= 293 && abs(gspeed) < fall_speed){
		grounded = false;
		angle = 0;
		horizontal_control_lock = 30;
		exit;
	}
	// Slip on Angle
	if(angle_fake >= 35 && angle_fake <= 326 && abs(gspeed) < fall_speed){
		if(angle_fake < 180)gspeed += -0.5; else gspeed += 0.5;
		horizontal_control_lock = 30;
	}
}