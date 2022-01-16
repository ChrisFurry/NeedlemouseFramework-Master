function player_ceilingcollision(x,y,xoffset,yoffset,angle){
	var coll1 = player_checkobject(x,y,-sensor_width + xoffset,-sensor_height + yoffset,angle,parSolid);
	var coll2 = player_checkobject(x,y,sensor_width + xoffset,-sensor_height + yoffset,angle,parSolid);
	if(coll1 || coll2){
		if(coll2){
			if(coll2.solid_ceiling)return [coll2,"Object"];
		}
		if(coll1){
			if(coll1.solid_ceiling)return [coll1,"Object"];
		}
	}
	var tile1 = player_checktile(x,y,-sensor_width + xoffset,-sensor_height + yoffset,angle,tileLayerNames[solidLayer]);
	var tile2 = player_checktile(x,y,sensor_width + xoffset,-sensor_height + yoffset,angle,tileLayerNames[solidLayer]);
	if(tile1 || tile2){
		if(tile2 && tile2 < 147)return [tile2,"Tile"];
		if(tile1 && tile1 < 147)return [tile1,"Tile"];
	}
	return [false,"None"];
}