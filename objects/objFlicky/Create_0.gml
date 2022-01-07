/// @description Init
yspeed = -6;
grav = 0.21012;
state = 0;
dir = choose(-1,1);
spriteFrame = 0;
ybounce = -6;
// Flicky's are all in one sprite, but use an offset to change flickys.
// I don't know if there's a better way to do this
var lol = [0];
var i = 0;
var u = 0;
repeat(sprite_get_number(sprite_index) / 3){
	if((objRoomDefiner.flickyListFlag & power(2,i)) != 0 || objRoomDefiner.flickyListFlag == 0){
		lol[u] = i;
		u ++;
	}
	i ++;
}
randomize();
spriteOffset = lol[irandom_range(0,array_length(lol) - 1)];