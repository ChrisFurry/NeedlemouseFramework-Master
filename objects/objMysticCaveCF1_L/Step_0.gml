/// @description The cool collapse!

if(!collapse_active){
	var playerObj = instance_nearest(x,y,parPlayer);
	if(playerObj){
		if(playerObj.floor_id == id && playerObj.floor_type == "Object"){
			collapse_active = true;
		}
	}
}else{
	timer ++;
	if(timer == 60){
		visible = false;
		for(var i = 0; i < sprite_get_number(SpriteChunks);i ++){
			var tile = instance_create_depth(x,y,depth,objCollapseTile);
			tile.life = (sprite_get_number(SpriteChunks) - i) * 2.5;
			tile.sprite_index = SpriteChunks;
			tile.image_index = i;
		}
		audio_stop_play_sound(sndCollapsingFloor,1,1);
	}
	if(timer >= 90)instance_destroy();
}


// Inherit the parent event
event_inherited();

