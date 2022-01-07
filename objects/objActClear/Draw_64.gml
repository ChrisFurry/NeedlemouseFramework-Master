/// @description 
// Create Font
var font = font_add_sprite_ext(sprTitlecardFont,titlecard_fontmap,true,true);
var hudfont1 = font_add_sprite_ext(sprPHud_BigNumbers,"0123456789*X",false,false);
draw_set_font(font);
draw_set_halign(fa_center);
// Draw Text
draw_text(posx[0],32,topText);
draw_text(posx[1],64,bottomText);
draw_sprite(sprTitlecardAct,act - 1,posx[2],64);
// Draw Bonuses
var xpos = (view_wport[0] / 2) - 16;
draw_sprite(sprGUIBonusTally,0,xpos,posy[0]);
draw_sprite(sprGUIBonusTally,1,xpos,posy[1]);
if(perfect_bonus > -1)draw_sprite(sprGUIBonusTally,2,xpos,posy[2]);
draw_sprite(sprGUIBonusTally,3,xpos,posy[3]);
// Draw bonuses count
draw_set_font(hudfont1);
draw_set_halign(fa_right);
var xpos = (view_wport[0] / 2) + 64;
draw_text(xpos,posy[0],ring_bonus);
draw_text(xpos,posy[1],time_bonus);
if(perfect_bonus > -1)draw_text(xpos,posy[2],perfect_bonus);
draw_text(xpos,posy[3],new_score);
// Delete Font
draw_set_font(-1);
font_delete(font);
font_delete(hudfont1);