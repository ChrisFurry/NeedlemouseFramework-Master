/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

angle_cube = false;
if(image_xscale > 0)simple_angle = point_direction(x,y + (32 * image_yscale),x + (32 * image_xscale),y);
if(image_xscale < 0)simple_angle = point_direction(x,y,x - (32 * image_xscale),y + (32 * image_yscale));