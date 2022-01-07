/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

angle_cube = false;
complex_angle = true;
complex_angle_pos[0] = bbox_left;
complex_angle_pos[1] = bbox_top;
complex_angle_pos[2] = -1;
complex_angle_pos[3] = -1;
complex_angle_pos[4] = -90;

if(image_yscale < 0){
	complex_angle_pos[3] = 1;
	complex_angle_pos[1] = bbox_bottom;
}

if(image_xscale < 0){
	complex_angle_pos[2] = 1;
	complex_angle_pos[0] = bbox_right;
}