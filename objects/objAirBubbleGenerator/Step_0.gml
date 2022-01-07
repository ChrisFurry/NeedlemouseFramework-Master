/// @description Air bubble stuff
if(!event_is_playing(false) || !is_on_screen(64))exit;
timer ++;

if(timer mod 24 == 0){
	var rand = irandom(3);
	if(rand == 1){
		instance_create_depth(x - 5 + irandom(11),y,depth - 1,objBubbles_Tiny);
	}
}
if(timer mod 26 == 0){
	var rand = irandom(6);
	if(rand == 1){
		var eff = instance_create_depth(x - 5 + irandom(11),y,depth - 1,objBubbles_Tiny);
		eff.sprite_index = sprMediumBubbles;
	}
}
if(timer mod 60 == 0){
	var rand = irandom(6);
	if(rand == 1){
		instance_create_depth(x - 5 + irandom(11),y,depth - 1,objConsumableAirBubble);
	}
}