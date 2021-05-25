/// @description Insert description here
// You can write your code in this editor

anim_maxIndex = image_number;

if(anim_index < (anim_maxIndex) * anim_fps){
	anim_index += global.timeScale;
} else{
	anim_index = 0;
}

real_index = anim_index div anim_fps;

motion_set(dir,spd * global.timeScale);