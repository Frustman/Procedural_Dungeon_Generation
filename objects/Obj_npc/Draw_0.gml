/// @description Insert description here
// You can write your code in this editor

shader_set_uniform_f(Obj_bloom_shader.u_bloom_layer_threshold,	1);
shader_set_uniform_f(Obj_bloom_shader.u_bloom_layer_range,		2);
draw_self();