/// @description Change bottom lock

var playerObj = instance_nearest(x,y,objPlayer);

if(playerObj){
	if(rectangle_in_rectangle(bbox_left,0,bbox_right,1,playerObj.xprevious,0,playerObj.x,1)){
		objCamera.camera_lockD = bbox_bottom;
		objCamera.camera_state = 2;
	}
}