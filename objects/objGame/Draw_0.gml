/// @description Draw Palette Changes
// Code commented out due to palette shader being taken out for not having permission
switch(room){
	case zoneGHZ2:
		/*var surface = surface_create(view_wport[0],view_hport[0]);
		// Change water palette
		var palette = (round(globalTimer / 10) mod 4) + 1
		pal_swap_set(sprGHZWaterPalette,palette,false);
		surface_set_target(surface);
		draw_surface(application_surface,0,0);
		surface_reset_target();
		// Sunset palette
		pal_swap_set(sprGHZPalettes,1,false);
		draw_surface(surface,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
		// Delete surface
		surface_free(surface);*/
		break;
	case zoneCredits:
		/*var surface = surface_create(view_wport[0],view_hport[0]);
		// Change water palette
		var palette = (round(globalTimer / 10) mod 4) + 1
		pal_swap_set(sprGHZWaterPalette,palette,false);
		surface_set_target(surface);
		draw_surface(application_surface,0,0);
		surface_reset_target();
		// Night palette
		pal_swap_set(sprGHZPalettes,2,false);
		draw_surface(surface,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
		// Delete surface
		surface_free(surface);*/
		break;
}
//pal_swap_reset();
