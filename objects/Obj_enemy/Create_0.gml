/// @description Insert description here
// You can write your code in this editor
var bbox_w = abs(bbox_left - bbox_right) / 2;
var bbox_h = abs(bbox_top - bbox_bottom) / 2;

sprite_rad = max(bbox_w, bbox_h, sqrt(bbox_w*bbox_w + bbox_h*bbox_h));

hitList = ds_list_create();

maxhp = 20;
hp = 20;

image_speed = global.timeScale;

ac_cnt = 0;

xscale = 1;
yscale = 1;

height = abs(bbox_bottom - bbox_top)*3/5;
width = abs(bbox_left - bbox_right)*3/5;

hit = false;
knuckback = false;
in_sight = false;
state_change = true;
state = ai_state.wandering;
boss = false;
real_index = 0;
moveAngle = 0;
moveSpeed = 0;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;


Scr_update_depth(x,y);

dx = 0;
dy = 0;


for(var i = 0; i < 12; i++){
	Alarm[i] = ALARMINACTIVE;
}
