/// @description The

if(keyboard_check_pressed(vk_space)){
	objGameData.checkpoint_active = true;
	with(objPlayer)player_reset();
	room_goto(objGameData.return_room);
}