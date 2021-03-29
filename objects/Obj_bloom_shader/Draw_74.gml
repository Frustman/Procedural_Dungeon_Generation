/// @description Insert description here
// You can write your code in this editor
var blur_steps		= round(0.1 * 15) + 1;
var sigma			= max(0.5, 0.0001);
var bloom_threshold = 0.3;
var bloom_range		= 0.1;
var bloom_intensity	= 0.25 * 2;
var bloom_darken	= 0.9;
var bloom_saturation= 1 * 2;


time			+= 0.2 * 0.02;
var size		= 0.2 * 4;
var strength	= 0.1 * 0.01;

// DRAW:
//-----------------------------------------------------------------------------
if (!surface_exists(srf_ping)) {
	srf_ping = surface_create(gui_w, gui_h);
	bloom_texture = surface_get_texture(srf_ping);
}
if (!surface_exists(srf_pong)) {
	srf_pong = surface_create(gui_w, gui_h);
}
if (!surface_exists(srf_final)) {
	srf_final = surface_create(gui_w, gui_h);
}


// 1st pass: Draw brights to bloom surface:
// AppSrf -> srf_ping
shader_set(shader_bloom_lum);
	shader_set_uniform_f(u_bloom_threshold,		bloom_threshold);
	shader_set_uniform_f(u_bloom_range,			bloom_range);
	
	surface_set_target(srf_ping);
		draw_surface(application_surface, 0, 0);
	surface_reset_target();
	
// 2nd pass: blur horizontally
// srf_ping -> srf_pong
gpu_set_tex_filter(true);
shader_set(shader_blur);
	shader_set_uniform_f(u_blur_steps,		blur_steps);
	shader_set_uniform_f(u_sigma,			sigma);
	shader_set_uniform_f(u_blur_vector,		1, 0);
	shader_set_uniform_f(u_texel_size,		texel_w, texel_h);
	
	surface_set_target(srf_pong);
		draw_surface(srf_ping, 0, 0);
	surface_reset_target();
	
// 3rd pass: blur vertically
// srf_pong -> srf_ping
	shader_set_uniform_f(u_blur_vector,		0, 1);
	
	surface_set_target(srf_ping);
		draw_surface(srf_pong, 0, 0);
	surface_reset_target();
	
gpu_set_tex_filter(false);

// 4th pass: Blend bloom surface with app surface
// AppSrf & srf_ping -> screen
surface_set_target(srf_final);
shader_set(shader_bloom_blend);
	shader_set_uniform_f(u_bloom_intensity, bloom_intensity);
	shader_set_uniform_f(u_bloom_darken, bloom_darken);
	shader_set_uniform_f(u_bloom_saturation, bloom_saturation);
	texture_set_stage(u_bloom_texture, bloom_texture);
	gpu_set_tex_filter_ext(u_bloom_texture, true);
	draw_surface(application_surface, 0, 0);	
shader_reset();
surface_reset_target();
gpu_set_tex_filter_ext(u_distort_tex, true);

shader_set(shader);
	texture_set_stage(u_distort_tex, distort_tex);
	shader_set_uniform_f(u_time, time);
	shader_set_uniform_f(u_size, size);					// should be turned into a constant once you're happy with the setting
	shader_set_uniform_f(u_strength, strength);			// should be turned into a constant once you're happy with the setting
	draw_surface(srf_final, 0, 0);
shader_reset();