/// @description Reset Variables, Update Player, Update Music, Create Camera, Preload
// Check for zone object
var temp0 = false;
if(instance_exists(objRoomDefiner))temp0 = true;
// Set up Camera Object and Variables
globalvar cameraobj;
cameraobj[0] = instance_create_depth(0,0,0,objCamera);
cameraobj[0].number_id = 0;
if(!temp0){
	// Disable Player
	cameraobj[0].camera_followplayer = false;
	with(objPlayer)state = -1;
	with(objGameGui)gui_player_enabled = false;
	// Change BG
	objBackground.currentBG = "";
	// Update Music
	objMusic.switchActive = true;
	objMusic.switchTo = [-1,0.05,1];
	objMusic.levelMusic = -1;
	// Set event
	g_event = gameEvents.none;
}else{
	if(objRoomDefiner.playable){
		// Get spawn location
		var spawnx = 0;
		var spawny = 0;
		var spawndir = 1;
		if(instance_exists(spawnpoint_object)){
			spawnx = spawnpoint_object.x;
			spawny = spawnpoint_object.y;
			spawndir = spawnpoint_object.image_xscale;
		}
		if(checkpoint_active && room == checkpoint_room && instance_exists(checkpoint_object)){
			spawnx = checkpoint_object.x;
			spawny = checkpoint_object.y;
			spawndir = checkpoint_object.image_xscale;
		}
		// Position and Update player
		with(objPlayer){
			x = spawnx;
			y = spawny;
			dir = spawndir;
			visible = true;
			if(state == -1 || state == playerState.Victory)state = 0;
		}
		// Position Camera
		cameraobj[0].camera_xtarget = player[0].x - (view_wport[0] / 2);
		cameraobj[0].camera_ytarget = player[0].y - (view_hport[0] / 2);
		cameraobj[0].camera_x = player[0].x - (view_wport[0] / 2);
		cameraobj[0].camera_y = player[0].y - (view_hport[0] / 2);
		// Clamp
		cameraobj[0].camera_x = clamp(cameraobj[0].camera_x,0,room_width - view_wport[0]);
		cameraobj[0].camera_y = clamp(cameraobj[0].camera_y,0,room_height - view_hport[0]);
		// Change Event
		g_event = gameEvents.playing;
		// Spawn Titlecard
		with(objGameGui)gui_player_enabled = true;
		if(spawnTitlecard){
			var tc = instance_create_depth(0,0,-20,objTitleCard);
			tc.drawBlack = titlecardBlack;
		}
	}else{
		// Disable Player
		cameraobj[0].camera_followplayer = false;
		with(objPlayer)state = -1;
		with(objGameGui)gui_player_enabled = false;
		// Change BG
		objBackground.currentBG = "";
		// Update Music
		objMusic.switchActive = true;
		objMusic.switchTo = [-1,0.05,1];
		objMusic.levelMusic = -1;
		// Set event
		g_event = gameEvents.none;
	}
	playerHasControl[0] = true;
	// No Hud Level
	if(objRoomDefiner.zoneType == "NoHud")with(objGameGui)gui_player_enabled = false;
	// Change Background
	objBackground.currentBG = objRoomDefiner.BG_Name;
	// Update Music
	objMusic.switchActive = true;
	objMusic.switchTo = [objRoomDefiner.zoneMusic,1,0];
	objMusic.levelMusic = objRoomDefiner.zoneMusic;
}

// Load Sprites
//-Get the id's of the texture pages needed to preload
var texturePages = texturegroup_get_textures("playerSpriteGroup");
if(temp0){
	var tp2 = texturegroup_get_textures("titlecardTextureGroup");
	array_copy(texturePages,array_length(texturePages),tp2,0,array_length(tp2));
}
//-Global Assets
var tp2 = texturegroup_get_textures("globalLevelObjTextureGroup");
array_copy(texturePages,array_length(texturePages),tp2,0,array_length(tp2));
//-Tiles
sprite_prefetch(tileCollTiles);
sprite_prefetch(sprCollTilesInd);
//-Fonts
sprite_prefetch(sprSmallFont);
//-Level's Requirements
switch(room){
	case zoneGHZ2:
		//-Grab GHZ Assets
		var tp2 = texturegroup_get_textures("greenHillZoneTextureGroup");
		array_copy(texturePages,array_length(texturePages),tp2,0,array_length(tp2));
		break;
}
//-Texture Pages
for(var i = 0;i < array_length(texturePages);i ++)texture_prefetch(texturePages[i]);
// Load Sounds
audio_group_load(playerAudioGroup);
audio_group_load(globalLevelObjAudiogroup);