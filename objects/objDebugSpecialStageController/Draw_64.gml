/// @description Draw text

var halfX = view_wport[0] / 2;
var halfY = view_hport[0] / 2;
draw_set_halign(fa_center);
draw_set_color(c_black);

draw_text(halfX,halfY - 32,"SPECIAL STAGE " + string(specialstage_number + 1));
draw_text(halfX,halfY + 16,"Press Z to win");
draw_text(halfX,halfY + 32,"Press X to lose");
draw_text(halfX,halfY + 48,objGameData.player_emeralds);
draw_text(halfX,halfY + 64,objGameData.specialstage_goto);
// Draw emeralds
var i = 0;
repeat(7){
	if((objGameData.player_emeralds & power(2,i)) != 0)draw_sprite(sprChaosEmeralds,i,halfX - 56 + (16 * i),halfY);
	i ++;
}

draw_set_halign(fa_left);
draw_set_color(c_white);