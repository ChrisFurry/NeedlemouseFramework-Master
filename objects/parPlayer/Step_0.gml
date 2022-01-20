/// @description Movement

if(!event_is_playing(true))exit;

if(state < 0){
	if(state = -1){
		x = 0;
		y = 0;
	}
	xspeed = 0;
	yspeed = 0;
	grounded = false;
	visible = false;
	underwater = false;
	exit;
}
// Noclip Key
if(keyboard_check_pressed(vk_lcontrol))noclipActive = !noclipActive * g_debug_mode;
// Player movement
if(!noclipActive){
	// Reset Variables
	animation_subimagesforced = 0;
	physicsActive = true;
	attacking = false;
	player_changeSensorSize(default_sensor_width,default_sensor_height,default_sensor_wall);
	// 
	var specialState = ((player_is & PLRFLG_DEAD) || (player_is & PLRFLG_VICTORY))
	if(!specialState){
		player_mainactions();
	}else{
		if(player_is & PLRFLG_DEAD){ // Dead state
			player_is = PLRFLG_DEAD;
			physicsActive = false;
			x += xspeed;
			y += yspeed;
			yspeed += grav;
			// Funny joke
			if(keyboard_check(objGameData.key_left) && keyboard_check(objGameData.key_right)){
				animation = playerANI.walk;
				animation_frame = 0;
				dir = 0 - dir;
			}
			// Drown Bubbles
			if(drowningBubbles_timer){
				var eff = instance_create_depth(x + irandom_range(-5,5),y,0,objBubbles_Tiny);
				if(drowningBubbles_timer > 30)eff.sprite_index = sprMediumBubbles;
				drowningBubbles_timer --;
			}
			// Everything else
			objCamera.camera_followplayer = false;
			objCamera.player_lockedin = false;
			if(y > objCamera.camera_y + view_hport[0] + 128){
				state = -1;
				exit;
			}
		}
		if(player_is & PLRFLG_VICTORY)player_state_victory();
	}
	// Movement
	if(physicsActive){if(grounded){player_movementground();}else{player_movementair();}}
	// Check for being hurt
	player_takedamage();
	// Timed Variables
	player_timedvariables();
	// Animation
	player_animation_core();
	// Animation Angle
	player_animation_angle();
	if(g_event != gameEvents.playerdead){
		// Underwater
		player_isunderwater();
		player_drowningTimer();
		// Update Hitbox
		player_updatehitbox();
		// Update Shield
		player_shieldcontroller();
		// Update Inv
		player_invobjcontroller();
	}
	// Invincibility blink
	var hurtState = ((player_is & PLRFLG_HURT) || (player_is & PLRFLG_DEAD));
	if(invincible == 2 && round(inv_frames) mod 10 < 5 && !hurtState){
		sprite_index = -1;
	}
	// Invincible 1
	if(invincible == 1)attacking = true;
	// Combo
	if(grounded)combo = 0;
	// Debug Keys
	if(!g_debug_mode)exit;
	if(keyboard_check_pressed(vk_numpad1))gspeed = 40 * dir;
	exit;
}
var key_hor = key_right - key_left;
var key_vir = key_down - key_up;
if(key_hor != 0 || key_vir != 0){noclipSpd += 0.25}else{noclipSpd = 0}
x += (noclipSpd * key_hor);
y += (noclipSpd * key_vir);
xspeed = noclipSpd * key_hor;
yspeed = noclipSpd * key_vir;
gspeed = xspeed;
grounded = false;
solidLayer = 0;
player_is = 0;
visible = true;
hurt = 0;