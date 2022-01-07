function animation_create(array,animation_id,sprite_id,subimg_delay,frames){
	var _animList = [0];
	var _newFrame = [frames,sprite_id,subimg_delay];
	_animList[0] = _newFrame;
	if(argument_count > 5){
		var u = 0;
		for(var i = 5;i < argument_count;i ++){
			u ++;
			var _newFrame = [argument[i]];
			_animList[u] = _newFrame;
		}
	}
	array_set(array,animation_id,_animList);
}