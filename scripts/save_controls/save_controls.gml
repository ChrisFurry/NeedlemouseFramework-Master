function save_controls(){
	ini_open("settings.ini");
	// Keyboard Settings
	ini_write_real("Controls","Key Up",objGameData.key_up);
	ini_write_real("Controls","Key Down",objGameData.key_down);
	ini_write_real("Controls","Key Left",objGameData.key_left);
	ini_write_real("Controls","Key Right",objGameData.key_right);
	ini_write_real("Controls","Key A",objGameData.key_a);
	ini_write_real("Controls","Key B",objGameData.key_b);
	ini_write_real("Controls","Key C",objGameData.key_c);
	
	ini_close();
}