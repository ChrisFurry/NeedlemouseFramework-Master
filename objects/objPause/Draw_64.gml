/// @description Draw pause buttons
if(!surface_exists(pause_surface)){
	pause_surface = surface_create(view_wport[0],view_hport[0]);
	surface_set_target(pause_surface);
	draw_surface(application_surface,0,0);
	surface_reset_target();
	instance_deactivate_all(true);
	instance_activate_object(objGame);
}
draw_surface_ext(pause_surface,0,0,1,1,0,c_blue,1);