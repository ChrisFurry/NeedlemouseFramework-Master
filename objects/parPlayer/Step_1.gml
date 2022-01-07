/// @description Change variables with character
// Change depending on character
switch(character_id){
	default:
		// Speed Constants
		accel = 0.046875;
		frict = accel;
		deacc = 0.5;
		airacc = accel * 2;
		jump_high = 6.4;
		jump_low = 4;
		top_gspeed = 6;
		grav = 0.21875;
		// Roll Speed
		rollingFrict = accel / 2;
		rollingBrake = 0.1484375;
		// Slope Constants
		fall_speed = 2.5;
		// Sensor Defaults
		default_sensor_width = 9;
		default_sensor_height = 19;
		default_sensor_wall = 10;
		// Roll
		roll_sensor_width = 7;
		roll_sensor_height = 14;
		roll_sensor_wall = 9;
		// Slope Defaults
		slpfct_default = 0.125;
		slpfct_up_default = 0.078125;
		slpfct_down_default = 0.3125;
		// Hitbox Variables
		hitbox_width = 8;
		hitbox_height = sensor_height - 3;
		hitbox_yoffset = 0;
		// Animation Variables
		anim_runspd = 6;
		// Hud
		lifeIcon_index = 0;
		//Goalpost
		goalpostSprite = sprPlayer_Sonic_Goalpost;
		// Underwater stuff
		if(underwater){
			accel /= 2;
			frict = accel;
			deacc /= 2;
			airacc /= 2;
			top_gspeed /= 2;
			grav = 0.0625;
			jump_high /= 2;
			jump_low /= 2;
		}
		break;
}

if(speedshoes){
	// Speed Constants
	accel *= 2;
	frict = accel;
	deacc *= 2;
	airacc *= 2;
	top_gspeed *= 2;
}

// Change Other Variables
slope_factor_up = slpfct_default;
slope_factor_down = slpfct_default;
// Hitbox lol
hitbox_height = sensor_height - 3;