/// @description Insert description here
// You can write your code in this editor
anim_idx += global.timeScale;
real_idx = anim_idx div 10;
if(anim_idx >= 120){
	instance_destroy(self);
}

Scr_alarm_step();