/// @description When player touch
if(place_meeting(x,y,parPlayer)){
	objGameData.playerHasControl[0] = false;
	with(parPlayer){
		objGame.dev_menu_active = true;
		key_right = 1;
		rolling = true;
		ball_form = true;
		gspeed += 0.5;
		xspeed = gspeed;
		objCamera.player_lockedin = false;
		if(x - 32 > room_width){
			objCamera.camera_followplayer = false;
			state = -1;
		}
	}
}
