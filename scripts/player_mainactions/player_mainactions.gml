function player_mainactions(){
	// Temp Variables
	var key_hor = sign(key_right - key_left);
	var key_vir = sign(key_down - key_up);
	var key_vir2 = sign(key_down2 - key_up2);
	var jump = (key_a || key_b || key_c);
	var jump2 = (key_a2 || key_b2 || key_c2);
	var crouch = (key_vir == 1 && abs(gspeed) < 1);
	var lookup = (key_vir == -1 && abs(gspeed) < 1);
	// Movement
	if(!(player_is & PLRFLG_HURT)){
		if(!(player_is & PLRFLG_SPINDASH) && !(player_is & PLRFLG_PEELOUT)){
			var is_common = (player_is == 0 || (player_is == PLRFLG_SKIDDING));
			var is_air = (!grounded);
			var is_rolling = (player_is & PLRFLG_ROLLING);
			var is_skidding = (player_is & PLRFLG_SKIDDING);
			if(is_common){
				if(is_air){
					
				}else{
					// Rolling
					if(key_vir == 1 && abs(gspeed) >= 1){
						player_is = PLRFLG_ROLLING;
						audio_stop_play_sound(sndPlayer_roll,1,1);
						exit;
					}
					// Movement
					if(key_hor != 0 && !crouch && !lookup && !horizontal_control_lock){
						// Change Dir
						if(key_hor == sign(gspeed) && gspeed != 0)dir = key_hor;
						// Movement
						if((key_hor == sign(gspeed) && abs(gspeed) < top_gspeed) || gspeed == 0)gspeed += (accel * key_hor);
						if(key_hor != sign(gspeed) && gspeed != 0){
							gspeed += (deacc * key_hor);
							if(abs(gspeed) > 3){
								player_is = PLRFLG_SKIDDING;
								is_skidding = true;
							}
							if(gspeed != 0 && skidding)dir = sign(gspeed);
						}
					}else{gspeed = max(abs(gspeed) - (frict),0) * sign(gspeed)}
					if(gspeed == 0 || key_hor == sign(gspeed)){
						player_is &= ~PLRFLG_SKIDDING;
						is_skidding = false;
					}
					// Spindash
					if(crouch && jump2){
						player_is = PLRFLG_SPINDASH;
						spindashRev = 0;
						audio_stop_play_sound(sndPlayer_spindashRev,1,1);
						exit;
					}
					// Peelout
					if(lookup && jump2){
						player_is = PLRFLG_PEELOUT;
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
					if(is_skidding){
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
				}
			}
			if(is_air){
				player_is &= ~PLRFLG_SKIDDING;
				player_is &= ~PLRFLG_ROLLING;
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
				// Spring Stuff
				if(player_is & PLRFLG_SPRING){
					animation = playerANI.spring;
					if(yspeed > 0){
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
					}
				}
			}else{
				// Remove flags
				player_is &= ~PLRFLG_BALLFORM;
				player_is &= ~PLRFLG_SPRING;
				// Rolling
				if(is_rolling){
					// Set variables
					player_is |= PLRFLG_BALLFORM;
					attacking = true;
					slope_factor_up = slpfct_up_default;
					slope_factor_down = slpfct_down_default;
					// Friction
					if(key_hor == sign(gspeed) || key_hor == 0)gspeed -= (rollingFrict * sign(gspeed));
					if(key_hor != sign(gspeed) && key_hor != 0)gspeed -= (rollingBrake * sign(gspeed));
					// Go too slow
					if(abs(gspeed) < 0.5)player_is &= ~PLRFLG_ROLLING;
					// Change Sensor Size
					player_changeSensorSize(roll_sensor_width,roll_sensor_height,roll_sensor_wall);
					// Animation
					animation = playerANI.roll;
					animation_speed = clamp((20 + (abs(gspeed)) * 16) / 100,0.1,1);
				}
				// Jump
				if(jump2 && !ceiling_id){
					xspeed -= jump_high * sine[angle];
					yspeed -= jump_high * cosine[angle];
					grounded = false;
					jump_variable = true;
					player_is |= PLRFLG_BALLFORM;
					player_is &= ~PLRFLG_ROLLING;
					audio_stop_sound(sndPlayer_skid);
					audio_stop_play_sound(sndPlayer_jump,1,1);
					animation = playerANI.roll;
					exit;
				}
			}
		}else{
			if(player_is & PLRFLG_SPINDASH){
				// Stop Moving
				gspeed = 0;
				// Get Temp ABC Input
				var key_abc2 = (key_a2 || key_b2 || key_c2);
				// Lower SpindashRev
				spindashRev = clamp(spindashRev - ((spindashRev / 0.125) / 256),2,8);
				// Press the rev key lol
				if(key_abc2){
					animation_frame = 0;
					spindashRev += 2;
					audio_stop_play_sound(sndPlayer_spindashRev,1,(spindashRev + 6) / 8);
				}
				// Release Spindash
				if(!key_down){
					player_is = PLRFLG_ROLLING;
					player_is |= PLRFLG_BALLFORM;
					gspeed = (8 + (floor(spindashRev) / 2)) * dir;
					xspeed = gspeed;
					spindashRev = 0;
					audio_stop_sound(sndPlayer_spindashRev);
					audio_stop_play_sound(sndPlayer_spindashRelease,1,1);
					exit;
				}
				// Animations
				animation = playerANI.spindash;
				if(spindashRev >= 6)animation = playerANI.spindashFast;
			}else{
				// Stop Moving
				gspeed = 0;
				// Lower SpindashRev
				spindashRev = min(spindashRev + 0.5,16);
				// Release Spindash
				if(!key_up){
					player_is = 0;
					gspeed = spindashRev * dir;
					xspeed = gspeed;
					spindashRev = 0;
					audio_stop_sound(sndPlayer_spindashRev);
					audio_stop_play_sound(sndPlayer_spindashRelease,1,1);
					exit;
				}
				// Animations
				if(abs(spindashRev) < anim_runspd){
					animation = playerANI.walk;
				}else if(abs(spindashRev) < anim_runspd * 2){
					animation = playerANI.run;
				}else{
					animation = playerANI.peelout;
				}
				animation_subimagesforced = floor(max(0, 6 - abs(spindashRev)));
			}
		}
	}else{
		player_is = PLRFLG_HURT; // Remove all other flags
		// Change Gravity
		grav = 0.1875;
		// Landing
		if(grounded){
			player_is = 0;
			gspeed = 0;
			xspeed = 0;
			exit;
		}
		// Animation
		animation = playerANI.hurt;
	}
	attacking = ((player_is & PLRFLG_ROLLING) || (player_is & PLRFLG_BALLFORM) || (player_is & PLRFLG_SPINDASH))
	if(!(player_is & PLRFLG_PEELOUT)){
		// Animation Control
		if(animation == playerANI.walk || animation == playerANI.run || animation == playerANI.peelout)animation_subimagesforced = floor(max(0, 6 - abs(gspeed)));
		if(animation == playerANI.roll)animation_subimagesforced = floor(max(0, 4 - abs(gspeed)));
		if(animation == playerANI.push)animation_subimagesforced = floor(max(0, 8 - abs(gspeed)) * 2);
	}
}