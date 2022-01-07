function player_reset(){
	// Speed Variables
	xspeed = 0;
	yspeed = 0;
	gspeed = 0;
	gravAngle = 0;
	angle = 0;
	angle_fake = 0;
	// State Variables
	state = playerState.Default;
	//-Default State
	horizontal_control_lock = 0;
	ball_form = false;
	jump_variable = false;
	skidding = false;
	jumpAbility_used = false;
	//-Spindash State
	spindashRev = 0;
	//-Hurt State
	hurt = 0;
	
	solidLayer = 0;
	dir = 1;
	physicsActive = true;
	
	// Powerup Variables
	invincible = 0;
	inv_frames = 0;
	
	// Animation
	animation = playerANI.idle;
	animation_previous = playerANI.idle;
	animation_finish = false;
	animation_frame = 0;
	animation_speed = 1;
	animation_array = "sonicAnimationArray";
	player_animation_core();
}