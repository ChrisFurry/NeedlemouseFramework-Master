function save_settings(){
	ini_open("settings.ini");
	// Window Settings
	ini_write_real("Window","Screen Size",objGame.window_scale);
	ini_write_real("Volume","Sound",sfx_volume);
	ini_write_real("Volume","Music",mus_volume);
	
	ini_close();
}