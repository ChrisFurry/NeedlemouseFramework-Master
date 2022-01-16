/// @description Initionalize Variables
// Setup Global Variables
globalvar g_event,g_gamemode,g_debug_mode,debug_view,needle_personaltouch,camera_extend,sfx_volume,mus_volume;

// Screen Size
screen_xscale = 424;
screen_yscale = 242;

// Window Size
window_scale = 1;
window_changescale = false;

// Volume Variables
sfx_volume = 1;
mus_volume = 1;

// Death Event
deadTimer = 0;

// Pause Event
gamePaused = false;

// Surface
surface = -1;

// Cool needlemouse specific variables
needle_personaltouch = true;
// Literally all it does is make you go faster in S-Tunnels

// Other Debug Stuff
dev_menu_active = debug_mode;
g_debug_mode = debug_mode;
debug_view = false;

// Misc
camera_extend = false;

// Event System
g_event = gameEvents.none;
//-Game Event Enum
enum gameEvents {
	none = -1,
	playing = 0,
	endlevel = 1,
	cutscene = 2,
	paused = 3,
	playerdead = 4
}

// Gamemode System
g_gamemode = gamemode.none;
//-Gamemode Enum
enum gamemode {
	none = -1,
	normal = 0,
	time_attack = 1
}
depth = -5;