/// @description Insert description here
// You can write your code in this editor
sprite_index = Spr_destructable_box_broke;
image_speed = 0;
image_index = irandom(image_number - 1);

hspd = 0;
vspd = -4 + random(2);

for(var i = 0; i < 12; i++){
	Alarm[i] = ALARMINACTIVE;
}

grav = 0.2;
Alarm[0] = irandom(5) + 30;
Alarm[1] = irandom(20) + 100;

image_speed = global.timeScale;

