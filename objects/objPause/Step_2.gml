/// @description Unpause
pause_buffer = max(pause_buffer - 1,0);
if(keyboard_check_pressed(vk_enter) && !pause_buffer){
	surface_free(pause_surface);
	instance_activate_all();
	instance_destroy();
}