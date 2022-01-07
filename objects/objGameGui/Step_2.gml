/// @description Insert description here
// You can write your code in this editor
if(gui_player_enabled){
	if(gui_player_onscreen){
		gui_player_var0 = lerp(gui_player_var0,0,0.2);
	}else{
		gui_player_var0 = clamp(gui_player_var0 + (gui_player_var0 / 4),-128,-1);
	}
}