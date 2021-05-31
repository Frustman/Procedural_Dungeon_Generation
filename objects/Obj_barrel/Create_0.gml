/// @description Insert description here
// You can write your code in this editor
sprite_index = Spr_destructable_box_hit;
image_speed = 0;
image_index = 0;
penetrate = false;


hit = false;

ac_cnt = 0;
hp = 10;

Scr_update_depth(x,y);

for(var i = 0; i < 12; i++){
	Alarm[i] = ALARMINACTIVE;
}
