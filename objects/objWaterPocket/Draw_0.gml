/// @description Insert description here
// You can write your code in this editor
gpu_set_blendenable(true);
gpu_set_blendmode(bm_subtract);
draw_set_color($6fe9ac);
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
gpu_set_blendmode(bm_normal);
draw_set_color(c_white);