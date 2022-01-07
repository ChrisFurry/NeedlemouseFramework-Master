function player_state_hurt(){
	// Change Gravity
	grav = 0.1875;
	// Landing
	if(grounded){
		state = playerState.Default;
		gspeed = 0;
		xspeed = 0;
		exit;
	}
	// Animation
	animation = playerANI.hurt;
}