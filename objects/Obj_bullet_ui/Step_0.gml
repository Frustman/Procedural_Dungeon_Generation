/// @description Insert description here
// You can write your code in this editor

if(anim_index < (anim_maxIndex) * anim_fps){
	anim_index++;
} else{
	anim_index = 0;
}
real_index = anim_index / anim_fps;