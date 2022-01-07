function create_effect(spriteID,imageSpeed,x,y,depth){
	var effect = instance_create_depth(x,y,depth,objEffect);
	effect.sprite_index = spriteID;
	effect.image_speed = imageSpeed;
	return effect;
}