/// @description Draw Text
// Create font
var font = font_add_sprite_ext(sprSmallFont,fontmapSonicSmall,false,false);
draw_set_font(font);
// Draw Text
var xoffset = 8;
for(var i = 1;i <= string_length(credittext1);i ++){
	if(string_char_at(credittext1,i) != " ")draw_text(x + (xoffset * i),y + (sine[angle_wrap(round((globalTimer + i) / 2))] * 3),string_char_at(credittext1,i));
}
// Delete Font
draw_set_font(-1);
draw_set_halign(fa_left);
font_delete(font);
draw_set_color(c_white);