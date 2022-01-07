/// @description Insert description here
// Base
draw_sprite(baseSprite,-1,xstart,ystart);

// Logs
var i = 1;
var time = angle_wrap(swingAngle);
repeat(pieces){
	var distLogX = (i * sprite_get_width(pieceSprite));
	var distLogY = (i * sprite_get_height(pieceSprite));
	var xpos = round(xstart + (cosine[time] * distLogX));
	var ypos = round(ystart + (sine[time] * distLogY));
	draw_sprite(pieceSprite,-1,xpos,ypos);
	i ++;
}

// Platform
draw_sprite(platformSprite,-1,x,y);