/// @description Draw text and fade
// Create Font
var font = font_add_sprite_ext(sprTitlecardFont,titlecard_fontmap,true,true);
draw_set_font(font);
// Draw Text
draw_set_valign(fa_center);
draw_text((view_wport[0] / 2) + textDist,view_hport[0] / 2,"over");
draw_set_halign(fa_right);
draw_text((view_wport[0] / 2) - textDist,view_hport[0] / 2,"game");
// Delete Font
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
font_delete(font);

// Fade shit
gpu_set_blendenable(true);
gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
var fadechop = 20;
var r = clamp(round((fade * 110) / fadechop) * fadechop,0,255);
var g = clamp(round((fade * 110) / fadechop) * fadechop,0,255);
var b = clamp(round((fade * 255) / fadechop) * fadechop,0,255);
var col = make_color_rgb(r,g,b);
draw_rectangle_color(0,0,view_wport[0],view_hport[0],col,col,col,col,false);
gpu_set_blendmode(bm_normal);