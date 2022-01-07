/// @description Draw Player
var xpos = round(x);
var ypos = round(y);
if(sprite_exists(sprite_index))draw_sprite_ext(sprite_index,image_index,xpos,ypos,image_xscale * dir,image_yscale,animation_angle,image_blend,image_alpha);

if(!debug_view)exit;
draw_set_alpha(0.4);
draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,false);
draw_set_alpha(1);
if(sensor_angle mod 180 == 0){
	draw_rectangle_color(xpos - sensor_width,ypos - sensor_height,xpos + sensor_width,ypos + sensor_height - 1,c_lime,c_lime,c_lime,c_lime,true);
	draw_line(xpos - sensor_wall,ypos + sensor_ywall,xpos + sensor_wall,ypos + sensor_ywall);
}else{
	draw_rectangle_color(xpos - sensor_height,ypos - sensor_width,xpos + sensor_height,ypos + sensor_width,c_lime,c_lime,c_lime,c_lime,true);
	draw_line(xpos,ypos + sensor_wall,xpos,ypos - sensor_wall);
}