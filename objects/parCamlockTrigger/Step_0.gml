/// @description 
if(!event_is_playing(false))exit;
var camID = 0;
var lockL = 0;
var lockR = room_width;
var lockU = 0;
var lockD = room_height;
with(objCameraLock){
	if(lockID == other.triggerID){
		var camID = id;
		var lockL = bbox_left;
		var lockR = bbox_right;
		var lockU = bbox_top;
		var lockD = bbox_bottom;
	}
}
with(objPlayer){
	if(collision_line(x,y,xprevious,yprevious,other,true,true)){
		objCamera.camera_lockL = lockL;
		objCamera.camera_lockR = lockR;
		objCamera.camera_lockU = lockU;
		objCamera.camera_lockD = lockD;
		objCamera.camera_state = other.camera_move_type;
		objCamera.player_lockedin = true;
	}
}