function player_floorcollision(x,y,xoffset,yoffset,angle){
	var coll1 = player_checkobject(x,y,-sensor_width + xoffset,sensor_height + yoffset,angle,parSolid);
	var coll2 = player_checkobject(x,y,sensor_width + xoffset,sensor_height + yoffset,angle,parSolid);
	if(coll1 || coll2){
		if(coll2){
			if(coll2.solid_floor)return [coll2,"Object"];
		}
		if(coll1){
			if(coll1.solid_floor)return [coll1,"Object"];
		}
	}
	var tile1 = player_checktile(x,y,-sensor_width + xoffset,sensor_height + yoffset,angle,tileLayerNames[solidLayer]);
	var tile2 = player_checktile(x,y,sensor_width + xoffset,sensor_height + yoffset,angle,tileLayerNames[solidLayer]);
	if(tile1 || tile2){
		if(tile2){
			return [tile2,"Tile"];
		}
		if(tile1){
			return [tile1,"Tile"];
		}
	}
	return [false,"None"];
}