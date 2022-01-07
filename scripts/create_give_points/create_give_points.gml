function create_give_points(x,y,pointsID,playerID){
	// I'm sorry for this hardcoded bs i dont rlly know the best way to code this stuff
	var playernumb = playerID.player_id;
	switch(pointsID){
		case 0:
			objGameData.player_score[playernumb] += 100;
			break;
		case 1:
			objGameData.player_score[playernumb] += 200;
			break;
		case 2:
			objGameData.player_score[playernumb] += 500;
			break;
		case 3:
			objGameData.player_score[playernumb] += 1000;
			break;
		case 4:
			objGameData.player_score[playernumb] += 10000;
			break;
		default:
			objGameData.player_score[playernumb] += 100000;
			break;
	}
	var points = instance_create_depth(x,y,3,objVisiblePoints);
	points.image_index = min(pointsID,sprite_get_number(sprPoints));
}