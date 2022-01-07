function player_checktile(x,y,xoffset,yoffset,angle,tilelayer){
	var cx = x + (cosine[angle] * xoffset) + (sine[angle] * yoffset);
	var cy = y + (cosine[angle] * yoffset) - (sine[angle] * xoffset);
	cx = round(cx);
	cy = floor(cy);
	return collision_tile(cx,cy,tilelayer);
}