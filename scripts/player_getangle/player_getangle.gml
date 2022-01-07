function player_getangle(angle,floor_id,floor_type){
	// Get angle from an object
	if(floor_id && floor_type == "Object"){
		// If cubed.. Return your angle rounded to the nearest 90 degree
		if(floor_id.angle_cube)return angle_wrap(round(angle / 90) * 90);
		// Complex angles, omg not using 2 dot sensors with a repeat loop?!?!?!??!
		if(floor_id.complex_angle){
			var data = floor_id.complex_angle_pos;
			var calc0 = point_direction(x,y,data[0] + (sensor_height * data[2]),data[1] + (sensor_height * data[3]));
			return angle_wrap(calc0 + data[4]);
		}
		return angle_wrap(floor_id.simple_angle);
	}
	// Get angle from tile
	if(floor_id && floor_type == "Tile"){
		var temp0 = floor_id >= platformTiles ? tileangles[(floor_id + 1) - platformTiles] : tileangles[floor_id];
		// If square.. Return your angle rounded to the nearest 90 degree
		if(temp0 == 0)return angle_wrap(round(angle / 90) * 90);
		if(floor_flip)temp0 = (540 - temp0) mod 360;
		if(floor_mirror)temp0 = 360 - temp0;
		return temp0;
	}
}