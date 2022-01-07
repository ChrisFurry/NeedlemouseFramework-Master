/// @description Follow camera
if(finished){
	timer ++;
	if(timer > 60)instance_destroy();
	if(instance_number(objDrowningNumbers) > 1)instance_destroy();
	x = objCamera.camera_x + xoffset;
	y = objCamera.camera_y + yoffset;
	vspeed = 0;
}else{
	vspeed -= 0.05;
}
