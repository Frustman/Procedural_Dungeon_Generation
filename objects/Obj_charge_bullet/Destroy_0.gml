/// @description Insert description here
// You can write your code in this editor

with(Obj_shader){
	var new_wave = ds_list_create();
	new_wave[|waveparam.xx]		= other.x;
	new_wave[|waveparam.yy]		= other.y;
	new_wave[|waveparam.age]	= 0;
	new_wave[|waveparam.scale]	= 0;
	new_wave[|waveparam.alpha]	= 0.5;
	new_wave[|waveparam.life]	= 0.5;
	new_wave[|waveparam.maxScale]	= 0.3;

	ds_list_add(list_of_waves, new_wave);
}
