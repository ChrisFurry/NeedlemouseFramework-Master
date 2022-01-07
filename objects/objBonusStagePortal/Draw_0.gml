/// @description Draw Sparkles
temp1 = value5;
var temp4 = sine[angle_wrap(value6)];
temp4 *= 3;
value8 = value6;
value8 &= 15;
value8 = value8 >> 2;
value8 += value4;
repeat(4){
	var sparkle_x = sine[angle_wrap(temp1)];
	sparkle_x = sparkle_x * 24;
	var sparkle_y = cosine[angle_wrap(temp1)];
	sparkle_y = sparkle_y * 10;
	var temp5 = sine[angle_wrap(temp1)];
	temp5 *= temp4;
	sparkle_y += temp5;
	sparkle_x *= sparkle_spread;
	sparkle_x = sparkle_x >> 7;
	sparkle_y *= sparkle_spread;
	sparkle_y = sparkle_y >> 7;
	sparkle_x += x;
	sparkle_y += y;
	draw_sprite(sprBSSparkles,value8,sparkle_x,sparkle_y);
	temp1 += 128;
}