/// @description Draw Text
// Create font
var font = font_add_sprite_ext(sprSmallFont,fontmapSonicSmall,false,false);
draw_set_font(font);
draw_set_halign(fa_center);
var xpos = view_wport[0] / 2;
var ypos = view_hport[0] / 2;
draw_text(xpos,0,"USE ARROW KEYS, ENTER, BACKSPACE");
switch(currMenu){
	case devMenu.main:
		draw_text(xpos,8,"NEEDLEMOUSE DEVMENU");
		draw_text(xpos,16,"BUILD 03");
		draw_set_color(c_grey);
		draw_text(xpos,24,"FRAMEWORK BY CHRISFURRY");
		// Options
		draw_set_color(devMenu_checkoption(currSel,0,c_grey,c_yellow));
		draw_text(xpos,ypos - 8,"Room Select");
		draw_set_color(devMenu_checkoption(currSel,1,c_grey,c_yellow));
		draw_text(xpos,ypos,"Options");
		draw_set_color(devMenu_checkoption(currSel,2,c_grey,c_yellow));
		draw_text(xpos,ypos + 8,"Exit");
		break;
	case devMenu.roomsel:
		draw_set_color(c_grey);
		draw_text(xpos,8,"NEEDLEMOUSE DEVMENU");
		draw_text(xpos,16,"BUILD 03");
		draw_text(xpos,24,"ROOM SELECT");
		var camY = (8 * -currSel) + ypos;
		var i = 0;
		for(var i = 0;i <= allRooms;i ++){
			var col = devMenu_checkoption(currSel,i,c_grey,c_yellow);
			draw_set_color(col);
			draw_text(view_wport[0] / 2,camY + (8 * i),room_get_name(i));
		}
		break;
	case devMenu.options:
		draw_text(xpos,8,"NEEDLEMOUSE DEVMENU");
		draw_text(xpos,16,"BUILD 03");
		draw_set_color(c_grey);
		draw_text(xpos,24,"OPTIONS");
		// Options
		draw_set_color(devMenu_checkoption(currSel,0,c_grey,c_yellow));
		draw_text(xpos,ypos - 8,"Window Scale:" + string(objGame.window_scale));
		draw_set_color(devMenu_checkoption(currSel,1,c_grey,c_yellow));
		draw_text(xpos,ypos,"Sound Volume");
		draw_set_color(devMenu_checkoption(currSel,2,c_grey,c_yellow));
		draw_text(xpos,ypos + 8,"Controls");
		break;
	case devMenu.controls:
		draw_text(xpos,8,"NEEDLEMOUSE DEVMENU");
		draw_text(xpos,16,"BUILD 03");
		draw_set_color(c_grey);
		draw_text(xpos,24,"CONTROL CONFIG");
		// Options
		draw_set_color(devMenu_checkoption(currSel,0,c_grey,c_yellow));
		draw_text(xpos,ypos - 16,"Key Up - " + string(key_get_name(objGameData.key_up)));
		draw_set_color(devMenu_checkoption(currSel,1,c_grey,c_yellow));
		draw_text(xpos,ypos - 8,"Key Down - " + string(key_get_name(objGameData.key_down)));
		draw_set_color(devMenu_checkoption(currSel,2,c_grey,c_yellow));
		draw_text(xpos,ypos,"Key Left - " + string(key_get_name(objGameData.key_left)));
		draw_set_color(devMenu_checkoption(currSel,3,c_grey,c_yellow));
		draw_text(xpos,ypos + 8,"Key Right - " + string(key_get_name(objGameData.key_right)));
		draw_set_color(devMenu_checkoption(currSel,4,c_grey,c_yellow));
		draw_text(xpos,ypos + 16,"Key A - " + string(key_get_name(objGameData.key_a)));
		draw_set_color(devMenu_checkoption(currSel,5,c_grey,c_yellow));
		draw_text(xpos,ypos + 24,"Key B - " + string(key_get_name(objGameData.key_b)));
		draw_set_color(devMenu_checkoption(currSel,6,c_grey,c_yellow));
		draw_text(xpos,ypos + 32,"Key C - " + string(key_get_name(objGameData.key_c)));
		break;
	case devMenu.collect_input:
		draw_text(xpos,ypos,"PRESS ANY KEY");
		break;
	case devMenu.volume:
		draw_text(xpos,8,"NEEDLEMOUSE DEVMENU");
		draw_text(xpos,16,"BUILD 03");
		draw_set_color(c_grey);
		draw_text(xpos,24,"OPTIONS");
		// Options
		draw_set_color(devMenu_checkoption(currSel,0,c_grey,c_yellow));
		draw_text(xpos,ypos - 8,"Sound: " + string(round(sfx_volume * 100)));
		draw_set_color(devMenu_checkoption(currSel,1,c_grey,c_yellow));
		draw_text(xpos,ypos,"Music: " + string(round(mus_volume * 100)));
		break;
}
// Delete Font
draw_set_font(-1);
draw_set_halign(fa_left);
font_delete(font);
draw_set_color(c_white);