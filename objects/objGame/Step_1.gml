/// @description Window Size, Pause game
// Window and Screen size
if(window_changescale){
	// Change View (Just in case)
	view_enabled = true;
	view_visible[0] = true;
	camera_set_view_size(view_camera[0],screen_xscale,screen_yscale);
	view_wport[0] = screen_xscale;
	view_hport[0] = screen_yscale;
	// Application Surface
	surface_resize(application_surface,screen_xscale,screen_yscale);
	// Window Size
	var windowPrevW = window_get_width();
	var windowPrevH = window_get_height();
	var windowNewW = screen_xscale * window_scale;
	var windowNewH = screen_yscale * window_scale;
	window_set_size(windowNewW,windowNewH);
	var windowPosX = window_get_x();
	var windowPosY = window_get_y();
	window_set_position(windowPosX + ((windowPrevW - windowNewW) / 2),windowPosY + ((windowPrevH - windowNewH) / 2));
	// Fuck you variable
	window_changescale = false;
}

// Change Screen Size
if(keyboard_check_pressed(ord("1"))){
	window_scale = 1;
	window_changescale = true;
	save_settings();
}
if(keyboard_check_pressed(ord("2"))){
	window_scale = 2;
	window_changescale = true;
	save_settings();
}
if(keyboard_check_pressed(ord("3"))){
	window_scale = 3;
	window_changescale = true;
	save_settings();
}

// Pause game
if(g_event == gameEvents.playing){
	if(keyboard_check_pressed(vk_enter)){
		instance_create_depth(0,0,-200,objPause);
		g_event = gameEvents.paused;
		gamePaused = true;
	}
}else if(g_event == gameEvents.paused){
	if(!instance_exists(objPause) && gamePaused){
		g_event = gameEvents.playing;
		gamePaused = false;
	}
}