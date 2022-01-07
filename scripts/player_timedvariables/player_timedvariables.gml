function player_timedvariables(){
	var hurtState = (state == playerState.Hurt || state == playerState.Dead);
	horizontal_control_lock = max(horizontal_control_lock - 1,0);
	if(invincible && !hurtState){
		inv_frames = max(inv_frames - 1,0);
		if(inv_frames <= 0)invincible = 0;
	}
	if(speedshoes){
		speedshoes_frames = max(speedshoes_frames - 1,0);
		if(speedshoes_frames <= 0)speedshoes = 0;
	}
}