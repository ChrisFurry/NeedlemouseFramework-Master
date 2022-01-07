/// @description Press Z to win, X to lose


switch(state){
	case 0:
		if(keyboard_check_pressed(ord("Z"))){ // WIN
			objGameData.player_emeralds += power(2,specialstage_number);
			state = 1;
		}
		if(keyboard_check_pressed(ord("X"))){ // LOSE
			state = 2;
		}
		if(state != 0){
			objGameData.specialstage_goto ++;
			if(objGameData.specialstage_goto > 6)objGameData.specialstage_goto = 0;
			repeat(7){
				if((objGameData.player_emeralds & power(2,objGameData.specialstage_goto)) != 0)objGameData.specialstage_goto ++;
				if(objGameData.specialstage_goto > 6)objGameData.specialstage_goto = 0;
			}
		}
		break;
	case 1:
		timer ++;
		if(timer > 180)room_goto(objGameData.return_room);
		break;
	case 2:
		room_goto(objGameData.return_room);
		break;
}