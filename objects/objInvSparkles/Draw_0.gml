/// @description Draw inv Sparkles
var dist = 16;
// Calculate the angles for each sparkle
var angle = angle_wrap(global.globalTimer * 12);
var angle2 = angle_wrap(angle - (360 / 2));
var angle3 = angle_wrap(-global.globalTimer * 12);
var angle4 = angle_wrap(angle + (360 / 2));
draw_sprite(sprite_index,global.globalTimer,x + (sine[angle] * dist),y + (cosine[angle] * dist));
draw_sprite(sprite_index,global.globalTimer - (sprite_get_number(sprite_index) / 2),x + (sine[angle2] * dist),y + (cosine[angle2] * dist));
var olddatadist = 5;
var olddata = record_pos[clamp(((globalTimer - olddatadist) mod 60),0,59)];
var imgind = round(global.globalTimer / 2) * 2;
draw_sprite(sprite_index,imgind,olddata[0] + (sine[angle3] * dist),olddata[1] + (cosine[angle3] * dist));
draw_sprite(sprite_index,imgind - (sprite_get_number(sprite_index) / 2),olddata[0] + (sine[angle4] * dist),olddata[1] + (cosine[angle4] * dist));