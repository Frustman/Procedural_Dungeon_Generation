/// @description Insert description here
// You can write your code in this editor
index += global.timeScale;
depth = -500;


for(var i = 0; i < 12; i++){
	if(Alarm[i] > 0){
		Alarm[i] -= global.timeScale;	
	} else if(Alarm[i] <= 0 && Alarm[i] > ALARMINACTIVE){
		Alarm[i] = ALARMINACTIVE;
		event_perform(ev_alarm,i)
	}
}