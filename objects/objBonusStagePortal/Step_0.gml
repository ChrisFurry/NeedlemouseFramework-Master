/// @description Cool timing code

value5 += 18;
value5 &= 511;
value6 += 4;
value6 &= 511;

if(timer < 128){
	sparkle_spread ++;
}else if(timer > 472){
	sparkle_spread --;
	if(timer >= 600)instance_destroy();
}
timer ++;

if(timer > 60){
	var playerObj = instance_nearest(x,y,objPlayer);
	if(playerObj && !instance_exists(objBonusStageFade)){
		if(abs(distance_to_point(playerObj.x,playerObj.y)) < 20){
			g_event = gameEvents.paused;
			instance_create_depth(0,0,-1,objBonusStageFade);
		}
	}
	if(instance_exists(objBonusStageFade)){
		if(objBonusStageFade.Finished){
			objGameData.return_room = room;
			objGameData.checkpoint_active = false;
			with(objPlayer)player_reset();
			room_goto(zoneBonusStage);
		}
	}
}