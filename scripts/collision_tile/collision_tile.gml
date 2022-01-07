function collision_tile(x,y,tileLayer){
	x = round(x);
	y = round(y);
	if(x < 0 || x > room_width || y < 0 || y > room_height)return false;
	var _tm = layer_tilemap_get_id(tileLayer);
	var _checker = objTileColl;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 
	
	var _x = tilemap_get_cell_x_at_pixel(_tm, x, y);
	var _y = tilemap_get_cell_y_at_pixel(_tm, x, y);
	var _tile = tilemap_get(_tm, _x, _y);
	var _tile2 = tile_get_index(_tile);
	if(_tile2 == false)return false;
	var flip = 1;
	var mirror = 1;
	if(tile_get_flip(_tile))flip = -1;
	if(tile_get_mirror(_tile))mirror = -1;
	tempTileData_Mirror = (mirror == -1);
	tempTileData_Flip = (flip == -1);
	if(_tile2){
		if(_tile2 == 1)return _tile2;
		
		_checker.x = (_x * tilemap_get_tile_width(_tm)) + 8;
		_checker.y = (_y * tilemap_get_tile_height(_tm)) + 8;
		_checker.image_index = _tile2;
		_checker.image_xscale = mirror;
		_checker.image_yscale = flip;

		if(instance_position(x,y,_checker)) return _tile2;
	}
	return false;
}