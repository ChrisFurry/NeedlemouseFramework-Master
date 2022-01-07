function get_time_frames(hours,minutes,seconds){
	var FPS = room_speed;
	var theawesome = seconds * FPS;
	theawesome += (minutes * (FPS * FPS));
	theawesome += (hours * ((FPS * FPS) * FPS));
	
	return theawesome;
}