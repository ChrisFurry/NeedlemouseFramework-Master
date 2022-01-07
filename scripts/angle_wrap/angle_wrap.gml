function angle_wrap(angle){
	angle = angle mod 360;
	if(angle < 0)angle = 360 + angle;
	return angle;
}