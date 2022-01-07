/// @description Move the awesome

if(!event_is_playing(false))exit;

swingSpeed = swingSpeed - swingGravity * cosine[angle_wrap(swingAngle)];
swingAngle += swingSpeed;

var distLogX = (pieces * sprite_get_width(pieceSprite)) + (sprite_get_width(pieceSprite) / 2);
var distLogY = (pieces * sprite_get_height(pieceSprite)) + (sprite_get_height(pieceSprite) / 2);
var time = angle_wrap(swingAngle);

x = round(xstart + (cosine[time] * distLogX));
y = round(ystart + (sine[time] * distLogY));

// Inherit the parent event
event_inherited();

