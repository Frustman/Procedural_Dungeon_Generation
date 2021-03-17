/// @description Insert description here
// You can write your code in this editor
alarm[0] = 27;
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

	ds_list_add(list_of_waves, new_wave);	
}