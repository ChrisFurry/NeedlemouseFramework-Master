function player_changeSensorSize(newwidth,newheight,newwall){
	if(sensor_width != newheight || sensor_height != newheight){
		x -= (sensor_height - newheight) * sine[sensor_angle];
		y -= (sensor_height - newheight) * cosine[sensor_angle];
	}
	sensor_width = newwidth;
	sensor_height = newheight;
	sensor_wall = newwall;
}