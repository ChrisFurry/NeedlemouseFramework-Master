function event_is_playing(is_player){
	if(g_event == gameEvents.playing || g_event == gameEvents.endlevel || g_event == gameEvents.cutscene)return true;
	if(g_event == gameEvents.playerdead && is_player)return true;
	return false;
}