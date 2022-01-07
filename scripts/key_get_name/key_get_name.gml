function key_get_name(input){
	switch(input){
		case vk_space:
			return "Space";
			break;
		case vk_enter:
			return "Enter";
			break;
		case vk_backspace:
			return "Backspace";
			break;
		case vk_delete:
			return "Delete";
			break;
		case vk_up:
			return "Up";
			break;
		case vk_down:
			return "Down";
			break;
		case vk_left:
			return "Left";
			break;
		case vk_right:
			return "Right";
			break;
		default:
			return chr(input);
			break;
	}
}