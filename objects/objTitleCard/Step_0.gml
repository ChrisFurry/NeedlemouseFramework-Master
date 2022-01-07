/// @description The events

if(timer == 0 && state == 0 && drawBlack){
	g_event = gameEvents.paused;
	objGameGui.gui_player_onscreen = false;
}else if(timer == 0 && state == 0 && !drawBlack){
	g_event = gameEvents.cutscene;
	objGameGui.gui_player_onscreen = false;
}

timer ++;
var bannerSpd = 20;
switch(state){
	case 0:
		thingposition[0] = min(thingposition[0] + bannerSpd,view_wport[0] / 2.5);
		if(timer > 10)thingposition[1] = max(thingposition[1] - bannerSpd,view_wport[0] / 3);
		if(timer > 20)thingposition[2] = max(thingposition[2] - bannerSpd,view_wport[0] / 3);
		if(timer > 30)thingposition[3] = max(thingposition[3] - bannerSpd,view_wport[0] / 1.2);
		if(timer >= 120){
			state = 1;
			timer = 0;
			g_event = gameEvents.cutscene;
		}
		break;
	case 1:
		fade += 0.1;
		if(timer >= 60){
			state = 2;
			timer = 0;
			objGameGui.gui_player_onscreen = true;
			objRoomDefiner.timer_active = true;
			g_event = gameEvents.playing;
		}
		break;
	case 2:
		if(timer > 30)thingposition[0] -= bannerSpd;
		if(timer > 20)thingposition[1] += bannerSpd;
		if(timer > 10)thingposition[2] += bannerSpd;
		thingposition[3] += bannerSpd;
		if(timer >= 120){
			instance_destroy();
		}
		break;
}