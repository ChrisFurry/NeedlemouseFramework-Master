function player_shieldcontroller(){
	if(currShield == 0 || invincible == 1){
		if(shield_child > -1 && instance_exists(shield_child))instance_destroy(shield_child);
		shield_child = -1;
		exit;
	}
	if((shield_child == -1 && currShield != 0) || (!instance_exists(shield_child) && currShield != 0)){
		shield_child = instance_create_depth(x,y,depth - 1,objShield);
		shield_child.parentObj = id;
	}
	if(instance_exists(shield_child)){
		switch(currShield){
			case 1: // Normal Shield
				shield_child.sprite_index = sprNormalShield;
				break;
		}
	}
}