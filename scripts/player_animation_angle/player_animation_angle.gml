function player_animation_angle(){
	// Smooth Angle Calculations
	if(grounded){
		angle_smooth = angle_fake;
		if(angle_fake < 30 || angle_fake > 330)angle_smooth = 0;
	}else if(angle_smooth != 0){
		var smooth_anglemove = 2.8125;
		if(angle_smooth > 180)angle_smooth = min(angle_smooth + (smooth_anglemove),360);
		if(angle_smooth <= 180)angle_smooth = max(angle_smooth - (smooth_anglemove),0);
		if(angle_smooth >= 360)angle_smooth = 0;
	}
	// Actual Calculations
	animation_angle = gravAngle;
	if(animation == playerANI.walk || animation == playerANI.run || animation == playerANI.peelout){
		// Find the animation
		var findList = variable_instance_get(objResources,animation_array);
		if(findList != undefined){
			var newAng = (round(angle_smooth / 45) * 45);
			if(newAng mod 90 == 0)animation_angle = gravAngle + newAng;
			if(newAng mod 90 == 45){
				if(dir = 1)animation_angle = gravAngle + (newAng - 45);
				if(dir = -1)animation_angle = gravAngle + (newAng - 45) + 90;
				var listAnimation = findList[animation + 1];
				var length = array_length_1d(listAnimation);
				var frame = clamp(floor(animation_frame),0,length - 1);
				var firstFrameData = listAnimation[0];
				var frameData = listAnimation[frame];
				sprite_index = firstFrameData[ANIM_SPRITEID];
				image_index = frameData[ANIM_FRAMEID];
			}
		}
	}
}