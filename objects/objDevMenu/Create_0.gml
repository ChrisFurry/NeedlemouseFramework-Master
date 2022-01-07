/// @description Init
allRooms = 0;
while(room_exists(allRooms + 1))allRooms ++;

currMenu = devMenu.main;
currSel = 0;
returnMenu = devMenu.main;
holdBuffer = 0;

enum devMenu {
	main,
	charsel,
	roomsel,
	options,
	controls,
	collect_input,
	volume
}