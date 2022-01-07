function player_wallcollision(x,y,xoffset,yoffset,angle,dir){
	var coll = player_checkobject(x,y,(sensor_wall * dir) + xoffset,sensor_ywall + yoffset,angle,parSolid);
	if(coll){
		if(coll.solid_walls)return [coll,"Object"];
	}
	var tile = player_checktile(x,y,(sensor_wall * dir) + xoffset,sensor_ywall + yoffset,angle,tileLayerNames[solidLayer]);
	if(tile){
		if(tile < 147)return [tile,"Tile"];
	}
	return [false,"None"];
}