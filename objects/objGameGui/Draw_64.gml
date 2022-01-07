/// @description Draw Hud

if(gui_player_enabled){
	var hudfont1 = font_add_sprite_ext(sprPHud_BigNumbers,"0123456789*X",false,false);
	var hudfont2 = font_add_sprite_ext(sprPHud_SmallNumbers,"0123456789*",false,false);
	var guiX = gui_player_var0;
	var p1Rings = objGameData.player_rings[0];
	var p1Score = objGameData.player_score[0];
	var p1Lives = objGameData.player_lives[0];
	var zoneTime = objRoomDefiner.timer;
	draw_set_font(hudfont1);
	// Base
	draw_sprite(sprPHud_base,0,guiX + 16,24);
	// Flash
	if(p1Rings <= 0 && ((globalTimer mod 20) < 10))draw_sprite(sprPHud_base,1,guiX + 16,24);
	// Rings Counter
	draw_set_halign(fa_right);
	var ringscount = string(p1Rings);
	if(p1Rings < 10)ringscount = "*" + string(ringscount);
	if(p1Rings < 100)ringscount = "*" + string(ringscount);
	draw_text(guiX + 86,40,string(ringscount));
	// Timer
	var minutes = string(floor(zoneTime / 3600));
	var seconds = string(floor(zoneTime / 60) mod 60);
	if(seconds < 10)seconds = "0" + seconds;
	var milli = string(floor(zoneTime / 0.60) mod 99);
	if(milli < 10)milli = "0" + milli;
	var timerTime = minutes + " " + seconds + " " + milli;
	draw_text(guiX + 112,27,timerTime);
	// Score
	draw_set_font(hudfont2);
	var scoreCount = string(p1Score);
	if(p1Score < 10)scoreCount = "*" + string(scoreCount);
	if(p1Score < 100)scoreCount = "*" + string(scoreCount);
	if(p1Score < 1000)scoreCount = "*" + string(scoreCount);
	if(p1Score < 10000)scoreCount = "*" + string(scoreCount);
	if(p1Score < 100000)scoreCount = "*" + string(scoreCount);
	if(p1Score < 1000000)scoreCount = "*" + string(scoreCount);
	if(p1Score < 10000000)scoreCount = "*" + string(scoreCount);
	if(p1Score < 100000000)scoreCount = "*" + string(scoreCount);
	draw_text(guiX + 96,16,scoreCount);
	// Life Icons
	draw_set_font(hudfont1);
	draw_set_halign(fa_left);
	var livescount = p1Lives;
	if(p1Lives < 10)livescount = "*" + string(livescount);
	if(p1Lives < 100)livescount = "*" + string(livescount);
	draw_sprite(sprPHud_LifeIcons,player[0].lifeIcon_index,guiX + 16,view_hport[0] - 24);
	draw_text(guiX + 40,view_hport[0] - 24,"X " + string(livescount));
	
	// delete font
	draw_set_halign(fa_left);
	draw_set_font(-1);
	font_delete(hudfont1);
	font_delete(hudfont2);
}