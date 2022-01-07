function player_checkobject(x,y,xoffset,yoffset,angle,object){
	var cx = x + (cosine[angle] * xoffset) + (sine[angle] * yoffset);
	var cy = y + (cosine[angle] * yoffset) - (sine[angle] * xoffset);
	cx = round(cx);
	cy = floor(cy);
	return instance_position(cx,cy,object);
}