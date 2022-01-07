/// @description 
if(!logsCreated){
	for(var i = 0;i < logs;i ++){
		var tempXoff = -(((logs * sprite_get_width(logSprite)) / 2) + (-sprite_get_width(logSprite) / 2)) + (sprite_get_width(logSprite) * i);
		var tempYoff = 0;
		var ange = angle_wrap(round(image_angle));
		var tempX = x + (cosine[ange] * tempXoff) + (sine[ange] * tempYoff);
		var tempY = y + (cosine[ange] * tempYoff) - (sine[ange] * tempXoff);
		logsObj[i] = instance_create_depth(tempX,tempY,depth,objBridgeLog);
		logsObj[i].sprite_index = logSprite;
		logsObj[i].mask_index = logSprite;
		logsObj[i].simple_angle = ange;
	}
	active_dist = ((logs * sprite_get_width(logSprite)) / 2) + 16;
	logsCreated = true;
}
if(!event_is_playing(false))exit;
var coll = false;
var lognumb = 0;
if(!instance_exists(parPlayer))exit;
var dist = abs(distance_to_point(objPlayer.x,y));
// Find the log the player is standing on
with(objPlayer){
	if(dist < other.active_dist){
		for(var i = 0;i < other.logs;i ++){
			if(floor_id == other.logsObj[i] && floor_type == "Object"){
				coll = true;
				lognumb = i;
				break;
			}
		}
	}
}
if(dist < active_dist + (view_wport[0] / 2)){
	// Calculate the farthest it can go down
	if(lognumb <= logs / 2){
		var MaxDepression = lognumb * 2
	}else{var MaxDepression = ((logs - lognumb) + 1) * 2;}
	// For each log, calculate the y pos
	for(var i = 0;i < logs;i ++){
		// get difference in position of this log to current log stood on
	   var difference = abs((i + 1) - lognumb);
   
	   // get distance from current log to the closest side, depending if before or after CurrentSegment
	   if (i < lognumb){
		   var log_distance = 1 - (difference / lognumb)
		}else{var log_distance = 1 - (difference / ((logs - lognumb) + 1))}
		logsObj[i].yoffset = lerp(logsObj[i].yoffset,floor(MaxDepression * sine[angle_wrap(90 * log_distance)]),0.2);
	}
}
//--Most of this code is copied from Sonic Retro lol,--//
//--Go check out the Sonic Physics Guide, thats the only way i could make the bridges.--//
// Inherit the parent event
event_inherited();

