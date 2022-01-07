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
	// State Machine
	switch(state){
		case playerState.Default:
			player_state_default();
			break;
		case playerState.Spindash:
			player_state_spindash();
			attacking = true;
			break;
		case playerState.Peelout:
			player_state_peelout();
			break;
		case playerState.Spring:
			player_state_spring();
			ball_form = false;
			rolling = false;
			break;
		case playerState.Hurt:
			player_state_hurt();
			ball_form = false;
			rolling = false;
			break;
		case playerState.HammerDrop:
			player_state_hammerdrop();
			attacking = true;
			break;
		case playerState.Dead:
			physicsActive = false;
			objRoomDefiner.timer_active = false;
			hurt = 0;
			ball_form = false;
			rolling = false;
			player_state_dead();
			break;
		case playerState.Victory:
			player_state_victory();
			hurt = 0;
			ball_form = false;
			rolling = false;
			objRoomDefiner.timer_active = false;
			break;
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
	var hurtState = (state == playerState.Hurt || state == playerState.Dead);
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
visible = true;
hurt = 0;