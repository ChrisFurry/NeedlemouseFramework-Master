/// @description Draw Background
switch(currentBG){
	case "GHZ2":
		draw_sprite(sprGHZBG2,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
		break;
	case "SonicWorlds":
		draw_set_color(make_color_rgb(78 - 30 * cosine[angle_wrap(globalTimer / 10)], 0, 0));
		draw_rectangle(0,0,room_width,room_height,false);
		draw_set_color(c_white);
		draw_sprite_parallax_tiled(sprSonicWorldsBG,0,0.8,0.8,0,0,0,0);
		break;
}

if(!event_is_playing(false))exit;
bgTimer ++;