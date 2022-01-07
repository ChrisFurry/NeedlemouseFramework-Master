/// @description Insert description here
// You can write your code in this editor
if(!finished){
	finished = true;
	xoffset = x - objCamera.camera_x;
	yoffset = y - objCamera.camera_y;
	image_speed = 0;
	image_index = sprite_get_number(sprite_index) - 1;
	alarm[0] = 10;
}
