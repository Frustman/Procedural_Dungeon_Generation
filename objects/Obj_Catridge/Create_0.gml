/// @description Insert description here
// You can write your code in this editor

hspd = 0;
vspd = -4 + random(2);

for(var i = 0; i < 12; i++){
	Alarm[i] = ALARMINACTIVE;
}

grav = 0.2;
Alarm[0] = irandom(5) + 30;


image_speed = global.timeScale;

