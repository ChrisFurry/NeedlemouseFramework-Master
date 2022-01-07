/// @description the gui
var zoneNameTop = objRoomDefiner.zoneTopName;
var zoneNameBottom = objRoomDefiner.zoneBottomName;
// Create Font
var font = font_add_sprite_ext(sprTitlecardFont,titlecard_fontmap,true,true);
draw_set_font(font);
// Draw Black
if(drawBlack && state != 2){
	gpu_set_blendenable(true);
	gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
	var fadechop = 20;
	var r = clamp(round((fade * 110) / fadechop) * fadechop,0,255);
	var g = clamp(round((fade * 110) / fadechop) * fadechop,0,255);
	var b = clamp(round((fade * 255) / fadechop) * fadechop,0,255);
	var col = make_color_rgb(r,g,b);
	draw_rectangle_color(0,0,view_wport[0],view_hport[0],col,col,col,col,false);
	gpu_set_blendmode(bm_normal);
}
// Draw Pieces
draw_sprite(sprTitlecardBanner,0,thingposition[0],0);
draw_text(thingposition[1],(view_hport[0] / 2) - 42,zoneNameTop);
draw_text(thingposition[2],(view_hport[0] / 2) + 2,zoneNameBottom);
draw_sprite(sprTitlecardAct,objRoomDefiner.zoneAct - 1,thingposition[3],view_hport[0] / 2);

// Delete Font
draw_set_font(-1);
font_delete(font);