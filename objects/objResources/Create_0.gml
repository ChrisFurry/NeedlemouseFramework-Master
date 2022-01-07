

// ANIMATION ARRAYS
/*Each character has an Animation Array,
/ It's very simple to learn.
/ If you need help, check out the Sonic 1 ANI files to kinda understand how i did it.
*/
// Animation Enum
enum playerANI {
	idle,
	wait,
	lookup,
	duck,
	walk,
	walk45,
	run,
	run45,
	peelout,
	peelout45,
	skid,
	push,
	roll,
	spring,
	spindash,
	spindashFast,
	hurt,
	die,
	burnt,
	drown,
	hammerdrop,
	victoryJump
}
#region Sonic
var array = [0];
var delay = 1;
var sprite = sprPlayer_Sonic_Main;

animation_create(array,playerANI.idle,sprite,24,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,3,4,afBack,2);
animation_create(array,playerANI.wait,sprite,24,1,2,2,2,3,4,afBack,2); // I was gonna remove it but i wont just incase you wanna do a separate animation for it
animation_create(array,playerANI.lookup,sprite,10,5,6,afBack,1);
animation_create(array,playerANI.duck,sprite,10,7,8,afBack,1);
animation_create(array,playerANI.walk,sprite,1,9,10,11,12,13,14,15,16,afEnd);
animation_create(array,playerANI.walk45,sprite,1,17,18,19,20,21,22,23,24,afEnd);
animation_create(array,playerANI.run,sprite,1,25,26,27,28,afEnd);
animation_create(array,playerANI.run45,sprite,1,29,30,31,32,afEnd);
animation_create(array,playerANI.peelout,sprite,1,33,34,35,36,afEnd);
animation_create(array,playerANI.peelout45,sprite,1,37,38,39,40,afEnd);
animation_create(array,playerANI.push,sprite,1,41,42,43,44,45,46,afEnd);
animation_create(array,playerANI.skid,sprite,4,47,48,49,48,afEnd);

var sprite = sprPlayer_Sonic_BallForm;
animation_create(array,playerANI.roll,sprite,1,0,1,0,2,0,3,0,4,afEnd);
animation_create(array,playerANI.spindash,sprite,1,15,16,15,17,15,18,15,19,15,20,afEnd);
animation_create(array,playerANI.spindashFast,sprite,1,21,22,21,23,21,24,21,25,21,26,afEnd);
animation_create(array,playerANI.hammerdrop,sprite,1,5,27,28,29,30,31,32,31,33,31,34,31,35,31,36,afBack,7);

var sprite = sprPlayer_Sonic_Gimmick;
animation_create(array,playerANI.spring,sprite,3,0,1,2,3,4,afEnd);

var sprite = sprPlayer_Sonic_Damage;
animation_create(array,playerANI.hurt,sprite,10,0,afEnd);
animation_create(array,playerANI.die,sprite,10,1,afEnd);
animation_create(array,playerANI.burnt,sprite,10,2,afEnd);
animation_create(array,playerANI.drown,sprite,10,3,afEnd);

var sprite = sprPlayer_Sonic_Victory;
animation_create(array,playerANI.victoryJump,sprite,60,0,1,afBack,1);

// Set animation array
sonicAnimationArray = array;
#endregion

// Macros


// Fonts
#macro fontmapSonicSmall "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&!:,'" + chr(34) + "/.<>-1234567890*"
#macro titlecard_fontmap "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"