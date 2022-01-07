/// @description Debug Variables
if(!debug_view)exit;
var font = font_add_sprite_ext(sprSmallFont,fontmapSonicSmall,false,false);
draw_set_font(font);
draw_set_halign(fa_right);
var xpos = view_wport[0];
draw_text(xpos,0,string(xspeed) + "  " + string(x) + ":X");
draw_text(xpos,8,string(yspeed) + "  " + string(y) + ":Y");
draw_text(xpos,16,string(gspeed) + ":Gspeed");
draw_text(xpos,24,string(angle) + ":Angle");
draw_text(xpos,32,string(angle_fake) + ":Angle_Fake");
draw_text(xpos,40,string(angle_smooth) + ":Angle_Smooth");
draw_text(xpos,48,string(animation_angle) + ":Anim_Angle");
draw_text(xpos,56,string(horizontal_control_lock) + ":HorLock");
draw_text(xpos,64,string(image_index) + ":ImageIndex");
draw_text(xpos,64 + 8,string(animation_frame) + ":AnimFrame");

draw_text(xpos,view_hport[0] - 8,string(fps_real) + ":FPS REAL");
draw_text(xpos,view_hport[0] - 16,string(fps) + ":FPS");
draw_set_font(-1);
draw_set_halign(fa_left);
font_delete(font);