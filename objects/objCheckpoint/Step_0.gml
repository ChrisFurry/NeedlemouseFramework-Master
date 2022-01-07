/// @description Awesome Movement
if(!event_is_playing(true))exit;
switch(state){
	case 0:
		ballXOffset = 0;
		ballYOffset = 0;
		ballxspeed = 0;
		ballyspeed = 0;
		ballFrame = 0;
		ballAnim_Spd = 0;
		ballMaxspeed = 8;
		var playerObj = instance_nearest(x,y,parPlayer);
		if(place_meeting(x,y,playerObj) && objGameData.checkpoint_object != id){
			state = 1;
			ballxspeed = playerObj.xspeed;
			ballyspeed = playerObj.yspeed;
			objGameData.checkpoint_active = true;
			objGameData.checkpoint_object = id;
			objGameData.checkpoint_room = room;
			objGameData.checkpoint_time = objRoomDefiner.timer;
			audio_stop_play_sound(sndCheckpoint,1,1);
			var eff = create_effect(sprRingCollect,1,x,y - 24,depth + 1);
			eff.hspeed = -1;
			eff.vspeed = -1;
			var eff = create_effect(sprRingCollect,1,x,y - 24,depth + 1);
			eff.hspeed = 1;
			eff.vspeed = -1;
			var eff = create_effect(sprRingCollect,1,x,y - 24,depth + 1);
			eff.hspeed = 1;
			eff.vspeed = 1;
			var eff = create_effect(sprRingCollect,1,x,y - 24,depth + 1);
			eff.hspeed = -1;
			eff.vspeed = 1;
			// Spawn Bonus
			if(objGameData.player_rings[0] >= 20){
				instance_create_depth(x,y - 32,depth-1,objBonusStagePortal);
			}
		}else if(place_meeting(x,y,parPlayer)){
			state = 2;
			playerObj.y += 12;
		}
		break;
	case 1:
		ballFrame = (ballFrame + 0.5) mod sprite_get_number(ballSprite);
		if(sign(ballxspeed) == sign(ballXOffset))ballxspeed -= 0.25 * sign(ballXOffset);
		if(sign(ballxspeed) != sign(ballXOffset))ballxspeed -= 0.2 * sign(ballXOffset);
		if(ballYOffset < 2 && ballYOffset > -2){ballyspeed += 0.3}else{
			if(sign(ballyspeed) == sign(ballYOffset))ballyspeed -= 0.25 * sign(ballYOffset);
			if(sign(ballyspeed) != sign(ballYOffset))ballyspeed -= 0.2 * sign(ballYOffset);
		}
		ballXOffset += ballxspeed;
		ballYOffset += ballyspeed;
		if((abs(ballxspeed) < 2.5 && abs(ballYOffset) < 2.5) && (abs(ballXOffset) < 2 && abs(ballYOffset) < 2))state = 2;
		break;
	case 2:
		ballXOffset = 0;
		ballYOffset = 0;
		ballxspeed = 0;
		ballyspeed = 0;
		ballFrame = (ballFrame + 0.2) mod sprite_get_number(ballSprite);
		break;
}