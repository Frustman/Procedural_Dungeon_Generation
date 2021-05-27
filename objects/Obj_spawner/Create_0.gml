/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < 12; i++){
	Alarm[i] = ALARMINACTIVE;
}

Alarm[0] = 60;
obj = (irandom(1) == 0) ? Obj_enemy_contextMap : Obj_enemy_perlinNoise;