/// @description Draw Menu Stuff
var halfWidth = view_wport[0] / 2;
var halfHeight = view_hport[0] / 2;
var checkersx = timer mod 96;
var checkersy = timer mod 64;

// Draw A Line thingy
var i = 3;
var i2 = 1;
var menuspd = 0.01;
leaveMenuTimes[i] = leaveMenuTimes[i] + leaveMenuSpds[i] * i2;
if(clamp(leaveMenuRotate - (2 * (i + 1)),0,1) > 0)leaveMenuSpds[i] += 0.002;
draw_sprite_ext(sprMainMenuStuff,1,halfWidth,halfHeight,1 + power(leaveMenuTimes[i],2),1 + power(leaveMenuTimes[i],2),-leaveMenuTimes[i] * 2,c_white,1);

// Draw Menu Checkers
draw_sprite_tiled_ext(sprMainMenuCheckers,0,x + checkersx,y + checkersy,1 + (leaveMenuTimes[i] * 0.6),1 + (leaveMenuTimes[i] * 2),c_white,1 - (leaveMenuTimer * 0.05));

// Draw Another
i --;
i2 ++;
leaveMenuTimes[i] = leaveMenuTimes[i] + leaveMenuSpds[i] * i2;
if(clamp(leaveMenuRotate - (2 * (i + 1)),0,1) > 0)leaveMenuSpds[i] += 0.007
draw_sprite_ext(sprMainMenuStuff,2,halfWidth,halfHeight,1 + power(leaveMenuTimes[i],2),1 + power(leaveMenuTimes[i],2),leaveMenuTimes[i] * 2,c_white,1);

// Draw Menu Sonic Afterimageig?
i --;
i2 ++;
draw_sprite_ext(sprMainMenuSonic,1,halfWidth,halfHeight,1 + power(leaveMenuTimes[i],2),1 + power(leaveMenuTimes[i],2),-leaveMenuTimes[i] * 2,c_white,1);
// Draw Menu Sonic
leaveMenuTimes[i] = leaveMenuTimes[i] + leaveMenuSpds[i] * i2;
if(clamp(leaveMenuRotate - (2 * (i + 1)),0,1) > 0)leaveMenuSpds[i] += 0.01;
draw_sprite_ext(sprMainMenuSonic,0,halfWidth,halfHeight,1 + power(leaveMenuTimes[i],2),1 + power(leaveMenuTimes[i],2),-leaveMenuTimes[i] * 2,c_white,1);

// Draw Orang thingy
i --;
i2 ++;
leaveMenuTimes[i] = leaveMenuTimes[i] + leaveMenuSpds[i] * i2;
if(clamp(leaveMenuRotate - (2 * (i + 1)),0,1) > 0)leaveMenuSpds[i] += 0.02;
draw_sprite_ext(sprMainMenuStuff,0,halfWidth,halfHeight,1 + power(leaveMenuTimes[i],2),1 + power(leaveMenuTimes[i],2),-leaveMenuTimes[i] * 2,c_white,1);

// Menu Options
switch(state){
	case 0: // Main
		for(var i = 0;i <= 2;i++){
			var selected = (menuOpt == i);
			draw_sprite(sprMenuOptions,(i * 2) + selected,16 + (menuPos2 + (baseXMove * i)),halfHeight + (menuPos + (baseYMove * i)));
		}
		break;
	case 1: // Options
		for(var i = 0;i <= 1;i++){
			var selected = (menuOpt == i);
			draw_sprite(sprMenuOptions,((i + 3) * 2) + selected,16 + (menuPos2 + (baseXMove * i)),halfHeight + (menuPos + (baseYMove * i)));
		}
		var selected = (menuOpt == 2);
		var color = c_white;
		if(selected)color = c_yellow;
		draw_text_color(16 + (menuPos2 + (baseXMove * 2)),halfHeight + (menuPos + (baseYMove * 2)),"Window Size : " + string(objGame.window_scale),color,color,color,color,1);
		break;
	case 2: // Controls
		for(var i = 0;i <= 6;i++){
			var selected = (menuOpt == i);
			var color = c_white;
			if(selected)color = c_yellow;
			switch(i){
				case 0:
					var key = "Up = " + string(key_get_name(objGameData.key_up));
					break;
				case 1:
					var key = "Down = " + string(key_get_name(objGameData.key_down));
					break;
				case 2:
					var key = "Left = " + string(key_get_name(objGameData.key_left));
					break;
				case 3:
					var key = "Right = " + string(key_get_name(objGameData.key_right));
					break;
				case 4:
					var key = "A = " + string(key_get_name(objGameData.key_a));
					break;
				case 5:
					var key = "B = " + string(key_get_name(objGameData.key_b));
					break;
				case 6:
					var key = "C = " + string(key_get_name(objGameData.key_c));
					break;
			}
			draw_text_color(16 + (menuPos2 + (baseXMove * i)),halfHeight + (menuPos + (baseYMove * i)),key,color,color,color,color,1);
		}
		break;
	case 3:
		for(var i = 0;i <= 6;i++){
			var selected = (menuOpt == i);
			var color = c_white;
			if(selected)color = c_yellow;
			switch(i){
				case 0:
					var key = "Up = " + string(key_get_name(objGameData.key_up));
					if(selected)key = "Up = ..."
					break;
				case 1:
					var key = "Down = " + string(key_get_name(objGameData.key_down));
					if(selected)key = "Down = ..."
					break;
				case 2:
					var key = "Left = " + string(key_get_name(objGameData.key_left));
					if(selected)key = "Left = ..."
					break;
				case 3:
					var key = "Right = " + string(key_get_name(objGameData.key_right));
					if(selected)key = "Right = ..."
					break;
				case 4:
					var key = "A = " + string(key_get_name(objGameData.key_a));
					if(selected)key = "A = ..."
					break;
				case 5:
					var key = "B = " + string(key_get_name(objGameData.key_b));
					if(selected)key = "B = ..."
					break;
				case 6:
					var key = "C = " + string(key_get_name(objGameData.key_c));
					if(selected)key = "C = ..."
					break;
			}
			draw_text_color(16 + (menuPos2 + (baseXMove * i)),halfHeight + (menuPos + (baseYMove * i)),key,color,color,color,color,1);
		}
		break;
	case 4:
		var selected = (menuOpt == 0);
		var color = c_white;
		if(selected)color = c_yellow;
		draw_text_color(16 + (menuPos2 + (baseXMove * 0)),halfHeight + (menuPos + (baseYMove * 0)),"Sound Volume : " + string(round(sfx_volume * 100)),color,color,color,color,1);
		var selected = (menuOpt == 1);
		var color = c_white;
		if(selected)color = c_yellow;
		draw_text_color(16 + (menuPos2 + (baseXMove * 1)),halfHeight + (menuPos + (baseYMove * 1)),"Music Volume : " + string(round(mus_volume * 100)),color,color,color,color,1);
		break;
	case 10:
		for(var i = 0;i <= 2;i++){
			var selected = 0;
			draw_sprite(sprMenuOptions,(i * 2) + selected,16 + (menuPos + (baseXMove * i)),halfHeight + (menuPos + (baseYMove * i)));
		}
		break;
	case 12:
		for(var i = 0;i <= 2;i++){
			var selected = 0;
			draw_sprite(sprMenuOptions,(i * 2) + selected,16 + (menuPos + (baseXMove * i)),halfHeight + (menuPos + (baseYMove * i)));
		}
		break;
}
// Menu Text
draw_sprite(sprMainMenuText,(state != 0 && state != 10 && state != 11 && state != 12),halfWidth,16 - leaveMenuTimer * 4);

// Fade
var i3 = (timer * 0.075);
if(i3 < 3){
	gpu_set_blendenable(true);
	gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
	var fadechop = 20;
	var r = clamp(round((i3 * 110) / fadechop) * fadechop,0,255);
	var g = clamp(round((i3 * 110) / fadechop) * fadechop,0,255);
	var b = clamp(round((i3 * 255) / fadechop) * fadechop,0,255);
	var col = make_color_rgb(r,g,b);
	draw_rectangle_color(0,0,view_wport[0],view_hport[0],col,col,col,col,false);
	gpu_set_blendmode(bm_normal);
}

// Debug
//if(!g_debug_mode)exit;
//draw_text(0,0,string(state));