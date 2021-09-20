// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_z_tilt(){

}

function Scr_z_tilt_set(){
	if event_number!=0 exit
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	shader_enable_corner_id(true);
}

function Scr_z_tilt_reset(){
	if event_number!=0 exit
	shader_enable_corner_id(false);
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
}