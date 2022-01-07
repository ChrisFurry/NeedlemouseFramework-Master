function load_controls(){
	ini_open("settings.ini");
	// Keyboard Settings
	objGameData.key_up = ini_read_real("Controls","Key Up",objGameData.default_key_up);
	objGameData.key_down = ini_read_real("Controls","Key Down",objGameData.default_key_down);
	objGameData.key_left = ini_read_real("Controls","Key Left",objGameData.default_key_left);
	objGameData.key_right = ini_read_real("Controls","Key Right",objGameData.default_key_right);
	objGameData.key_a = ini_read_real("Controls","Key A",objGameData.default_key_a);
	objGameData.key_b = ini_read_real("Controls","Key B",objGameData.default_key_b);
	objGameData.key_c = ini_read_real("Controls","Key C",objGameData.default_key_c);
	
	ini_close();
}