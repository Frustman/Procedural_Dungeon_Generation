/// @description Insert description here
// You can write your code in this editor
if(instance_exists(Obj_chr)){
	x = Obj_chr.x;
	y = Obj_chr.y;
}

//global.timeScale = lerp(global.timeScale, 1.0, 0.05);


for(var i = 0; i < 12; i++){
	if(Alarm[i] > 0){
		Alarm[i] -= global.timeScale;	
	} else if(Alarm[i] <= 0 && Alarm[i] > ALARMINACTIVE){
		Alarm[i] = ALARMINACTIVE;
		event_perform(ev_alarm,i)
	}
}