/// @description Insert description here
// You can write your code in this editor
shader_set_uniform_f(Obj_bloom_shader.u_bloom_layer_intensity,	Scr_slider_get(0 + offset));
shader_set_uniform_f(Obj_bloom_shader.u_bloom_layer_threshold,	Scr_slider_get(1 + offset));
shader_set_uniform_f(Obj_bloom_shader.u_bloom_layer_range,		Scr_slider_get(2 + offset));
