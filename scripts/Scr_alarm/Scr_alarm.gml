// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_alarm_init(){
	for(var i = 0; i < 12; i++){
		Alarm[i] = ALARMINACTIVE;
	}
}


function Scr_alarm_step(){
	for(var i = 0; i < 12; i++){
		if(Alarm[i] > 0){
			Alarm[i] -= global.timeScale;	
		} else if(Alarm[i] <= 0 && Alarm[i] > ALARMINACTIVE){
			Alarm[i] = ALARMINACTIVE;
			event_perform(ev_alarm,i)
		}
	}
}