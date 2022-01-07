/// @description DEBUG: To dev menu

if(debug_mode || dev_menu_active){
	if(room == rmMainMenu){
		if(objMainMenu.state == 12)exit;
	}
	with(objGameData){
		player_rings[0] = 0;
		player_rings[1] = 0;
		player_score[0] = 0;
		player_score[1] = 0;
		player_lives[0] = 3;
		checkpoint_active = false;
		checkpoint_object = -1;
		checkpoint_room = -1;
		checkpoint_time = 0;
	}
	g_event = gameEvents.none;
	with(parPlayer)player_reset();
	parPlayer.visible = false;
	room_goto(rmDevMenu);
}
