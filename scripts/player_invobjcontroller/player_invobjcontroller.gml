function player_invobjcontroller(){
	if(invincible != 1){
		if(inv_child > -1 && instance_exists(inv_child))instance_destroy(inv_child);
		inv_child = -1;
		exit;
	}
	if((inv_child == -1 && invincible == 1) || (!instance_exists(inv_child) && invincible == 1)){
		inv_child = instance_create_depth(x,y,depth - 1,objInvSparkles);
		inv_child.parentObj = id;
	}
}