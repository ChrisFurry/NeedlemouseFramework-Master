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
		var movexspeed = min(distx, max_speed) * sign(xspeed);
		if(distx > 0)distx -= abs(movexspeed);
		var moveyspeed = min(disty, max_speed) * sign(yspeed);
		if(disty > 0)disty -= abs(moveyspeed);
		// Wall Decection
		// -- Fixed an issue where the Scout could run
		var collwall = player_wallcollision(x + (movexspeed),y + (moveyspeed),0,0,sensor_angle,(movexspeed == 0 ? sign(movexspeed) : dir));
		if(collwall[0]){
			var pX = x;
			var pY = y;
			pX = round(pX);
			pY = round(pY);
			repeat(16){ // MOVE BACK
				var check = player_wallcollision(pX,pY,sign(xspeed),moveyspeed,sensor_angle,(movexspeed == 0 ? sign(movexspeed) : dir));
				if(check[0]){
					pX -= sign(xspeed);
				}else break;
			}
			repeat(16){ // MOVE FORWARD
				var check = player_wallcollision(pX,pY,sign(gspeed),moveyspeed,sensor_angle,(movexspeed == 0 ? sign(movexspeed) : dir));
				if(!check[0]){
					pX += sign(xspeed);
				}else break;
			}
			x = round(pX); // Round and set
			wall_id = collwall[0];
			wall_type = collwall[1];
			xspeed = 0;
			distx = 0;
			movexspeed = 0;
		}
		// Move Player
		x += movexspeed;
		y += moveyspeed;
		// Gravity
		yspeed += gravadd;
		gravadd = 0;
		
		// Ceiling Detection
		var collceil = [false,false];
		if(yspeed < 0)collceil = player_ceilingcollision(x,y,0,0,sensor_angle);
		if(collceil[0]){
			var pX = x;
			var pY = y;
			pX = round(pX);
			pY = round(pY);
			repeat(16){ // MOVE BACK
				var check = player_ceilingcollision(pX,pY,0,-1,sensor_angle);
				if(check[0]){
					collceil = check;
					pY -= sign(yspeed);
				}else break;
			}
			y = round(pY); // Round and set
			disty = 0;
			moveyspeed = 0;
			ceiling_id = collceil[0];
			ceiling_type = collceil[1];
			// 1/15/2022: IM A FUCKIN IDIOT I FORGOT CEILING LANDING
			var ceilland_check = player_getangle(180,ceiling_id,ceiling_type);
			if(ceilland_check <= 135 || ceilland_check >= 226){
				gspeed = ceilland_check < 180 ? -yspeed : yspeed;
				grounded = true;
				angle = ceilland_check;
				floor_id = ceiling_id;
				floor_type = ceiling_type;
				angle_fake = angle;
				sensor_angle = 180; // YOU... YOU LITTLE- (originally it was rounding the angle var but i had to change it to 180 to work)
				yspeed = 0;
				if(floor_type == "Tile"){
					floor_mirror = tempTileData_Mirror;
					floor_flip = tempTileData_Flip;
				}
				exit;
				// This code hates me a lot
			}else{
				yspeed = 0;
			}
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