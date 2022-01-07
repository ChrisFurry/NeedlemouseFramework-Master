/// @description 
// Set Up Player + Player Variables
globalvar player;
player[0] = instance_create_depth(0,0,10,objPlayer);
player[0].player_id = 0;
spawnpoint_object = objPlayer_spawnA;
//-Player Ability
sonicAbility = playerSonicAbility.hammerdrop;
enum playerSonicAbility {
	none,
	instashield,
	dropdash,
	hammerdrop
}
//-Player Data
player_rings[0] = 0;
player_rings[1] = 0;
player_score[0] = 0;
player_score[1] = 0;
player_shield[0] = 0;
player_shield[1] = 0;
player_lives[0] = 3;
player_emeralds = 0;
// HOW EMERALD VARIABLE WORKS
// 1 = 1st emerald (lol)
// 2 = 2nd emerald
// 4 = 3rd emerald
// 8 = 4th emerald
// 16 = 5th emerald
// 32 = 6th emerald
// 64 = 7th emerald
// so having all 7 would be 127
// If you for whatever reason want to add another, multiply the last variable by 2
//
//-Checkpoint Data
checkpoint_active = false;
checkpoint_room = -1;
checkpoint_object = -1;
checkpoint_time = 0;
//-Special Stage Data
specialRing_got = false;
specialstage_goto = 0;
//-Other
return_room = rmDevMenu;

// Start Room Stuff
spawnTitlecard = true;
titlecardBlack = true;

// FPS
gameFPS = 60;

// Player Stuff
playerHasControl[0] = true;

// Default Controls
default_key_up = vk_up;
default_key_down = vk_down;
default_key_left = vk_left;
default_key_right = vk_right;
default_key_a = ord("Z");
default_key_b = ord("X");
default_key_c = ord("C");

// Used Controls
key_up = default_key_up;
key_down = default_key_down;
key_left = default_key_left;
key_right = default_key_right;
key_a = default_key_a;
key_b = default_key_b;
key_c = default_key_c;