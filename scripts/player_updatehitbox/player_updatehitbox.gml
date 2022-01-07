function player_updatehitbox(){
	sprite_set_bbox_mode(hitboxSprite,bboxmode_manual);
	sprite_set_offset(hitboxSprite,hitbox_width,hitbox_height - hitbox_yoffset);
	sprite_set_bbox(hitboxSprite,0,0,hitbox_width * 2 + 1,hitbox_height * 2 + 1);
	mask_index = hitboxSprite;
}