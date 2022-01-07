/// @description Draw Checkpoint
draw_sprite(baseSprite,0,x,y);
if(state == 1){
	var ringframe = (globalTimer / 5) mod sprite_get_number(sprRingCollect);
	var posX = x;
	var posY = y - 24;
	draw_sprite(sprRingCollect,ringframe,posX + (ballXOffset / 5),posY + (ballYOffset / 5));
	draw_sprite(sprRingCollect,ringframe,posX + (ballXOffset / 3),posY + (ballYOffset / 3));
	draw_sprite(sprRingCollect,ringframe,posX + (ballXOffset / 2),posY + (ballYOffset / 2));
	draw_sprite(sprRingCollect,ringframe,posX + (ballXOffset / 1.5),posY + (ballYOffset / 1.5));
	draw_sprite(sprRingCollect,ringframe,posX + (ballXOffset / 1.25),posY + (ballYOffset / 1.25));
}
draw_sprite(ballSprite,ballFrame,x + ballXOffset,y - 24 + ballYOffset);