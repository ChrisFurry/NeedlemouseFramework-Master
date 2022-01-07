function player_state_spring(){
	// Temp Variables
	var key_hor = sign(key_right - key_left);
	// Reset Variables
	skidding = false;
	ball_form = false;
	// Movement
	if(key_hor != 0){
		dir = key_hor;
		if((xspeed * key_hor) < top_gspeed)xspeed += ((airacc) * key_hor);
	}
	// Air Drag
	if (yspeed < 0 && yspeed > -4){
		xspeed -= ((xspeed / 0.125) / 256);
	}
	// Ground
	if(grounded){
		state = playerState.Default;
		exit;
	}
	// Animation
	if(yspeed < 0){animation = playerANI.spring}else{
		if(abs(gspeed) < top_gspeed){
			animation = playerANI.walk;
		}else if(abs(gspeed) < top_gspeed * 2){
			animation = playerANI.run;
		}else{
			animation = playerANI.peelout;
		}
	}
	
	// Animation Control
	if(animation == playerANI.walk || animation == playerANI.run || animation == playerANI.peelout)animation_subimagesforced = floor(max(0, 8 - abs(gspeed)));
}