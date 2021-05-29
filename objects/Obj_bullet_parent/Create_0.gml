/// @description Insert description here
// You can write your code in this editor
damage = 0;
dir = 0;
spd = 0;
par = noone;
Scr_update_depth(x,y);
cur_room = Scr_get_room_pos(x,y);
image_speed = global.timeScale;


for(var i = 0; i < 12; i++){
	Alarm[i] = ALARMINACTIVE;
}
