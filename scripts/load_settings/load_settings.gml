function load_settings(){
	ini_open("settings.ini");
	// Window Settings
	objGame.window_scale = ini_read_real("Window","Screen Size",2);
	sfx_volume = ini_read_real("Volume","Sound",1);
	mus_volume = ini_read_real("Volume","Music",1);
	
	ini_close();
}