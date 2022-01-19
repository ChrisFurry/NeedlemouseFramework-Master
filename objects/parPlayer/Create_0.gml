/// @description Initialize Variables
// GML
image_speed = 0;

// Identification
player_id = 0;
character_id = 0;

// Speed Constants
accel = 0.046875;
frict = accel;
deacc = 0.5;
airacc = accel * 2;
jump_high = 6.4;
jump_low = 4;
top_gspeed = 6;
// Roll Speed
rollingFrict = accel / 2;
rollingBrake = 0.1484375;

// Slope Constants
fall_speed = 2.5;
slope_factor_up = 0.125;
slope_factor_down = 0.125;

// Slope Defaults
slpfct_default = 0.125;
slpfct_up_default = 0.078125;
slpfct_down_default = 0.3125;

// Speed Variables
xspeed = 0;
yspeed = 0;
gspeed = 0;
max_speed = 16;
grav = 0.21875;
gravAngle = 0; // unused
angle = 0;
angle_fake = 0;

// State Variables
player_is = 0; // FLAG VARIABLE
#macro PLRFLG_BALLFORM = 1
#macro PLRFLG_ROLLING = 2
#macro PLRFLG_SKIDDING = 4
#macro PLRFLG_HURT = 8
#macro PLRFLG_SPRING = 16
#macro PLRFLG_SPINDASH = 32

// OLD CODE?
state = playerState.Default;
// Default State
horizontal_control_lock = 0;
ball_form = false;
rolling = false;
jump_variable = false;
skidding = false;
jumpAbility_used = false;
// Spindash State
spindashRev = 0;
// Hurt State
hurt = 0;
hurtdir = 1;
// Other
attacking = false;

// Animation
animation = 0;
animation_previous = 0;
animation_finish = false;
animation_frame = 0;
animation_subimages = 0;
animation_subimagesforced = 0;
animation_array = "sonicAnimationArray";
// Movement
anim_runspd = 6;
// Angle
angle_smooth = 0;
animation_angle = 0;
// Hud
lifeIcon_index = 0;
// Act Clear
goalpostSprite = sprPlayer_Sonic_Goalpost;
character_name = "Sonic";

// Sensor Variables
sensor_width = 9;
sensor_wall = 10;
sensor_height = 19;
sensor_ywall = 0;
sensor_angle = 0;

// Sensor Defaults
default_sensor_width = 9;
default_sensor_height = 19;
default_sensor_wall = 10;
// Roll
roll_sensor_width = 7;
roll_sensor_height = 14;
roll_sensor_wall = 9;

// Sensor Collisions
floor_id = false;
floor_type = "None";
floor_flip = false;
floor_mirror = false;
wall_id = false;
wall_type = "None";
ceiling_id = false;
ceiling_type = "None";
// Temp Data
tempTileData_Mirror = false;
tempTileData_Flip = false;

grounded = false;

// Controll Variables
key_up = false;
key_down = false;
key_left = false;
key_right = false;
key_a = false;
key_b = false;
key_c = false;
key_up2 = false;
key_down2 = false;
key_left2 = false;
key_right2 = false;
key_a2 = false;
key_b2 = false;
key_c2 = false;

// Noclip Variables
noclipActive = false;
noclipSpd = 0;

// Hitbox Variables
hitbox_width = 8;
hitbox_height = sensor_height - 3;
hitbox_yoffset = 0;
hitboxSprite = sprPlayerHitbox;

// Powerup Variables
invincible = 0;
inv_frames = 0;
speedshoes = false;
speedshoes_frames = 0;
currShield = 0;
shield_child = -1;
inv_child = -1;

// Underwater Variables
underwater = false;
drowning_timer = 0;
water_obj = -1;

// Other Variables
solidLayer = 0;
tileLayerNames = ["CollTiles","CollTiles2"];
dir = 1;
physicsActive = true;
combo = 0;
drowningBubbles_timer = 0;

// Player Enums
enum characterID {
	Sonic = 0,
	Tails = 1,
	Knuckles = 2
}
enum playerState {
	Default,
	Rolling,
	Spindash,
	Peelout,
	Spring,
	Hurt,
	Dead,
	HammerDrop,
	Victory
}