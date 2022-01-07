/// @description 
if(!event_is_playing(false))exit;
// Inherit the parent event
event_inherited();

with(objPlayer){
	if(floor_id == other.id && floor_type == "Object"){
		hurt = 1;
		hurtdir = other.x;
	}
}