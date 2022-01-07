/// @description 
draw_sprite(sprGoalPost_post,0,x,y);
switch(state){
	case 0:
		draw_sprite(sprGoalPost_Eggman,eggmanFrame,x,y);
		break;
	case 1:
		if(rotation < 180)draw_sprite_ext(sprGoalPost_Eggman,eggmanFrame,x + (cos(degtorad(rotation)) * (sprite_get_width(sprGoalPost_side) / 2)),y,abs(sin(degtorad(rotation))),1,0,c_white,1);
		if(rotation >= 180)draw_sprite_ext(postSprite,0,x + (-cos(degtorad(rotation)) * (sprite_get_width(sprGoalPost_side) / 2)),y,abs(sin(degtorad(rotation))),1,0,c_white,1);
		
		if(rotation > 90 && rotation < 270)draw_sprite_ext(sprGoalPost_side,0,x + (sin(degtorad(rotation)) * (sprite_get_width(sprGoalPost_Eggman) / 2)),y,abs(cos(degtorad(rotation))),1,0,c_white,1);
		if(rotation < 90 || rotation > 270)draw_sprite_ext(sprGoalPost_side,0,x + (-sin(degtorad(rotation)) * (sprite_get_width(sprGoalPost_Eggman) / 2)),y,abs(cos(degtorad(rotation))),1,0,c_white,1);
		break;
	default:
		draw_sprite(postSprite,0,x,y);
		break;
}