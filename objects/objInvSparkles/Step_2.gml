/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(parentObj)){
	instance_destroy();
	exit;
}
// Record pos
record_pos[globalTimer mod 60] = [x,y];

x = round(parentObj.x);
y = round(parentObj.y);