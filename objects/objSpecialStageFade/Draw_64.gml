/// @description Fade

if(!Finished){
	fade += fade_spd * fade_dir;
	if(fade_dir == -1 && fade <= 0)Finished = true;
	if(fade_dir == 1 && fade >= 2)Finished = true;
}

gpu_set_blendenable(true);
gpu_set_blendmode(bm_add);
var fadechop = 20;
var r = clamp(round((fade * 110) / fadechop) * fadechop,0,255);
var g = clamp(round((fade * 110) / fadechop) * fadechop,0,255);
var b = clamp(round((fade * 255) / fadechop) * fadechop,0,255);
var col = make_color_rgb(r,g,b);
draw_rectangle_color(0,0,view_wport[0],view_hport[0],col,col,col,col,false);
gpu_set_blendmode(bm_normal);