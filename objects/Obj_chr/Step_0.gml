anim_maxIndex = image_number;

if(anim_index < (anim_maxIndex) * anim_fps - 1){
	anim_index += global.timeScale;
} else{
	anim_index = 0;
}


Scr_alarm_step();

Scr_SM_execute();