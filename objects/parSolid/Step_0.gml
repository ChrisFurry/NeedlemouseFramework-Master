/// @description 
var difX = x - xprevious;
var difY = y - yprevious;
with(objPlayer){
	if(floor_id == other.id && floor_type == "Object"){
		x += difX;
		y += difY;
	}
}