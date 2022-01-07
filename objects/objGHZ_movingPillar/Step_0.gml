/// @description Insert description here
// You can write your code in this editor
if(!event_is_playing(false))exit;
var angle = angle_wrap(globalTimer * moveSpd);
y = ystart + (sine[angle] * moveAmp);

// Inherit the parent event
event_inherited();

