function is_on_screen(margin){
	var camx = camera_get_view_x(view_camera[0]);
	var camy = camera_get_view_y(view_camera[0]);
	var right_check = (bbox_right < camx + view_wport[0] + margin);
	var left_check = (bbox_left > camx - margin);
	if(right_check && left_check)return true;
	
	return false;
}