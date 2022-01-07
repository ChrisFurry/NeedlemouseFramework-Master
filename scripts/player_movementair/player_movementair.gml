function player_movementair(){
	// Reset Variables
	floor_id = false;
	floor_type = "None";
	wall_id = false;
	wall_type = "None";
	ceiling_id = false;
	ceiling_type = "None";
	angle = 0;
	angle_fake = 0;
	sensor_angle = angle_wrap(round(gravAngle / 90) * 90);
	sensor_ywall = 0;
	// Calculate Steps
	/* Steps are basically "LETS GOOO NO SPEED CAP" ??*/
	var absxspeed = abs(xspeed);
	var absyspeed = abs(yspeed);
	var total_stepsx = ceil(absxspeed / max_speed);
	if(total_stepsx == 0)total_stepsx = 1;
	var total_stepsy = ceil(absyspeed / max_speed);
	if(total_stepsy == 0)total_stepsy = 1;
	var distx = absxspeed;
	var disty = absyspeed;
	var total_steps = max(total_stepsx,total_stepsy);
	var gravadd = grav;
	// Start loop
	repeat(total_steps){
		// Calculate Step
		var stepx = min(distx, max_speed) * sign(xspeed);
		if(distx > 0)distx -= abs(stepx);
		var stepy = min(disty, max_speed) * sign(yspeed);
		if(disty > 0)disty -= abs(stepy);
		// Wall Decection
		var collwall = player_wallcollision(x + (stepx),y + (stepy),0,0,sensor_angle,sign(stepx));
		if(collwall[0]){
			var pX = x - (cosine[sensor_angle] * 16) * sign(stepx);
			var pY = y + (sine[sensor_angle] * 16) * sign(stepx);
			for(var i = 0;i < 16 + sensor_wall;i++){
				var check = player_wallcollision(pX,pY,sign(stepx),0,sensor_angle,sign(stepx));
				if(check[0]){
					x = pX;
					y = pY;
					break;
				}
				pX += cosine[sensor_angle] * sign(stepx);
				pY -= sine[sensor_angle] * sign(stepx);
			}
			if(check[0]){
				wall_id = check[0];
				wall_type = check[1];
				xspeed = 0;
				stepx = -sign(stepx);
				distx = 0;
			}
		}
		// Move Player
		x += stepx;
		y += stepy;
		// Gravity
		yspeed += gravadd;
		gravadd = 0;
		
		// Ceiling Detection
		var collceil = [false,false];
		if(yspeed < 0)collceil = player_ceilingcollision(x,y,0,0,sensor_angle);
		if(collceil[0]){
			var pX = x + (sine[sensor_angle] * 16);
			var pY = y + (cosine[sensor_angle] * 16);
			for(var i = 0;i < 32 + sensor_height;i++){
				var check = player_ceilingcollision(pX,pY,0,-1,sensor_angle);
				if(check[0]){
					x = pX;
					y = pY;
					break;
				}
				pX -= sine[sensor_angle];
				pY -= cosine[sensor_angle];
			}
			ceiling_id = check[0];
			ceiling_type = check[1];
			yspeed = 0;
		}
		// Floor Detection
		var collfloor = [false,false];
		if(yspeed > -2)collfloor = player_floorcollision(x,y,0,0,sensor_angle);
		if(collfloor[0]){
			var pX = x - (sine[sensor_angle] * 16);
			var pY = y - (cosine[sensor_angle] * 16);
			for(var i = 0;i < 32 + sensor_height;i++){
				var check = player_floorcollision(pX,pY,0,1,sensor_angle);
				if(check[0]){
					x = pX;
					y = pY;
					break;
				}
				pX += sine[sensor_angle];
				pY += cosine[sensor_angle];
			}
			grounded = true;
			floor_id = check[0];
			floor_type = check[1];
			if(floor_type == "Tile"){
				floor_mirror = tempTileData_Mirror;
				floor_flip = tempTileData_Flip;
			}
			angle = player_getangle(angle,floor_id,floor_type);
			angle_fake = angle;
			sensor_angle = angle_wrap(round(angle / 90) * 90);
			// Landing speed...
			if((angle_fake >= 24 && angle_fake <= 44) || (angle_fake >= 316 && angle_fake >= 338)){ //Small angles
				if(xspeed > yspeed){
					gspeed = xspeed
				}else{
					gspeed = yspeed * 0.5 * -sign(sine[angle_fake]);
				}
			}else if((angle_fake >= 45 && angle_fake <= 90) || (angle_fake >= 271 && angle_fake <= 315)){ //Beeg angles
				if(xspeed > yspeed){
					gspeed = xspeed
				}else{
					gspeed = yspeed * -sign(sine[angle_fake])
				}
			}else gspeed = xspeed;
			exit;
		}
	}
}