/// @description Insert description here
// You can write your code in this editor

chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);

width = (bbox_bottom - bbox_top)*3/5;
height = (bbox_left - bbox_right)*3/5;

for(var i = -1;i < 2; i++){
	for(var j = -1 ; j < 2; j++){
		if(i == 0 || j == 0) in_sight = collision_line(x + width / 2 * i,y + height / 2 * j,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;
		if(in_sight) break;
	}
	if(in_sight) break;
}

if(knuckback){
	Scr_force_update([global.timeScale * lengthdir_x(2,point_direction(x,y,Obj_chr.x,Obj_chr.y) - 180),global.timeScale * lengthdir_y(2,point_direction(x,y,Obj_chr.x,Obj_chr.y) - 180)]);
	knuckback = false;
}

xscale = -sign(lengthdir_x(1,moveAngle));
if(xscale == 0) xscale = -1;

if(hit){
	ac_cnt += global.timeScale;
	var _channel = animcurve_get_channel(ac_hit_scale, 0);
	var _val = animcurve_channel_evaluate(_channel, ac_cnt / 6);
	xscale = sign(xscale) * _val;
	yscale = _val;
} else {
	xscale = sign(xscale) * 1.0;
	yscale = 1.0;
}

anim_maxIndex = image_number;

if(anim_index < (anim_maxIndex) * anim_fps){
	anim_index += global.timeScale;
} else{
	anim_index = 0;
}

real_index = anim_index div anim_fps;



for(var i = 0; i < 12; i++){
	if(Alarm[i] > 0){
		Alarm[i] -= global.timeScale;	
	} else if(Alarm[i] <= 0 && Alarm[i] > ALARMINACTIVE){
		Alarm[i] = ALARMINACTIVE;
		event_perform(ev_alarm,i)
	}
}