/// @description Init
currentMusic = -1;
soundID = -1;
musicLoopPoint = 0;
musicLoopEnd = 0;
levelMusic = 0;
musicSavedPos = 0;

// HOW TO USE SWITCHTO
// [ Song ID, Fade Speed, Fade? ]
switchTo = [-1,-1,0];
switchActive = false;
switchFade = 1;

invincibleMusic = musInvincible;

// HOW THE MUSIC LOOP ARRAY WORKS!!
// --------------------------------
// [ The loop point, where the song loops too, The end of the loop, where the song would end then loop]
// [0,0] makes it loop from beginning to end.
musicLoopArray[musInvincible] = [0,0];
//musicLoopArray[musGHZ2] = [12.157,103.191]; used dif music