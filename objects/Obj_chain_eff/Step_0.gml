/// @description Insert description here
// You can write your code in this editor
anim_idx += global.timeScale;
real_idx = anim_idx div 10;
if(anim_idx >= 120){
	instance_destroy(self);
}


for(var i = 0; i < 12; i++){
	if(Alarm[i] > 0){
		Alarm[i] -= global.timeScale;	
	} else if(Alarm[i] <= 0 && Alarm[i] > ALARMINACTIVE){
		Alarm[i] = ALARMINACTIVE;
		event_perform(ev_alarm,i)
	}
}