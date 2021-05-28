/// @description Insert description here
// You can write your code in this editor

Alarm[0] = 62;
justdodge = true;
mask_index = Spr_chr_msk_just;
Alarm[9] = 5;
	Scr_shake(0,1,0,62);
//Scr_shake(0,0,30,30);
	//Scr_slow_motion(0.2);
	Obj_camera.targetTimeScale = 0.2;

anim_index = 0;
dashDir = other.directionBox;
dashSpeed = 8;
dash = true;
with(Obj_shader){
	var new_wave = ds_list_create();
	new_wave[|waveparam.xx]		= other.x;
	new_wave[|waveparam.yy]		= other.bbox_bottom;
	new_wave[|waveparam.age]	= 0;
	new_wave[|waveparam.scale]	= 0;
	new_wave[|waveparam.alpha]	= 1;
	new_wave[|waveparam.life]	= 1;
	new_wave[|waveparam.maxScale]	= 1;

	ds_list_add(list_of_waves, new_wave);
}