/// @description Insert description here
// You can write your code in this editor
if(instance_exists(Obj_chr)){
	x = Obj_chr.x;
	y = Obj_chr.y;
}

global.timeScale = lerp(global.timeScale, 1.0, 0.05);