// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_shader_handler(){

}


function Scr_bloom_set_uniform(_intensity, _threshold, _range){
	shader_set_uniform_f(Obj_bloom_shader.u_bloom_layer_intensity,	_intensity);
	shader_set_uniform_f(Obj_bloom_shader.u_bloom_layer_threshold,	_threshold);
	shader_set_uniform_f(Obj_bloom_shader.u_bloom_layer_range,		_range);
}

