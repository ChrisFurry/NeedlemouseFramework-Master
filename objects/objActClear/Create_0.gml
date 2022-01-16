/// @description Init

topText = player[0].character_name + " got";
bottomText = "through act";
act = objRoomDefiner.zoneAct;
state = 0;
timer = 0;
stayAfterTally = true;

posx[0] = view_wport[0] * 2;
posx[1] = -view_wport[0];
posx[2] = view_wport[0];

posy[0] = view_hport[0];
posy[1] = view_hport[0];
posy[2] = view_hport[0];
posy[3] = view_hport[0];

ring_bonus = 0;
time_bonus = 0;
perfect_bonus = -1;
new_score = 0;

// Calculate Bonuses
ring_bonus = objGameData.player_rings[0] * 100;
// lol
var levelTime = objRoomDefiner.timer;
if(levelTime <= get_time_frames(0,0,59)){
	time_bonus = 5000;
}else if(levelTime <= get_time_frames(0,1,29)){
	time_bonus = 1000;
}else if(levelTime <= get_time_frames(0,1,59)){
	time_bonus = 500;
}else if(levelTime <= get_time_frames(0,2,29)){
	time_bonus = 400;
}else if(levelTime <= get_time_frames(0,2,59)){
	time_bonus = 300;
}else if(levelTime <= get_time_frames(0,3,29)){
	time_bonus = 100;
}else if(levelTime <= get_time_frames(0,9,58)){
	time_bonus = 10;
}else if(levelTime <= get_time_frames(0,10,0)){
	time_bonus = 10000;
}
if(objGameData.player_rings[0] == objRoomDefiner.zoneRing_total)perfect_bonus = 50000;