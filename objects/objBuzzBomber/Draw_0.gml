/// @description Draw da buzz
draw_sprite_ext(sprite_index,(state == 2),x,y,dir,1,0,c_white,1);
draw_sprite_ext(sprBuzzBomberWings,globalTimer mod 2,x,y,dir,1,0,c_white,1);
if(state == 2 && timer > 40){
	if(timer < 50){
		draw_sprite_ext(sprBuzzBomberShootDelay,0,x + launchxoff * dir,y + launchyoff,dir,1,0,c_white,1);
	}else{
		draw_sprite_ext(sprBuzzBomberShootDelay,1,x + launchxoff * dir,y + launchyoff,dir,1,0,c_white,1);
	}
}