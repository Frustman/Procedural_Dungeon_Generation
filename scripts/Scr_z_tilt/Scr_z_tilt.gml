// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_z_tilt(){

}

function Scr_z_tilt_set(){
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	shader_set(Sha_z_tilt);
	shader_enable_corner_id(true);
}

function Scr_z_tilt_reset(){
	shader_reset();
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	shader_enable_corner_id(false);
}