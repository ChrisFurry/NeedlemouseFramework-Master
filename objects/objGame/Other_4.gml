/// @description Setup Views
view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0],screen_xscale,screen_yscale);
view_wport[0] = screen_xscale;
view_hport[0] = screen_yscale;
surface_resize(application_surface,screen_xscale,screen_yscale);
window_changescale = true;
globalTimer = 0;