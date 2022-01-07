function player_state_default(){
	// Temp Variables
	var key_hor = sign(key_right - key_left);
	var key_vir = sign(key_down - key_up);
	var key_vir2 = sign(key_down2 - key_up2);
	var jump = (key_a || key_b || key_c);
	var jump2 = (key_a2 || key_b2 || key_c2);
	var crouch = (key_vir == 1 && abs(gspeed) < 1);
	var lookup = (key_vir == -1 && abs(gspeed) < 1);
	// Movement
	switch(grounded){
		default:
			// Reset Variables
			jump_variable = false;
			ball_form = false;
			jumpAbility_used = false;
			// Rolling
			if(key_vir == 1 && abs(gspeed) >= 1 && !rolling){
				rolling = true;
				audio_stop_play_sound(sndPlayer_roll,1,1);
				exit;
			}
			switch(rolling){
				default: // Not rolling
					// Movement
					if(key_hor != 0 && !crouch && !lookup && !horizontal_control_lock){
						// Change Dir
						if(key_hor == sign(gspeed) && gspeed != 0)dir = key_hor;
						// Movement
						if((key_hor == sign(gspeed) && abs(gspeed) < top_gspeed) || gspeed == 0)gspeed += (accel * key_hor);
						if(key_hor != sign(gspeed) && gspeed != 0){
							gspeed += (deacc * key_hor);
							if(abs(gspeed) > 3)skidding = true;
							if(gspeed != 0 && skidding)dir = sign(gspeed);
						}
					}else{gspeed = max(abs(gspeed) - (frict),0) * sign(gspeed)}
					if(gspeed == 0 || key_hor == sign(gspeed))skidding = false;
					// Spindash
					if(crouch && jump2){
						state = playerState.Spindash;
						spindashRev = 0;
						audio_stop_play_sound(sndPlayer_spindashRev,1,1);
						exit;
					}
					// Peelout
					if(lookup && jump2){
						state = playerState.Peelout;
						spindashRev = 0;
						audio_stop_play_sound(sndPlayer_spindashRev,1,1);
						exit;
					}
					// Animation
					if(gspeed == 0){
						animation = playerANI.idle;
					}else if(abs(gspeed) < anim_runspd){
						animation = playerANI.walk;
					}else if(abs(gspeed) < anim_runspd * 2){
						animation = playerANI.run;
					}else{
						animation = playerANI.peelout;
					}
					// Crouch and look up
					if(crouch){
						animation = playerANI.duck;
						hitbox_height = round(sensor_height / 2);
						hitbox_yoffset = hitbox_height;
					}
					if(lookup)animation = playerANI.lookup;
					// Skid
					if(skidding){
						// Skid Dust
						if(round(globalTimer) mod 4 == 0){create_effect(sprSmallDust,1,x,y + sensor_height,depth - 1);}
						if(key_hor != 0)audio_stop_play_sound(sndPlayer_skid,1,1);
						// Anim
						animation = playerANI.skid;
					}
					// Push
					var wall = player_wallcollision(x,y,sign(gspeed),0,sensor_angle,dir);
					if(wall[0]){
						animation = playerANI.push;
					}
					// Funny joke
					if(key_left && key_right && gspeed == 0){
						animation = playerANI.walk;
						animation_frame = 0;
						dir = 0 - dir;
					}
					break;
				case true:
					// Set variables
					ball_form = true;
					attacking = true;
					slope_factor_up = slpfct_up_default;
					slope_factor_down = slpfct_down_default;
					// Friction
					if(key_hor == sign(gspeed) || key_hor == 0)gspeed -= (rollingFrict * sign(gspeed));
					if(key_hor != sign(gspeed) && key_hor != 0)gspeed -= (rollingBrake * sign(gspeed));
					// Go too slow
					if(abs(gspeed) < 0.5)rolling = false;
					// Change Sensor Size
					player_changeSensorSize(roll_sensor_width,roll_sensor_height,roll_sensor_wall);
					// Animation
					animation = playerANI.roll;
					animation_speed = clamp((20 + (abs(gspeed)) * 16) / 100,0.1,1);
					break;
			}
			// Jump
			if(jump2 && !ceiling_id){
				xspeed -= jump_high * sine[angle];
				yspeed -= jump_high * cosine[angle];
				grounded = false;
				jump_variable = true;
				ball_form = true;
				rolling = false;
				audio_stop_sound(sndPlayer_skid);
				audio_stop_play_sound(sndPlayer_jump,1,1);
				animation = playerANI.roll;
				exit;
			}
			break;
		case false:
			skidding = false;
			rolling = false;
			// Movement
			if(key_hor != 0){
				dir = key_hor;
				if((xspeed * key_hor) < top_gspeed){
					xspeed += ((airacc) * key_hor);
				}
			}
			// Air Drag
			if (yspeed < 0 && yspeed > -4){
			    xspeed -= ((xspeed / 0.125) / 256)
			}
			// Low jump
			if(!jump && jump_variable){
				jump_variable = false;
				yspeed = max(yspeed,-jump_low);
			}
			// Sonic: Hammer Drop
			if(!jumpAbility_used && key_vir2 == 1 && objGameData.sonicAbility == playerSonicAbility.hammerdrop){
				audio_stop_play_sound(sndPlayer_hammerdrop,1,1);
				state = playerState.HammerDrop;
				animation = playerANI.hammerdrop;
				yspeed = max(yspeed + 2,2);
				jumpAbility_used = true;
				exit;
			}
			// Attacking && Change Sensor Size
			if(ball_form){
				player_changeSensorSize(roll_sensor_width,roll_sensor_height,roll_sensor_wall);
				attacking = true;
			}
			// Animation
			if(ball_form)animation = playerANI.roll;
			if(g_event == gameEvents.endlevel)animation = playerANI.victoryJump;
			break;
	}
	
	// Animation Control
	if(animation == playerANI.walk || animation == playerANI.run || animation == playerANI.peelout)animation_subimagesforced = floor(max(0, 6 - abs(gspeed)));
	if(animation == playerANI.roll)animation_subimagesforced = floor(max(0, 4 - abs(gspeed)));
	if(animation == playerANI.push)animation_subimagesforced = floor(max(0, 8 - abs(gspeed)) * 2);
}