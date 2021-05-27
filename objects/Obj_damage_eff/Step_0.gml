/// @description Insert description here
// You can write your code in this editor
depth = -500;
cnt += global.timeScale;
var _channel = animcurve_get_channel(ac_damage_ypos, 0);
var _val = animcurve_channel_evaluate(_channel, cnt / 30);
y = curY - _val * up_speed * global.timeScale;
image_xscale = 0.7 - power(1 - cnt/30, 5);
image_yscale = 0.7 - power(1 - cnt/30, 5);


for(var i = 0; i < 12; i++){
	if(Alarm[i] > 0){
		Alarm[i] -= global.timeScale;	
	} else if(Alarm[i] <= 0 && Alarm[i] > ALARMINACTIVE){
		Alarm[i] = ALARMINACTIVE;
		event_perform(ev_alarm,i)
	}
}