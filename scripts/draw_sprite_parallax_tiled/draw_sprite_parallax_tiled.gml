function draw_sprite_parallax_tiled(sprite,frame,hspd,vspd,hoffset,voffset,hscroll,vscroll){
	var camx = camera_get_view_x(view_camera[0]);
	var camy = camera_get_view_y(view_camera[0]);
	var parax = ((camx + hoffset) * hspd) + (hscroll * globalTimer);
	var paray = ((camy + voffset) * vspd) + (vscroll * globalTimer);
	//var trux = (camx * (parax - camx) mod sprite_get_width(sprite));
	draw_sprite_tiled(sprite,frame,parax,paray);
}