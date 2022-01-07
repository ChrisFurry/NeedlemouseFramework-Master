function player_animation_core(){
	// Reset Animation Variables on new anim
	if(animation != animation_previous){
		animation_previous = animation;
		animation_frame = 0;
		animation_finish = false;
		var findList = variable_instance_get(objResources,animation_array);
		if(findList != undefined){
			if(animation < array_length_1d(findList)){
				var listAnimation = findList[animation];
				var length = array_length_1d(listAnimation);
				var frame = clamp(floor(animation_frame),0,length - 1);
				var firstFrameData = listAnimation[0];
				var frameData = listAnimation[frame];
				// Subimg Delay
				animation_subimages = firstFrameData[ANIM_DELAY];
				if(animation_subimagesforced > 0)animation_subimages = animation_subimagesforced;
			}
		}
	}
	// Find the animation
	var findList = variable_instance_get(objResources,animation_array);
	if(findList != undefined){
		if(animation < array_length_1d(findList)){
			var listAnimation = findList[animation];
			var length = array_length_1d(listAnimation);
			var frame = clamp(floor(animation_frame),0,length - 1);
			var firstFrameData = listAnimation[0];
			var frameData = listAnimation[frame];
			// Subimg Delay
			animation_subimages --;
			if(animation_subimages < 0){
				animation_subimages = firstFrameData[ANIM_DELAY];
				if(animation_subimagesforced > 0)animation_subimages = animation_subimagesforced;
				animation_frame ++;
				var frame = clamp(floor(animation_frame),0,length - 1);
				var frameData = listAnimation[frame];
			}
			// Special Frame Data
			switch(frameData[ANIM_FRAMEID]){
				case afEnd:
					animation_finish = true;
					animation_frame = 0;
					frameData = listAnimation[animation_frame];
					break;
				case afBack:
					animation_finish = true;
					var frameAfter = listAnimation[frame + 1];
					animation_frame -= frameAfter[0];
					frameData = listAnimation[animation_frame];
					break;
				default:
					
					break;
			}
			animation_frame = clamp(animation_frame,0,length);
			// Pick the Sprite ID and the Frame ID
			sprite_index = firstFrameData[ANIM_SPRITEID];
			image_index = frameData[ANIM_FRAMEID];
		}
	}
}
// Macros that make life a little easier
#macro ANIM_SPRITEID 1
#macro ANIM_FRAMEID 0
#macro ANIM_DELAY 2