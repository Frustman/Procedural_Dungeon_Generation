/// @description Insert description here
// You can write your code in this editor
targetX = view_wport / 2;
targetY = view_hport / 2;

curX = view_wport / 2;
curY = -200;

Obj_bloom_shader.blur_steps = get_integer_async("blur_steps?" , Obj_bloom_shader.blur_steps);
Obj_bloom_shader.sigma = get_integer_async("sigma?" , Obj_bloom_shader.sigma);
Obj_bloom_shader.bloom_threshold = get_integer_async("bloom_threshold?" , Obj_bloom_shader.bloom_threshold);
Obj_bloom_shader.bloom_range = get_integer_async("bloom_range?" , Obj_bloom_shader.bloom_range);
Obj_bloom_shader.bloom_intensity = get_integer_async("bloom_intensity?" , Obj_bloom_shader.bloom_intensity);
Obj_bloom_shader.bloom_darken = get_integer_async("bloom_darken?" , Obj_bloom_shader.bloom_darken);
Obj_bloom_shader.bloom_saturation = get_integer_async("bloom_saturation?" , Obj_bloom_shader.bloom_saturation);
Obj_bloom_shader.size = get_integer_async("haze size?" , Obj_bloom_shader.size);
Obj_bloom_shader.strength = get_integer_async("haze strength?" , Obj_bloom_shader.strength);