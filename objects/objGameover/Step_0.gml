/// @description Its a lazy game over obj lol
timer ++;
if(timer < 180)textDist = max(textDist - 14,16);

if(keyboard_check_pressed(vk_enter))timer = min(timer,get_time_frames(0,0,10));

if(!Finished && timer > get_time_frames(0,0,10)){
	fade += fade_spd * fade_dir;
	if(fade_dir == -1 && fade <= 0)Finished = true;
	if(fade_dir == 1 && fade >= 2)Finished = true;
}