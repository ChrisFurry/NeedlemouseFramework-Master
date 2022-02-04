/// @description 
if(!event_is_playing(false))exit;
var coll = false;
var high = false;
switch(springDirection){
	case 0:
		solid_floor = false;
		coll = collision_rectangle(bbox_left,bbox_top - 8,bbox_right,bbox_bottom,objPlayer,true,true);
		if(coll){
			coll.state = coll.statespring;
			coll.grounded = false;
			coll.yspeed = -springPower * (1 + high);
			image_speed = 1;
			image_index = 1;
			audio_stop_play_sound(sndSpring_bounce,1,1 + (0.5 * high));
		}
		break;
	case 2:
		coll = collision_rectangle(bbox_left - 4,bbox_top,bbox_right,bbox_bottom,objPlayer,true,true);
		if(coll){
			coll.gspeed = -springPower;
			coll.xspeed = -springPower;
			coll.grounded = true;
			coll.dir = -1;
			coll.horizontal_control_lock = 10;
			image_speed = 1;
			image_index = 1;
			audio_stop_play_sound(sndSpring_bounce,1,1);
		}
		break;
	case 3:
		coll = collision_rectangle(bbox_left + 4,bbox_top,bbox_right,bbox_bottom,objPlayer,true,true);
		if(coll){
			coll.gspeed = springPower;
			coll.xspeed = springPower;
			coll.grounded = true;
			coll.dir = 1;
			coll.horizontal_control_lock = 10;
			image_speed = 1;
			image_index = 1;
			audio_stop_play_sound(sndSpring_bounce,1,1);
		}
		break;
	case 4:
		coll = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,objPlayer,true,true);
		if(coll){
			coll.state = coll.statespring;
			coll.grounded = false;
			coll.dir = 1;
			coll.yspeed = -springPower * (1 + high);
			coll.xspeed = springPower * (1 + high);
			image_speed = 1;
			image_index = 1;
			audio_stop_play_sound(sndSpring_bounce,1,1 + (0.5 * high));
		}
		break;
	case 5:
		coll = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,objPlayer,true,true);
		if(coll){
			coll.state = coll.statespring;
			coll.grounded = false;
			coll.dir = -1;
			coll.yspeed = -springPower * (1 + high);
			coll.xspeed = -springPower * (1 + high);
			image_speed = 1;
			image_index = 1;
			audio_stop_play_sound(sndSpring_bounce,1,1 + (0.5 * high));
		}
		break;
}